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
- Ordine del libro rivisto a ottobre 2026 (vedi «Architettura» in `AGENTS.md`):
  capitoli concettuali prima, capitoli tecnici al centro in due parti verdi
  «Strumenti», leggibili da sole o saltabili; nessun vincolo di lunghezza.

## Decisioni valide

- Neurosviluppo nel corpo principale; i due approfondimenti «Oltre *g*» come
  ultima parte. Bibliografia unica in `references.bib`.
- Figure tutte originali, generate in R dentro i capitoli e registrate in
  `progetto/registro-figure.csv`; nessuna immagine, item o tavola importata
  dalle slide. Il caso clinico di `neurosviluppo-dimensionale` è inventato.
- Nessun esercizio di autoverifica per ora.

## Punti aperti

Aggiornati dopo il ricontrollo del 18 ottobre 2026 (verifiche su Crossref,
PubMed e articoli open access). Chiusi: Woodrow e Dearborn (seconda puntata del
simposio, n. 4, ora citati con le loro parti), Cattell (1987), saturazioni
WISC-IV (dichiarate analisi originale, coerenti con Kush e Canivez 2019),
Milwaukee Project (valori verificati su Jensen 1989), Dworak et al. (2023,
tabelle 1-2), cause di morte di Calvin et al. (2017), Frazier et al. (2004),
43% di ADHD nella sindrome di Down (Ekstein et al. 2011), Project 100,000
(categoria IV), fonte della slide sul lavoro (Sackett et al. 2023, IOP),
frecce ondulate di `fig-sintesi`. Restano:

1. Titolo esatto del libro di Serpico (2022), inserito come «L'intelligenza tra
   natura e cultura» sulla base delle slide.
2. Correlazioni familiari (Plomin et al., 2001): cinque righe coincidono con
   Bouchard e McGue (1981); da controllare sul manuale le righe 0,78/93,
   0,24/720, 0,19/1.491 e il numero di coppie DZ (5.533).
3. Cornoldi, *L'intelligenza* (Il Mulino): il sito dell'editore mostra solo
   l'edizione 2009; verificare su copia o OPAC SBN l'anno 2007. Sternberg
   (2002, volume curato) e Schweinhart et al. (2005, Perry Preschool) inseriti a
   mano: controllare su copia. Manuale WAIS-IV (Wechsler, 2008) idem.
4. `intelligenza-e-lavoro`: regole AFQT (non oltre il 4% di categoria IV,
   almeno il 60% sopra il 50° percentile) senza fonte bibliografica (rapporti
   «Population Representation in the Military Services»); valori di
   `tbl-criteri` e `tbl-oltre-g` coincidono con le slide ma non sono confrontati
   uno per uno con Nye (2022), Cucina et al. (2024), Pletzer e Abrahams (2025).
5. `neurosviluppo-dimensionale`: le altre percentuali di `fig-comorbilita`
   corrispondono alla slide ma non sono confrontate con i singoli articoli;
   Turk (2009) non identificato.
6. `cervello-e-intelligenza`: «correlazioni attorno a 0,2» per la sostanza
   bianca (Penke et al. 2012: 10% di varianza con tre fattori) e r = 0,03 del
   vincitore della gara ABCD (Pohl et al. 2019) da verificare.
7. `effetto-flynn`: la frase sul calo nelle indagini internazionali sulle
   competenze scolastiche non ha una fonte specifica.
8. `qualita-della-misura`: «I QI ottenuti con strumenti diversi correlano
   almeno 0,70» senza citazione; valori di Watkins e Smith (2013) non
   ricontrollati sull'articolo.
9. `intelligenza-emotiva-e-costrutti` è breve: si potrebbe ampliare con le
   correlazioni della slide (MSCEIT, TEIQue), dopo averle verificate.
10. Controllo della voce rispetto ai materiali Il Mulino non ripetuto dopo la
    stesura completa.

## Figure: scelte da confermare

1. `fattore-g`: gli ovali s/ε stanno sotto le prove, non sopra come nella
   slide, per evitare incroci di frecce.
2. `alternative-a-g`: in `fig-rete-mutualismo` il legame memoria a lungo
   termine–ragionamento, senza punta nella slide, è una freccia verso il
   ragionamento.
3. `origini-dei-test`: `fig-beta` imita il formato «Cosa manca?» dell'Army Beta
   con disegni originali; gli item storici (pubblico dominio) si potrebbero
   mostrare come immagini dalle fonti originali, dopo verifica della
   provenienza.
4. `perche-studiarla`: nella `fig-foresta`, densa, alcune etichette restano un
   po' sotto la soglia di leggibilità (cex 0,57–0,62).
5. Grafici raster di articoli non ridisegnati (Turkheimer et al. 2003,
   Tucker-Drob e Bates 2016, Sundet 2004, Van Hootegem 2023): ricostruibili
   solo dalle stime pubblicate nelle tabelle degli articoli.

## Note tecniche

- Il PDF usa `newunicodechar` (in `assets/pdf-layout.tex`) per scrivere
  lettere greche e ≈ nel testo; il pacchetto è stato installato nella TinyTeX
  locale dall'archivio congelato di TeX Live 2025, ora repository predefinito di
  `tlmgr`.

- Se il render PDF chiede pacchetti LaTeX mancanti, la TinyTeX locale (TeX Live
  2025) va puntata all'archivio congelato
  `historic/systems/texlive/2025/tlnet-final` prima di usare `tlmgr install`.
