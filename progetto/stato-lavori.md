---
title: "Stato dei lavori"
lang: it
date: 2026-10-10
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

## Note tecniche

- Se il render PDF chiede pacchetti LaTeX mancanti, la TinyTeX locale (TeX Live
  2025) va puntata all'archivio congelato
  `historic/systems/texlive/2025/tlnet-final` prima di usare `tlmgr install`.
