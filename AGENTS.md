# Istruzioni per lavorare nella repository

## Scopo del progetto

Questa repository ospita un website/book open in italiano, realizzato con Quarto,
sulla psicologia dell'intelligenza umana. La sezione didattica costituisce
l'ossatura principale del libro e deriva dal corso universitario documentato nei
materiali in `slide/`.

Prima di lavorare sulla parte didattica, leggere integralmente
`progetto/PIANO-DIDATTICA.md`.

## Mappa della repository e render

Ogni file modificabile esiste in una sola copia; tutto il resto è generato.

| Dove | Che cosa | Si modifica? |
|---|---|---|
| `_quarto.yml` | impostazioni comuni a sito e PDF: autore, bibliografia, CSL, lingua, nome del PDF | sì |
| `_quarto-sito.yml` | profilo «sito» (predefinito): formato HTML e indice completo (didattica, professione, divulgazione) | sì |
| `_quarto-libro.yml` | profilo «libro»: PDF A5 intitolato «Psicologia dell'Intelligenza Umana», con **solo la parte didattica** | sì |
| `index.qmd` | introduzione | sì |
| `bibliografia.qmd` | pagina che stampa l'elenco dei riferimenti | no: non contiene fonti |
| `didattica/<parte>/<slug>.qmd` | capitoli didattici, figure incluse (generate da R nel file) | sì |
| `divulgazione-pagine/`, `professione-pagine/` | sezioni non didattiche | solo su richiesta esplicita |
| `references.bib` | **unico archivio delle fonti**: qui si aggiungono e correggono i riferimenti | sì |
| `assets/` | CSS, stile citazioni, favicon, filtro e intestazione LaTeX del PDF | sì, con cautela |
| `progetto/` | piano del libro, stato dei lavori e punti aperti, registro delle figure: non entrano nel libro | sì |
| `render.bat`, `render.sh` | unico comando di render | raramente |
| `website/` | **unico output**: sito HTML e `Psicologia-dell-Intelligenza.pdf` | **mai a mano** |
| `slide/` | fonti private, escluse da git | mai |

- Il render si fa **solo** con `render.bat` (Windows) o `sh render.sh`. Esegue
  `quarto render --profile sito` (HTML in `website/`), poi
  `quarto render --profile libro` (PDF nella cartella temporanea `_libro/`, da cui
  il PDF viene spostato in `website/` e la cartella cancellata: ogni render di
  Quarto svuota la propria cartella di output). Infine cancella i residui
  intermedi (`*.tex`, `*_files/` accanto ai sorgenti, `site_libs/` in radice),
  che sono esclusi da git e non vanno mai modificati.
- Non usare cartelle di output alternative (`--output-dir`): devono esistere una
  sola versione HTML e una sola PDF. Il render in `website/` è innocuo finché non
  si fa push: la pubblicazione avviene solo con il push di `website/` su `main`
  (workflow `.github/workflows/static.yml`, che non esegue il render).
- Per controllare una sola pagina durante il lavoro si può usare
  `quarto preview <file>.qmd`, che non scrive copie permanenti; prima di
  consegnare, eseguire comunque `render.bat`.
- L'hook `.githooks/pre-commit` (attivato da `render.bat`) blocca i commit che
  modificano sorgenti senza modificare `website/`: non aggirarlo.

## Confini non negoziabili

- Non modificare, spostare, rinominare o cancellare nulla in
  `divulgazione-pagine/` e `professione-pagine/`, salvo richiesta esplicita
  dell'utente che nomini quelle directory.
- Non modificare PDF, DOCX o altri materiali in `slide/`: sono fonti di lavoro,
  non output del libro.
- Non modificare `website/` a mano: è output generato da Quarto e viene
  cancellato e riscritto a ogni render.
- Conservare le modifiche preesistenti dell'utente e ignorare i cambiamenti non
  pertinenti al task assegnato.
- Non ampliare autonomamente il perimetro dalla didattica alle sezioni
  divulgative o professionali.

## Stato attuale

