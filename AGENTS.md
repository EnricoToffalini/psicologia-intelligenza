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
attuale è la **revisione**: correzioni di contenuto, voce e figure
vanno fatte sui capitoli esistenti, senza riscriverli da zero e senza cambiare
slug o struttura delle parti salvo richiesta dell'utente. Stato dettagliato e
punti aperti in `progetto/stato-lavori.md`.

## Architettura: capitoli concettuali e parti «Strumenti»

Ordine deciso dall'autore (ottobre 2026), vicino alla sequenza del corso
(cartella Drive delle slide, mazzi 0-13): si parte dai capitoli concettuali, e i
capitoli tecnici stanno al centro, in due parti verdi chiamate «Strumenti», nel
punto in cui il corso li introduce.

1. Capire l'intelligenza: `perche-studiarla`, `che-cosa-e`
2. Modelli e test: `fattore-g`, `modelli-gerarchici`, `origini-dei-test`,
   `batterie-moderne`
3. **Strumenti I** · Punteggi e distribuzioni: `distribuzioni-e-punteggi`
4. Basi biologiche, ambiente e cambiamento: `geni-ambiente-ereditabilita`,
   `genetica-molecolare`, `effetto-flynn`, `cervello-e-intelligenza`,
   `potenziamento-cognitivo`
5. **Strumenti II** · Correlazione e qualità della misura: `correlazione`,
   `qualita-della-misura`
6. Scuola, salute e lavoro; 7. Neurosviluppo; 8. Approfondimenti: oltre *g*

Regole:

- I capitoli «Strumenti» (cartella `didattica/dati-misure-punteggi/`) si
  leggono da soli o si saltano. Hanno `body-classes: capitolo-strumenti` nel
  front matter (verde nel sito) e un riquadro iniziale `::: {.inserto-strumenti}`
  che dice che cosa trattano, che cosa presuppongono e dove servono. Nel PDF le
  loro parti hanno titoli, testatine e un'unghiatura verdi: il filtro
  `assets/pdf-layout.lua` riconosce le parti il cui nome comincia con
  «Strumenti»; non cambiare quel prefisso.
- I capitoli concettuali non devono dipendere dai tecnici: spiegano in modo
  intuitivo ciò che serve e rimandano con un riquadro
  `::: {.rimando-strumenti}` che comincia con «**Strumenti →**», pochi e solo
  dove un lettore vorrebbe davvero approfondire.
- Nei rimandi testuali fra capitoli rispettare l'ordine: «si vedrà» per i
  capitoli successivi, «visto» per i precedenti.

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
   greco, frecce Unicode e diacritici funzionano, purché si rispettino le
   regole della sezione «Codifiche e caratteri speciali». In `text()` di base R
   non usare `lineheight` (vale solo in ggplot2).
