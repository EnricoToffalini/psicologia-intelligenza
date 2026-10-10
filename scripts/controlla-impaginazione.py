"""Controllo geometrico preliminare; non sostituisce la revisione visiva.

Input: XHTML da pdftotext -bbox-layout e PNG da pdftoppm -png.
Output: rapporto JSON e provini numerati, senza modificare il PDF.
Richiede Pillow per i provini; il controllo del testo usa la libreria standard.
"""

import argparse
import json
import math
from pathlib import Path
import xml.etree.ElementTree as ET

from PIL import Image, ImageDraw


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("bbox", type=Path)
    parser.add_argument("--images", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--margin-mm", type=float, default=15)
    args = parser.parse_args()
    args.out.mkdir(parents=True, exist_ok=True)
    root = ET.parse(args.bbox).getroot()
    ns = {"x": "http://www.w3.org/1999/xhtml"}
    pages = root.findall(".//x:page", ns)
    if not pages:
        raise SystemExit("Nessuna pagina nel file bbox")
    margin = args.margin_mm * 72 / 25.4
    report = []
    for number, page in enumerate(pages, 1):
        width, height = float(page.get("width")), float(page.get("height"))
        words = page.findall(".//x:word", ns)
        flags = []
        outside = []
        missing = []
        for word in words:
            x0, y0, x1, y1 = (float(word.get(k)) for k in ("xMin", "yMin", "xMax", "yMax"))
            if x0 < margin or x1 > width - margin or y0 < 0 or y1 > height:
                outside.append(word.text or "")
            if "\ufffd" in (word.text or ""):
                missing.append(word.text)
        if outside:
            flags.append("testo-vicino-al-bordo-o-fuori-pagina")
        if missing:
            flags.append("caratteri-di-sostituzione")
        body = [w for w in words if float(w.get("yMin")) > 35 and float(w.get("yMax")) < height - 40]
        bottom = max((float(w.get("yMax")) for w in body), default=0)
        if not body:
            flags.append("pagina-senza-testo-nel-corpo")
        elif len(body) < 100 or bottom < height * 0.60:
            flags.append("pagina-poco-occupata-da-ispezionare")
        lines = page.findall(".//x:line", ns)
        overlaps = []
        for i, left in enumerate(lines):
            a = [float(left.get(k)) for k in ("xMin", "yMin", "xMax", "yMax")]
            for right in lines[i + 1:]:
                b = [float(right.get(k)) for k in ("xMin", "yMin", "xMax", "yMax")]
                dx = min(a[2], b[2]) - max(a[0], b[0])
                dy = min(a[3], b[3]) - max(a[1], b[1])
                if dx > 8 and dy > 3:
                    overlaps.append([" ".join(left.itertext()).strip(), " ".join(right.itertext()).strip()])
        if overlaps:
            flags.append("possibile-sovrapposizione-di-righe")
        report.append({"pagina": number, "parole": len(words), "segnali": flags,
                       "testo-al-bordo": outside, "glifi": missing,
                       "sovrapposizioni": overlaps, "fine-corpo-pt": round(bottom, 1)})
    (args.out / "rapporto.json").write_text(json.dumps(report, ensure_ascii=False, indent=2), encoding="utf-8")
    pictures = sorted(args.images.glob("pagina-*.png"))
    if len(pictures) != len(pages):
        raise SystemExit(f"PNG ({len(pictures)}) e pagine bbox ({len(pages)}) non corrispondono")
    for sheet in range(math.ceil(len(pictures) / 12)):
        canvas = Image.new("RGB", (1040, 1155), "#d9d9d9")
        draw = ImageDraw.Draw(canvas)
        for slot, picture in enumerate(pictures[sheet * 12:(sheet + 1) * 12]):
            with Image.open(picture) as source:
                thumb = source.convert("RGB")
                thumb.thumbnail((250, 350))
            x, y = 10 + (slot % 4) * 260, 25 + (slot // 4) * 385
            canvas.paste(thumb, (x, y))
            number = sheet * 12 + slot + 1
            draw.text((x, y - 18), f"Pagina {number}", fill="black")
        canvas.save(args.out / f"provino-{sheet + 1:02}.png")
    print(f"{len(pages)} pagine; {sum(bool(p['segnali']) for p in report)} da ispezionare.")
    for page in report:
        if page["segnali"]:
            print(page["pagina"], ", ".join(page["segnali"]))


if __name__ == "__main__":
    main()
