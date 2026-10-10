---
title: "Stato della sezione didattica"
lang: it
date: 2026-10-10
---

Documento di lavoro editoriale. Non è un capitolo e non va inserito nella
navigazione del libro.

## Stesura completa (10 ottobre 2026)

Su indicazione dell'utente («facciamo tutto e poi aggiustiamo») sono stati
scritti tutti i capitoli previsti da `PIANO-DIDATTICA.md`, seguendo l'ordine e il
filo delle slide e colmando i passaggi mancanti. Il primo pilota
(`che-cosa-e.qmd`) non è stato modificato.

| Parte | Capitolo | Parole circa | Figure |
|---|---|---:|---:|
| I | `perche-studiarla` | 1.620 | 0 (1 tabella) |
| I | `che-cosa-e` | 1.760 | 0 |
| II | `correlazione` | 1.680 | 3 |
| II | `distribuzioni-e-punteggi` | 2.090 | 2 (1 tabella) |
| II | `qualita-della-misura` | 1.930 | 1 |
| III | `fattore-g` | 1.510 | 1 |
| III | `modelli-gerarchici` | 1.870 | 2 |
| III | `origini-dei-test` | 2.010 | 0 |
| III | `batterie-moderne` | 1.800 | 0 (1 tabella) |
| IV | `geni-ambiente-ereditabilita` | 1.650 | 1 |
| IV | `genetica-molecolare` | 1.660 | 0 |
| IV | `cervello-e-intelligenza` | 1.520 | 1 |
| IV | `effetto-flynn` | 1.920 | 1 |
| IV | `potenziamento-cognitivo` | 1.840 | 1 |
| V | `scuola-e-condizioni-sociali` | 1.150 | 0 |
| V | `salute-e-longevita` | 1.290 | 1 |
| V | `intelligenza-e-lavoro` | 1.260 | 1 |
| VI | `neurosviluppo-dimensionale` | 1.820 | 1 |
| VI | `valutazione-nel-neurosviluppo` | 1.720 | 1 (1 tabella) |
| App. | `intelligenza-emotiva-e-costrutti` | 1.080 | 0 |
| App. | `alternative-a-g` | 1.080 | 1 |

Conteggio approssimativo del testo, esclusi codice, citazioni e intestazioni;
totale circa 35.000 parole.

### Decisioni prese durante la stesura

- Mantenute 19 pagine nel nucleo: «Salute e longevità» resta autonoma, dopo
  un'integrazione su riserva cognitiva e confondenti.
- Neurosviluppo nel corpo principale; i due approfondimenti «Oltre *g*» inclusi
  come ultima parte.
- Slug del capitolo 10 corretto in `geni-ambiente-ereditabilita.qmd`.
- Nessun esercizio di autoverifica per ora; bibliografia unica.
- Figure tutte originali, generate in R dentro i capitoli; registro in
  `didattica/figure/registro-fonti.csv`. Nessuna immagine, item o tavola delle
  slide è stata importata. Il caso clinico del capitolo 18 è costruito ex novo.
- Favicon gestita con `book: favicon`, che risolve il percorso nelle pagine
  annidate.
- `references.bib` ampliato con circa 190 voci, quasi tutte ricavate dai
  metadati Crossref dei DOI; corretta la voce `flynn1987MassiveIQGains`.

### Verifiche svolte

- Render HTML completo del libro in `.quarto/anteprima-didattica/`, senza
  avvisi; nessuna citazione o cross-reference irrisolta.
- Controllo visivo di tutte le figure generate; corretti assi, etichette e
  simulazioni che non corrispondevano alle didascalie.
- Nessun riferimento a esame, lezioni, Moodle o materiali del corso.
- `website/`, `divulgazione-pagine/`, `professione-pagine/` e `slide/` non
  modificati.

### Punti aperti da verificare con l'autore

1. Titolo esatto del libro di Serpico (2022), inserito come «L'intelligenza tra
   natura e cultura» sulla base delle slide.
2. In `qualita-della-misura`, la frase sulle analisi bifattoriali dei dati
   normativi italiani di WISC-IV e IDS-2 non ha una citazione: indicare la fonte
   o riformulare.
3. Valori della figura sulle correlazioni familiari (da Plomin et al., 2001) e
   intervalli della figura sulle cause di morte (Calvin et al., 2017): ripresi
   dalle slide, da confrontare con le fonti.
4. Nel capitolo sul lavoro, i dati sul Project 100,000 sono riportati in forma
   qualitativa con rinvio a Warne (2020) e Gregory (2015).
5. I due approfondimenti restano poco sotto le 1.100 parole: valutare se
   ampliarli o lasciarli brevi per scelta.
6. Il controllo della voce sui materiali Il Mulino non è stato ripetuto per i
   nuovi capitoli. Il render PDF si interrompe prima dei contenuti: manca il
   pacchetto LaTeX `xurl.sty`, richiesto da `styles/pdf-layout.tex`, e la TeX
   Live locale (2025) è troppo vecchia per installarlo automaticamente.
7. `website/` va rigenerato solo quando si decide di pubblicare.

## Preparazione dei piloti (15 settembre 2026)

## Perimetro completato

Ricognizione dei due PDF, letti integralmente nel testo estratto, e progettazione
dei capitoli 2 e 3 di `PIANO-DIDATTICA.md`:

- [Che cosa chiamiamo intelligenza](che-cosa-e.md): 24 pagine PDF.
- [Correlazione e differenze individuali](correlazione.md): 19 pagine PDF.
- [Bibliografia di lavoro](fonti-piloti.bib): riferimenti identificati, con DOI
  o URL; il livello di verifica è dichiarato nei dossier.