L'utente ha autorizzato la stesura completa della sezione didattica secondo la
struttura di `progetto/PIANO-DIDATTICA.md` («facciamo tutto e poi aggiustiamo»). È
presente una **prima stesura di tutti i 21 capitoli** (19 del nucleo più i due
approfondimenti), integrata in `_quarto.yml` e `references.bib`. La fase
attuale è la **revisione**: correzioni di contenuto, voce, lunghezza e figure
vanno fatte sui capitoli esistenti, senza riscriverli da zero e senza cambiare
slug o struttura delle parti salvo richiesta dell'utente. Stato dettagliato e
punti aperti in `progetto/stato-lavori.md`.

## Revisione in corso: allineamento alle slide

Richiesta dell'utente (ottobre 2026): chi legge un capitolo deve trovarvi un
**supporto discorsivo alle slide**, con la stessa concatenazione di concetti
(arricchita dalle fonti originali citate) e, come agganci visivi, **gli stessi
diagrammi e grafici delle slide**, ridisegnati in R in modo il più possibile
fedele. Tutto ciò che nelle slide è fatto con box, frecce, testo e forme di
PowerPoint è dell'autore e si riproduce liberamente; le immagini raster
(grafici di articoli, fotografie, item di test, schermate) seguono le regole
della sezione «Figure, test e copyright».

Metodo, un capitolo per volta (non tutto insieme):

