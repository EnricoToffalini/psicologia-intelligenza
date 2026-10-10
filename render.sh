#!/bin/sh
# Rigenera il sito HTML e il libro PDF in website/ e pulisce i residui del render.
# Il sito (profilo "sito") contiene tutte le sezioni; il PDF (profilo "libro")
# solo la parte didattica. Il PDF passa da _libro/ perché ogni render di Quarto
# svuota la propria cartella di output.
# Uso: sh render.sh
set -e
cd "$(dirname "$0")"
git config core.hooksPath .githooks 2>/dev/null || true
rm -rf _libro
quarto render --profile sito
quarto render --profile libro
mv -f _libro/Psicologia-dell-Intelligenza.pdf website/
rm -rf _libro
rm -f ./*.tex ./*.log
rm -rf site_libs
find didattica divulgazione-pagine professione-pagine -type d -name '*_files' -prune -exec rm -rf {} +
test -f website/Psicologia-dell-Intelligenza.pdf || { echo "ERRORE: manca il PDF in website/"; exit 1; }
echo "Fatto. Sito e PDF aggiornati in website/ - ora puoi fare commit e push."
