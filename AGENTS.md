# Istruzioni per lavorare nella repository

## Scopo del progetto

Questa repository ospita un website/book open in italiano, realizzato con Quarto,
sulla psicologia dell'intelligenza umana. La sezione didattica costituisce
l'ossatura principale del libro e deriva dal corso universitario documentato nei
materiali in `slide/`.

Prima di lavorare sulla parte didattica, leggere integralmente
`PIANO-DIDATTICA.md`.

## Confini non negoziabili

- Non modificare, spostare, rinominare o cancellare nulla in
  `divulgazione-pagine/` e `professione-pagine/`, salvo richiesta esplicita
  dell'utente che nomini quelle directory.
- Non modificare PDF, DOCX o altri materiali in `slide/`: sono fonti di lavoro,
  non output del libro.
- Non modificare `website/` a mano: è output generato da Quarto.
- Conservare le modifiche preesistenti dell'utente e ignorare i cambiamenti non
  pertinenti al task assegnato.
- Non ampliare autonomamente il perimetro dalla didattica alle sezioni
  divulgative o professionali.

## Stato attuale

L'utente ha autorizzato la stesura completa della sezione didattica secondo la
struttura di `PIANO-DIDATTICA.md` («facciamo tutto e poi aggiustiamo»). È
presente una **prima stesura di tutti i 21 capitoli** (19 del nucleo più i due
approfondimenti), integrata in `_quarto.yml` e `references.bib`. La fase
attuale è la **revisione**: correzioni di contenuto, voce, lunghezza e figure
vanno fatte sui capitoli esistenti, senza riscriverli da zero e senza cambiare
slug o struttura delle parti salvo richiesta dell'utente. Stato dettagliato e
punti aperti in `progettazione-didattica/indice.md`.

## Convenzioni tecniche dei capitoli

- File in `didattica/<parte>/<slug>.qmd`, intestazione YAML uguale a quella dei
  capitoli esistenti (`lang: it`, bibliografia e CSL relative, 
  `suppress-bibliography: true`); in fondo un callout «In breve» e il link
  `[Riferimenti bibliografici](../../references.qmd)`. La bibliografia è unica.
- Le figure sono generate da chunk R nel `.qmd` (`echo: false`), con seme
  fissato, `#| label: fig-…`, `fig-cap` e `fig-alt`. Ogni capitolo con figure ha
  un chunk `setup` con `rosso = "#9A0000"`, la funzione `virgola()` per i
  decimali italiani e un tema `ggplot2` minimale. Con `virgola()` sugli assi
  vanno sempre indicati i `breaks`, altrimenti i valori vengono arrotondati male.
- Valori in didascalia e testo alternativo devono corrispondere a ciò che il
  codice produce: dopo ogni modifica, rigenerare e controllare le immagini.
- Ogni figura va registrata in `didattica/figure/registro-fonti.csv`.
- Nuovi riferimenti: ricavare i metadati dal DOI (Crossref) e non inventare
  dati mancanti; libri senza DOI inseriti a mano con editore e anno verificabili.
- Il render di controllo si fa in una cartella isolata, per esempio
  `quarto render --to html --output-dir .quarto/anteprima-didattica`.
  `website/` è l'output pubblicato tramite GitHub Pages: rigenerarlo solo quando
  l'utente decide di pubblicare.

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
- A fine task eseguire almeno il render della pagina o della sezione toccata; il
  task di integrazione esegue il render completo e controlla link, citazioni,
  sommario e leggibilità su schermo.

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