1. Estrarre il testo del mazzo (`pdftotext -layout`) e guardare le pagine con
   diagrammi (PyMuPDF: le pagine con molti oggetti vettoriali e poche immagini
   sono i diagrammi dell'autore).
2. Confrontare la scaletta del capitolo con la sequenza delle slide e riordinare
   le sezioni perché la seguano; tenere del capitolo esistente ciò che è buono e
   compatibile, togliere esempi inventati che non hanno aggancio nelle slide se
   allungano il testo.
3. Ridisegnare i diagrammi conservando l'**architettura** della slide (quali
   elementi, dove, collegati da quali frecce, in che ordine di lettura), ma
   nello **stile grafico del libro** (decisione dell'utente, ottobre 2026):
   testo nero o `grey30` per il secondario, frecce `grey35`, il concetto o la
   relazione focale in `rosso`, scatole `grey95`/bianche solo dove la slide ha
   scatole; grafici con `tema` (minimale), barre e aree grigie e accenti in
   rosso. Colori, spessori e font della slide non vanno copiati. Il PDF usa
   `cairo_pdf` per tutte le figure (impostato in `assets/diagrammi.R`), quindi
   greco, frecce Unicode e diacritici funzionano. In `text()` di base R non
   usare `lineheight` (vale solo in ggplot2).
4. Aggiornare il registro delle figure («adattamento dalla slide
   dell'autore»), verificare le fonti nuove, eseguire il render e controllare le
   figure nel PDF.

Strumenti di lavoro (nella cartella temporanea, non nel progetto): uno script R
che esegue i chunk di un capitolo e salva ogni figura in PNG nei due formati
(forzando `knitr::is_latex_output()`), per controllarle senza il render
completo. Attenzione: nei comandi shell le sequenze `\\n` dentro heredoc
possono diventare a capo reali nelle stringhe R; modificare il codice R con
l'editor, non con script incollati nella shell.

Avanzamento (ottobre 2026). «Fatto» = sequenza del testo riallineata alle slide
e diagrammi dell'autore riprodotti; «parziale» = solo alcune figure o tabelle.

| Capitolo | Mazzo | Stato e cose rimaste |
|---|---|---|
| `che-cosa-e` | 1. Cosa è intelligenza | **fatto** (pp. 7, 14, 17, 21) |
| `perche-studiarla` | 0. Perché studiare | **fatto** (pp. 7, 10, 11) |
| `correlazione` | La Correlazione spiegata facile | **fatto** (pp. 5-19; grafici simulati al posto di quelli con emoji) |
| `distribuzioni-e-punteggi` | La Gaussiana e i punti z | **fatto** (pp. 3-25); restano fuori la tabella grezzo-ponderato (p. 26) e le foto della tavola di Galton |
| `qualita-della-misura` | I Criteri psicometrici | **fatto** (pp. 8-17); da fare l'esempio IDS-2 (p. 18), saturazioni non nelle slide |
| `fattore-g` | 2. Unitaria, multipla, gerarchica | **fatto** (pp. 6, 7, 8); la vecchia `fig-manifold` è rimasta |
| `modelli-gerarchici` | 2. Unitaria, multipla, gerarchica | **fatto** (pp. 33, 39, 40, 42, 47, 48, 50-51, 54); manca il problema X+Y (p. 34) come figura |
| `origini-dei-test` | 3. Storia dei Test | **parziale**: tabella delle fasce Army (p. 24); linea del tempo già presente |
| `batterie-moderne` | 3. Storia dei Test | **fatto** (pp. 2, 31, 32 come tabella) |
| `geni-ambiente-ereditabilita` | 4. Basi genetiche | **parziale**: tabelle di p. 10 e p. 15; da fare formula h² (p. 6) e Falconer (p. 12) come schema |
| `genetica-molecolare` | 4. Basi genetiche | da fare: schema Turkheimer (p. 33) da avvicinare alla slide; correlazione genetica (p. 39) |
| `effetto-flynn` | 5. Effetto Flynn | **parziale**: g contro s (p. 17), tabella delle ipotesi (p. 11); cause (p. 19) già fedele |
| `cervello-e-intelligenza` | 6. Basi neurobiologiche | da fare (quasi solo raster di articoli: valutare) |
| `potenziamento-cognitivo` | 7. Potenziamento | da fare: fadeout (p. 8), controllo attivo (p. 23), schema di Warne su g (p. 30) |
| `scuola-e-condizioni-sociali` | 8. Scuola, salute, lavoro | da fare: QI↔scolarità (p. 8), mediazione SES (p. 10), Davies (p. 11) |
| `salute-e-longevita` | 8. Scuola, salute, lavoro | da fare: tre percorsi a frecce (p. 19) |
| `intelligenza-e-lavoro` | 8. Scuola, salute, lavoro | da fare: ASVAB/AFQT (p. 23), attendibilità (p. 27), tabella Cucina/Nye/Sackett (p. 32), «oltre g» (p. 34) |
| `neurosviluppo-dimensionale` | Neurosviluppo: cosa sono | da fare: comorbilità con frecce e percentuali (p. 35) solo dopo aver aggiunto le fonti (Mutluer 2022, Rong 2021, Snowling 2019, Turk 2009, van Bergen 2025) |
| `valutazione-nel-neurosviluppo` | Neurosviluppo: valutazione | da fare: neurodivergenza/disturbo (p. 2), profili sindromici (p. 8); cono e specificità già vicini |
| `alternative-a-g`, `intelligenza-emotiva-e-costrutti` | Oltre g | da fare (pp. 3, 8, 10, 12, 13, 14) |

Molte figure già presenti nei capitoli «da fare» sono ridisegni liberi: vanno
riportate all'architettura della slide corrispondente.

## Convenzioni tecniche dei capitoli

- File in `didattica/<parte>/<slug>.qmd`, aggiunto all'elenco dei capitoli sia in
  `_quarto-sito.yml` sia in `_quarto-libro.yml` (le pagine non didattiche solo nel
  primo). Intestazione YAML minima: `title`, `description`,
  `suppress-bibliography: true` (ed eventuale `execute`). Lingua, bibliografia e
  CSL sono impostate una sola volta in `_quarto.yml`: non ripeterle. In fondo un
  callout «In breve» e il link `[Riferimenti bibliografici](../../bibliografia.qmd)`.
  La bibliografia è unica.
- Le figure sono generate da chunk R nel `.qmd` (`echo: false`), con seme
  fissato, `#| label: fig-…`, `fig-cap` e `fig-alt`. Ogni capitolo con figure ha
  un chunk `setup` con `rosso = "#9A0000"`, la funzione `virgola()` per i
  decimali italiani e un tema `ggplot2` minimale. Con `virgola()` sugli assi
  vanno sempre indicati i `breaks`, altrimenti i valori vengono arrotondati male.
- Nel PDF (A5) le figure si disegnano alla larghezza reale del testo, così i
  caratteri restano leggibili. Il chunk `setup` definisce
  `stampa = knitr::is_latex_output()` e il tema usa `base_size = if (stampa) 10 else 13`.
  Ogni figura indica le misure per entrambi i formati, per esempio
  `#| fig-width: !expr if (stampa) 4.45 else 7` e
  `#| fig-height: !expr if (stampa) 3 else 4`; dove serve, `if (stampa)` cambia
  anche la disposizione (pannelli in colonna, legenda in basso, testo più piccolo).
  Didascalie e testi alternativi devono valere per entrambe le disposizioni
  («primo pannello», non «a sinistra»). Dopo ogni modifica controllare le figure
  anche nel PDF: niente testo sovrapposto, tagliato o troppo piccolo.
- I diagrammi (scatole, ovali, frecce) si disegnano in base R con le funzioni di
  `assets/diagrammi.R` (`tela()`, `nodo()`, `collega()`, `freccia()`), caricate nel
  chunk `setup` con `source("../../assets/diagrammi.R")`. Hanno le stesse
  proporzioni nel sito e nel PDF: le misure si scrivono come
  `#| fig-width: !expr 4.45 * scala`, dove `scala` vale 1 nel PDF e 1,5 nel sito.
- Valori in didascalia e testo alternativo devono corrispondere a ciò che il
  codice produce: dopo ogni modifica, rigenerare e controllare le immagini.
- Ogni figura va registrata in `progetto/registro-figure.csv`.
- Nuovi riferimenti: ricavare i metadati dal DOI (Crossref) e non inventare
  dati mancanti; libri senza DOI inseriti a mano con editore e anno verificabili.
- Il render si fa con `render.bat` (vedi «Mappa della repository e render»).
  Commit e push, che pubblicano il sito, spettano all'utente o vanno fatti solo
  su sua richiesta.

## Principi editoriali

- Scrivere in italiano naturale, chiaro e conciso. La voce deve essere
  **asciutta e un po' tagliente**: attacchi diretti, frasi abbastanza brevi,
  passaggi logici visibili, giudizi espliciti quando l'evidenza li consente e
  chiuse nette. È ammessa un'ironia breve e controllata; non sono ammessi tono
  aggressivo, sarcasmo continuo, slogan o falsa sicurezza.
- Trasformare le slide in prosa: non limitarsi a trascriverle o a concatenarne i
  punti elenco. Ridurre premesse cerimoniose, ripetizioni, avverbi riempitivi e
  formule impersonali. Una domanda retorica è utile; una raffica di domande no.
- Il **testo scritto nelle slide è dell'autore del progetto ed è autorizzato al
  riuso, anche letterale**. Si possono quindi conservare definizioni, passaggi e
  formulazioni efficaci. L'eventuale riscrittura serve alla qualità editoriale e
  al passaggio da lezione a libro, non a evitare un problema di copyright.
- Questa autorizzazione riguarda il testo originale delle slide, non si estende
  automaticamente a citazioni testuali, figure, grafici, fotografie, schermate,
  item di test o altri materiali di terzi incorporati nei PDF. Per questi valgono
  le regole specifiche della sezione copyright.
- Ogni pagina deve avere una domanda o tesi riconoscibile, un percorso logico e
  una breve chiusura. Evitare sia pagine enciclopediche sia frammenti troppo
  brevi.
- Obiettivo ordinario: 1.400–2.200 parole per pagina, escluse bibliografia,
  didascalie e materiali opzionali. Superare 2.500 parole solo con una ragione
  editoriale esplicita; sotto 1.100 parole valutare l'accorpamento.
- Usare le parti di Quarto per raggruppare pagine affini. Nel sito, una pagina
  Quarto corrisponde normalmente a un capitolo leggibile per intero.
- Distinguere sempre descrizione dell'evidenza, interpretazione e limiti. Non
  trasformare correlazioni in affermazioni causali.
- Le slide sono la fonte primaria per decidere perimetro, enfasi e voce del
  corso, e il loro testo originale è riutilizzabile. Non sostituiscono però la
  verifica bibliografica delle affermazioni.
- Privilegiare fonti scientifiche primarie, revisioni sistematiche, meta-analisi,
  manuali o documenti istituzionali. Per dati o consensus che possono essere
  cambiati, controllare una fonte aggiornata.
- Nel sito/libro non deve comparire **alcuna menzione all'esame**, al programma,
  a ciò che “va studiato”, “va saputo”, “non serve”, “non sarà chiesto” o ha
  diverso peso ai fini del corso. Eliminare anche riferimenti a Moodle, Wooclap,
  calendario, lezioni e materiali obbligatori o facoltativi.
- Tutto ciò che viene incluso nel libro è sullo stesso piano editoriale. Callout,
  note e approfondimenti possono distinguere funzione o complessità, mai
  importanza per l'esame. Un'indicazione nelle slide come “non per l'esame” è
  solo metadato interno: decidere se il contenuto serve, poi includerlo o
  ometterlo senza conservarne l'etichetta.
- Le domande d'esame non vanno presentate come tali. Se contengono una buona
  domanda concettuale, possono soltanto ispirare una domanda autonoma di
  riflessione o autoverifica, senza alcun riferimento alla loro origine.
- Evitare formule come “come visto nella slide”, “durante la lezione” o “nel
  materiale di studio”: il libro deve funzionare come opera autonoma.

## Materiali del libro Il Mulino: solo riferimento di voce

La directory `slide/libro-mulino-materiali-copyright-attenzione/` contiene testi
scritti dall'autore del corso ma soggetti a un accordo di copyright con la casa
editrice Il Mulino. Sono una **fonte di stile e visione**, non una banca di testo
riutilizzabile.

- Non copiare frasi, periodi, metafore, battute, titoli distintivi o sequenze
  argomentative. Formulazioni brevi e generiche e termini tecnici possono
  naturalmente coincidere, ma non vanno trasferiti blocchi riconoscibili.
- Non fare “patchwriting”: sostituire parole con sinonimi mantenendo struttura,
  esempi e progressione dell'originale equivale a un riuso troppo vicino.
- Non trasferire automaticamente formulazioni solo perché l'autore coincide.
- Ricavare soltanto caratteristiche astratte della voce: apertura immediata,
  lessico concreto, posizione esplicita, obiezioni prese sul serio, ironia
  sobria, conclusione senza ambiguità.
- Costruire prima una scaletta autonoma dalle slide e dalle fonti scientifiche;
  scrivere poi senza seguire il DOCX frase per frase. Usare i testi Il Mulino
  soltanto in un secondo momento per controllare il tono generale.
- Le idee scientifiche e i riferimenti rintracciati nei DOCX vanno verificati
  nelle fonti originarie. Il DOCX non va citato come autorità e non rende
  riutilizzabili eventuali materiali di terzi al suo interno.
- Se una formulazione nuova sembra riconoscibilmente vicina al testo editoriale,
  riscriverla cambiando non solo le parole, ma anche struttura, esempio e ordine
  dell'argomento.
- Nessun contenuto di questa directory va pubblicato o incluso negli output del
  sito senza una verifica specifica dell'accordo editoriale.

## Libri di Haier e Warne: fonti protette

La directory `slide/altri-libri-importanti-copyright-attenzione/` contiene due
fonti secondarie particolarmente importanti:

- Richard J. Haier, *The Neuroscience of Intelligence*;
- Russell T. Warne, *In the Know: Debunking 35 Myths about Human Intelligence*.

Entrambi i libri sono coperti da copyright. Si possono consultare per orientare
la trattazione, chiarire il quadro teorico, rintracciare studi e controllare
affermazioni; non si possono trasferire nel sito capitoli, paragrafi, tabelle,
figure o passaggi estesi.

- Parafrasare in modo autonomo e citare il libro quando è davvero la fonte
  utilizzata.
- Usare citazioni letterali solo se brevi, necessarie e accompagnate da pagina.
- Per dati, risultati e tesi controverse, risalire quando possibile allo studio
  primario citato dal libro.
- Non assumere che una sintesi del libro sia ancora aggiornata: verificare
  evidenze e consensus suscettibili di cambiamento.
- Non estrarre o pubblicare immagini dai PDF. Una figura scientificamente utile
  va ricostruita da dati leciti oppure sostituita, citando la fonte appropriata.
- I PDF sono materiali di consultazione interna e non devono entrare nell'output
  Quarto o negli allegati pubblici del sito.

## Figure, test e copyright

Una figura va inserita solo se chiarisce una relazione, un andamento, un modello
o un passaggio che la prosa rende peggio. Meme, immagini decorative, copertine,
screenshot di notizie e alleggerimenti da lezione vanno esclusi.

Prima di aggiungere qualsiasi immagine proveniente dalle slide, registrare:

1. file o pagina della slide di origine;
2. autore o ente, titolo, anno e fonte originale verificabile;
3. licenza o base d'uso nota;
4. funzione didattica della figura;
5. livello di rischio e decisione: riuso, ridisegno, sostituzione o esclusione.

Regole di default:

- **Basso rischio:** diagramma originale dell'autore del corso; si può adattare,
  indicandolo quando opportuno.
- **Medio rischio:** grafico scientifico di terzi; preferire un ridisegno
  originale e fedele a partire da dati leciti, con citazione “elaborazione da”.
- **Alto rischio:** item, tavole, report o schermate di test commerciali
  (Wechsler, IDS, Raven e simili); non riprodurli senza autorizzazione e verifica
  anche della sicurezza del test. Usare esempi originali non equivalenti quando
  basta illustrare il principio.
- **Alto rischio:** fotografie, illustrazioni, fumetti, meme, copertine e
  screenshot di terzi; escluderli salvo necessità reale e licenza verificata.
- Le immagini storiche non sono automaticamente di pubblico dominio: verificare
  opera, edizione, autore, paese e provenienza del file.
- Citare la fonte non rende automaticamente lecito il riuso. Se la licenza non è
  chiara, ridisegnare, sostituire o non usare.
- Citazioni testuali di terzi: brevi, necessarie, esatte e accompagnate dal
  riferimento puntuale; altrimenti parafrasare.

## Regole operative per task futuri

- Un task di scrittura deve indicare lo slug o il gruppo di capitoli assegnato e
  le slide sorgente elencate nel piano.
- Chi scrive un capitolo modifica soltanto il relativo `.qmd` e le sue eventuali
  risorse locali, a meno che il task assegni esplicitamente anche integrazione e
  bibliografia.
- `_quarto.yml`, `references.bib`, navigazione, stile globale e registro delle
  figure sono file condivisi: li modifica un solo task di integrazione alla
  volta.
- Non inventare chiavi bibliografiche o riferimenti incompleti. Le citazioni
  nuove devono risolversi durante il render.
- Nomi di file e cartelle nuovi: minuscoli, ASCII, `kebab-case`.
- Usare funzioni native di Quarto per citazioni, cross-reference, note, callout e
  figure; evitare HTML ad hoc se non indispensabile.
- I callout devono essere pochi e semanticamente stabili: “In breve”, “Esempio”,
  “Punto metodologico”, “Controversia”, “Attenzione clinica”, “Per approfondire”.
- A fine task eseguire `render.bat` e controllare che non ci siano avvisi su
  citazioni o riferimenti incrociati; il task di integrazione controlla anche
  link, sommario, PDF e leggibilità su schermo.

## Criteri di completamento di un capitolo

Un capitolo è pronto per l'integrazione quando:

- rispetta obiettivo e confini descritti nel piano;
- non duplica in modo sostanziale altri capitoli;
- ha lunghezza motivata e leggibile;
- ogni affermazione quantitativa o controversa ha una fonte adeguata;
- ogni figura ha didascalia, testo alternativo, provenienza e decisione di
  copyright documentata;
- termini, simboli e nomi dei costrutti sono coerenti col resto del libro;
- il file rende senza errori e non introduce modifiche negli output o nelle
  directory protette.