4. Aggiornare il registro delle figure («adattamento dalla slide
   dell'autore»), verificare le fonti nuove, eseguire il render e controllare le
   figure nel PDF.

Strumenti di lavoro (nella cartella temporanea, non nel progetto): uno script R
che esegue i chunk di un capitolo e salva ogni figura in PNG nei due formati
(forzando `knitr::is_latex_output()`), per controllarle senza il render
completo. Attenzione: nei comandi shell le sequenze `\\n` dentro heredoc
possono diventare a capo reali nelle stringhe R; modificare il codice R con
l'editor, non con script incollati nella shell.

Avanzamento (ottobre 2026). Dopo una seconda revisione di tutte le figure
(richiesta dell'autore: rispettare la **logica** delle slide, non solo lo stile)
tutti i capitoli hanno le figure riallineate; restano fuori soprattutto grafici
raster di articoli. Punti aperti per capitolo in `progetto/stato-lavori.md`.

Regole emerse dalla revisione:

- **Leggibilità prima di tutto.** Nel PDF il testo delle figure non scende sotto
  circa 8 pt (`cex` ≥ 0,68 nei diagrammi, `size` ≥ 2,8 in ggplot); frecce corte,
  spazio alle parole. `freccia()` e `collega()` disegnano punte piene e larghe:
  non usare `arrows()` direttamente.
- **Niente figure banali.** Glossari e schemi minimi diventano prosa, elenco o
  tabella, non figure numerate.
- **Il messaggio della figura è quello della slide**, senza implicazioni spurie
  (esempio: nel confronto fra campioni il campione piccolo ha un effetto *più
  grande* ma non significativo).
- **Illustrazioni dell'autore.** Le immagini raster create dall'autore (per ora
  gli alberi della «foresta», in `didattica/capire-intelligenza/immagini/`) si
  possono usare direttamente, con etichette sovrapposte in R.
- **Esempi di item.** Il libro deve mostrare che aspetto hanno le prove: item
  costruiti ad hoc che ne imitano la logica (`fig-item` in `che-cosa-e`,
  `tbl-item` in `batterie-moderne`), item storici di pubblico dominio citati
  dalla fonte (`origini-dei-test`). Mai item di test in commercio.


## Codifiche e caratteri speciali

Testi e figure sono pieni di accenti, «», →, ², ≈ e lettere greche. Un errore di
codifica non blocca il render: produce in silenzio figure con `<U+00E0>` al
posto di «à», o testo con caratteri mancanti. È già successo (ottobre 2026) e
ha rovinato tutte le figure del libro e del sito. Regole:

- **Tutti i sorgenti sono UTF-8 senza BOM** (`.qmd`, `.yml`, `.bib`, `.R`,
  `.tex`, `.css`, `.lua`, `AGENTS.md`). Scrivere e modificare i file con gli
  strumenti di modifica dell'editor (Edit/Write), non con comandi della shell.
  In particolare, in Windows PowerShell 5.1 `Set-Content`/`Add-Content`
  scrivono nella codifica ANSI del sistema e `Out-File`/`>` aggiungono il BOM:
  non usarli sui sorgenti. Gli heredoc della shell possono alterare `\n` e
  caratteri non ASCII nelle stringhe R.
- **Nel codice R scrivere i caratteri direttamente** («», à, →, σ), come nel
  resto dei capitoli; non convertirli in `à` né in sequenze `<U+...>`. Se
  in una figura o in un output compare `<U+` qualcosa, la causa è la codifica
  della sessione R, non il carattere: non «correggerlo» togliendo l'accento.
- **R deve girare in UTF-8.** `assets/diagrammi.R` forza la codifica UTF-8 e,
  se non ci riesce, ferma il render con un errore: non togliere quel blocco,
  non spostarlo dopo altro codice e non aggirarlo. Ogni nuovo capitolo con
  chunk R deve caricare `assets/diagrammi.R` nel chunk `setup` prima di
  disegnare qualsiasi figura. Non impostare `LC_ALL=C` o `LANG=C` per il render.
- **Le figure del PDF usano `cairo_pdf`** (impostato in `assets/diagrammi.R`):
  non cambiare `dev` nei singoli chunk.
- **Il testo del PDF è in TeX Gyre Pagella** (`_quarto-libro.yml`), che copre
  tutti i caratteri attuali, greco e ≈ compresi. Non reintrodurre ripieghi come
  `\newunicodechar` verso la matematica. Prima di usare nel testo un simbolo
  nuovo e insolito, controllare che il carattere lo contenga (per esempio con
  `fontTools` sul file restituito da `kpsewhich texgyrepagella-regular.otf`);
  se cambia il carattere del PDF, ripetere il controllo su tutti i sorgenti e
  su `references.bib`.
- **Dopo ogni render, controllare**:
  `pdftotext website/Psicologia-dell-Intelligenza.pdf - | grep -c "U+"` deve
  dare 0, e l'output del render non deve contenere avvisi «Missing character».
  Per il sito, aprire almeno una figura PNG con accenti o «» e guardarla. Le
  figure in PNG non si possono controllare con `grep`.
- Se `render.bat`, lanciato dall'ambiente di un agente, si ferma con errori di
  R su nomi di file o codifica (per esempio «file name conversion problem»),
  usare `sh render.sh` da bash invece di cambiare impostazioni del progetto.

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
- Nessun vincolo di lunghezza (decisione dell'autore, ottobre 2026): è un libro,
  e un capitolo è lungo quanto serve al suo contenuto. Si taglia ciò che è
  ripetitivo o inventato, non ciò che è lungo.
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
- ha la lunghezza che il contenuto richiede, senza ripetizioni;
- ogni affermazione quantitativa o controversa ha una fonte adeguata;
- ogni figura ha didascalia, testo alternativo, provenienza e decisione di
  copyright documentata;
- termini, simboli e nomi dei costrutti sono coerenti col resto del libro;
- il file rende senza errori e non introduce modifiche negli output o nelle
  directory protette.