Le pagine indicate nei dossier sono quelle fisiche del PDF, contando il
frontespizio come pagina 1. Le chiavi bibliografiche della progettazione vanno
integrate in `references.bib` quando si integrano i piloti. Per il primo pilota
sono ora presenti Gottfredson (1997) e Neisser et al. (1996), insieme alle due
fonti aggiunte durante la stesura: gli Standards del 2014 e Bates e Gignac (2022).

## Decisioni editoriali proposte

1. Mantenere l'ordine definizione → correlazione → distribuzioni e punteggi.
   Nel capitolo sulla correlazione partire dai diagrammi di dispersione;
   spostare la spiegazione mediante punti z al capitolo successivo. Si elimina
   così un prerequisito circolare senza cambiare l'indice.
2. Dedicare il pilota narrativo alla distinzione tra costrutto, prestazione e
   punteggio. Le dimensioni degli effetti su scuola, lavoro e salute spettano
   ai capitoli sugli esiti; non servono a spiegare che cosa sia il QI.
3. Usare esempi numerici dichiaratamente costruiti nel pilota quantitativo.
   Il valore illustrativo `r = 0,50` non va presentato come stima universale
   dell'associazione tra QI e voti.
4. Prevedere zero figure per il primo pilota e due per il secondo, entrambe
   originali. I dossier contengono un triage preliminare, non autorizzazioni al
   riuso delle immagini presenti nei PDF.
5. Valutare voce e lunghezza sui piloti prima di fissare un modello per gli
   altri capitoli. Obiettivo: circa 1.800 parole per ciascuno.

## Stato e passaggio successivo

Questa consegna copre una ricognizione circoscritta e una prima verifica delle
fonti per i due piloti. Non completa l'inventario bibliografico dell'intero libro
né il registro generale delle figure. Le voci marcate «da verificare» non sono
pronte per essere citate a sostegno di affermazioni specifiche.

Con il successivo «procedi», l'utente ha autorizzato la stesura del primo pilota.
È ora disponibile
[Che cosa chiamiamo intelligenza](../didattica/capire-intelligenza/che-cosa-e.qmd):
circa 1.800 parole, sei sezioni, un riquadro «In breve», nessuna figura.
Il capitolo e le sue quattro fonti sono pronti per la revisione editoriale.
La resa visiva nel browser resta da verificare.

La tappa successiva è la revisione del primo pilota, seguita dalla stesura di
«Correlazione» per confrontare i due registri. Non è ancora stata avviata la
produzione estesa e non sono stati creati placeholder degli altri capitoli.

Per la futura integrazione servono inoltre il registro delle figure originali
effettivamente create e la verifica di resa nel tema del sito. I dossier si
possono verificare separatamente con Pandoc e citeproc, senza renderizzare il
libro né intervenire sulle pagine pubblicate.

## Verifiche della ricognizione iniziale

- Render HTML separato dei tre documenti con `quarto pandoc`, `--citeproc`,
  `--csl apa.csl` e `--fail-if-warnings`: completato senza avvisi.
- Otto riferimenti letti correttamente come BibLaTeX/CSL, con chiavi uniche;
  citazioni dei dossier risolte nel render.
- Collegamenti locali controllati; controesempio numerico della relazione a U
  verificato.
- Nessuna modifica a configurazione, bibliografia del sito, output `website/`
  o directory protette. Conservate le modifiche preesistenti.

Gli HTML di controllo sono output temporanei esterni al progetto. Questa
verifica riguarda sintassi e citazioni dei dossier, non la resa visiva dei
futuri capitoli nel tema Quarto del libro. Il controllo generale `git diff
--check` segnala uno spazio finale già presente nella modifica dell'utente a
`.gitignore`, che non è stato corretto in questo task.

## Verifiche del primo capitolo

- Render completo di sei pagine con Quarto 1.7.32 nella copia isolata
  `.quarto/pilota-che-cosa-e/`: riuscito. In questa sola copia il pilota è
  aggiunto alla navigazione, con gli stili e le altre pagine del libro.
- Bibliografia del capitolo ricondotta alla pagina bibliografica comune,
  evitando la ripetizione nel pilota di riferimenti estranei al suo contenuto.
- Quattro chiavi citate risolte; collegamento alla bibliografia verificato.
- Nessun riferimento alla logistica didattica e nessuna figura o item importato.
- Controllo macroscopico della voce sul DOCX Il Mulino effettuato dopo la prima
  stesura. Esempio dell'archivio e percorso argomentativo costruiti prima della
  consultazione; nessun testo del DOCX trasferito.
- Configurazione pubblica, `website/` e directory protette invariate;
  `references.bib` ampliato con quattro voci, conservando quelle esistenti.

L'anteprima locale è
`.quarto/pilota-che-cosa-e/website/didattica/capire-intelligenza/che-cosa-e.html`.
La directory `.quarto/` è già esclusa da Git. Per rigenerare la copia esistente,
aggiornare il capitolo e la bibliografia copiati e usare
`quarto render .quarto/pilota-che-cosa-e --to html`.

Limiti del controllo: il browser della sessione non si è avviato per un errore
del servizio; non è quindi stata verificata visivamente la resa desktop/mobile.
Il controllo dei collegamenti ha inoltre rilevato il percorso relativo
`favicon.ico` ereditato dall'intestazione globale, non risolto dalla pagina
annidata. È un problema di configurazione da affrontare nell'integrazione
generale; non riguarda i collegamenti al testo o alle fonti del capitolo.
