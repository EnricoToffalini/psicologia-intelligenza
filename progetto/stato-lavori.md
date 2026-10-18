---
title: "Stato dei lavori"
lang: it
date: 2026-10-18
---

Documento di lavoro: non è un capitolo e non entra nel libro. Contiene solo lo
stato attuale e i punti aperti; la storia dettagliata è nella cronologia di git.

## Stato

- Sezione didattica completa: 21 capitoli (19 del nucleo più 2 approfondimenti)
  secondo `progetto/PIANO-DIDATTICA.md`. Fase attuale: **revisione**.
- Revisione di coerenza e rigore svolta a ottobre 2026: concezione di *g*
  uniformata, incoerenze fra capitoli corrette, fonti aggiunte; nuove sezioni su
  plusdotazione, equità dei test e doppia eccezionalità; `che-cosa-e` riscritto
  nella voce del libro.
- Repository riorganizzata a ottobre 2026: un solo render (`render.bat`) verso
  `website/`, sito e PDF insieme.

## Decisioni valide

- Neurosviluppo nel corpo principale; i due approfondimenti «Oltre *g*» come
  ultima parte. Bibliografia unica in `references.bib`.
- Figure tutte originali, generate in R dentro i capitoli e registrate in
  `progetto/registro-figure.csv`; nessuna immagine, item o tavola importata
  dalle slide. Il caso clinico di `neurosviluppo-dimensionale` è inventato.
- Nessun esercizio di autoverifica per ora.

## Punti aperti

1. Titolo esatto del libro di Serpico (2022), inserito come «L'intelligenza tra
   natura e cultura» sulla base delle slide.
2. Valori della figura sulle correlazioni familiari (da Plomin et al., 2001) e
   intervalli della figura sulle cause di morte (Calvin et al., 2017): ripresi
   dalle slide, da confrontare con le fonti.
3. Project 100,000, nel capitolo sul lavoro: dati riportati in forma qualitativa
   con rinvio a Warne (2020) e Gregory (2015).
4. `intelligenza-emotiva-e-costrutti` resta sotto le 1.200 parole: decidere se
   ampliarlo o lasciarlo breve.
5. Controllo della voce rispetto ai materiali Il Mulino non ripetuto dopo la
   stesura completa.
6. Frazier et al. (2004) e Oh et al. (2023): metadati verificati, valori citati
   da confrontare con il testo degli articoli.
7. `che-cosa-e` (riallineato alle slide, ottobre 2026): verificare che le
   definizioni di Woodrow e Dearborn compaiano nella prima puntata del simposio
   del 1921 (pp. 123–147) e non in quelle successive; Cornoldi (2007) e
   Sternberg (2002) inseriti a mano come libri, da controllare su copia.
8. Stile delle figure (deciso): architettura delle slide, stile grafico del
   libro. Avanzamento capitolo per capitolo nella tabella di `AGENTS.md`.
9. `qualita-della-misura`: le saturazioni WISC-IV delle figure a uno e due
   fattori vengono dalle slide (analisi dell'autore, N = 2.200); indicare la
   fonte pubblicata, se esiste, o dichiararle analisi originale.
10. Nuovo riferimento Cattell (1987) inserito a mano come libro: verificare.

## Revisione delle figure (ottobre 2026): punti da verificare

Tutte le figure sono state riallineate alla logica delle slide (vedi
`AGENTS.md`). Restano da controllare:

1. `potenziamento-cognitivo`: numeri del Milwaukee Project (`fig-fadeout`)
   presi dalla slide, da confrontare con Jensen (1989); valutare se citare le
   irregolarità di Heber; Perry Preschool senza citazione specifica; Molloy et
   al. (2025) non citato.
2. `effetto-flynn`: coefficienti di Dworak et al. (2023) in `fig-dworak` presi
   dalla slide, non confrontati con l'articolo.
3. `geni-ambiente-ereditabilita`: in età adulta ora 0,6–0,8 (intervalli della
   slide) invece di 0,7–0,8; formula h² e Falconer resi come equazione e
   tabella, non come schemi.
4. `intelligenza-e-lavoro`: AFQT (non oltre il 4% di categoria IV, almeno il 60%
   sopra il 50° percentile) senza fonte in bibliografia; Project 100,000 («QI
   inferiore a 92 e in parte fino a circa 70») contro la slide (categoria IV,
   QI circa 80–92); valori di `tbl-oltre-g` e `tbl-criteri` verificati solo per
   Sackett et al. (2024); la slide di p. 34 cita Sackett et al. (2023, IOP),
   nel testo c'è `sackett2022revisiting`. Capitoli su lavoro e scuola forse sopra
   le 2.500 parole.
5. `neurosviluppo-dimensionale`: percentuali di `fig-comorbilita` verificate
   solo in parte; Turk (2009) non identificato (43% di ADHD nella sindrome di
   Down senza fonte); «Lee et al. (2016)» della slide sostituito da Quintin et
   al. (2016).
6. `alternative-a-g`: in `fig-rete-mutualismo` il legame memoria a lungo
   termine–ragionamento, senza punta nella slide, è disegnato come freccia
   verso il ragionamento.
7. `modelli-gerarchici`: in `fig-sintesi` mancano le frecce ondulate «minori»
   fra abilità ed esiti della slide; in `fattore-g` gli ovali s/ε stanno sotto
   le prove, non sopra come nella slide, per evitare incroci.
8. `origini-dei-test`: `fig-beta` imita il formato «Cosa manca?» dell'Army Beta
   con disegni originali; gli item storici Binet-Simon e Army Alpha/Beta
   (pubblico dominio) si potrebbero mostrare come immagini dalle fonti
   originali, dopo verifica della provenienza.
9. Grafici raster di articoli non ridisegnati (per esempio Turkheimer et al.
   2003, Tucker-Drob e Bates 2016, Sundet 2004, Van Hootegem 2023): si possono
   ricostruire solo da dati pubblicati.

## Note tecniche

- Il PDF usa `newunicodechar` (in `assets/pdf-layout.tex`) per scrivere
  lettere greche e ≈ nel testo; il pacchetto è stato installato nella TinyTeX
  locale dall'archivio congelato di TeX Live 2025, ora repository predefinito di
  `tlmgr`.

- Se il render PDF chiede pacchetti LaTeX mancanti, la TinyTeX locale (TeX Live
  2025) va puntata all'archivio congelato
  `historic/systems/texlive/2025/tlnet-final` prima di usare `tlmgr install`.
