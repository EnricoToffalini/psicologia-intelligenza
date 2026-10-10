# Piano editoriale della sezione didattica

> **Stato:** struttura adottata. Il 10 ottobre 2026 l'utente ha autorizzato la
> stesura completa; tutti i capitoli previsti esistono in prima stesura e sono
> in revisione. Le tabelle sotto restano il riferimento per perimetro e confini
> di ciascuna pagina.

**Avanzamento (10 ottobre 2026):** scritti tutti i 21 capitoli (19 del nucleo
e 2 approfondimenti), inseriti nella navigazione di `_quarto.yml`, con
bibliografia integrata in `references.bib` e figure originali generate in R.
Render HTML completo verificato in una copia di controllo; `website/` non è
stato rigenerato. Stato dettagliato e punti aperti in
`progettazione-didattica/indice.md`.

## 1. Obiettivo e lettore

La sezione didattica deve trasformare il corso universitario contenuto in
`slide/` in un libro online autonomo, leggibile e scorrevole. Il lettore primario
è una studentessa o uno studente di psicologia o scienze cognitive; il testo deve
però restare accessibile anche a professionisti e lettori colti senza una forte
preparazione psicometrica.

Le slide stabiliscono i temi e l'impostazione critica del corso. Il libro non
deve imitarne ritmo, battute o densità visiva: deve esplicitare i passaggi che a
lezione sono affidati alla spiegazione orale, eliminare il materiale contingente
e verificare le fonti.

Il testo originale presente nelle slide è scritto dall'autore del progetto ed è
liberamente riutilizzabile, anche nelle formulazioni. Non serve quindi una
riscrittura “difensiva”. Serve invece un lavoro editoriale: collegare i passaggi,
ridurre ripetizioni, sciogliere gli schemi e rendere autosufficiente ciò che a
lezione dipende dalla spiegazione orale. L'autorizzazione riguarda il testo
dell'autore, non gli oggetti di terzi eventualmente incorporati nelle slide.

La voce sarà asciutta e un po' tagliente. Il testo deve arrivare presto al punto,
dire chiaramente che cosa regge e che cosa non regge, e usare l'ironia solo
quando chiarisce una debolezza concettuale. “Tagliente” non significa liquidare
obiezioni, persone o prospettive minoritarie: la nettezza deve poggiare su
argomenti ed evidenze.

## 2. Unità editoriale

In Quarto ogni capitolo sarà normalmente una pagina web interamente
consultabile. I capitoli saranno raccolti in **parti**, usate come sezioni della
navigazione e non come pagine-contenitore.

Parametri iniziali, da verificare su due capitoli pilota:

- 1.400–2.200 parole per pagina, con un massimo ordinario di circa 2.500;
- 8–12 minuti di lettura;
- 4–7 sezioni di secondo livello;
- 0–3 figure realmente informative;
- una breve apertura orientativa e una chiusura “In breve” di 3–5 punti;
- approfondimenti tecnici o storici in callout, note o appendici, senza spezzare
  il filo principale.

Questi valori servono a mantenere pagine non troppo dissimili. Non sono quote da
riempire: se una pagina resta sotto circa 1.100 parole va valutato
l'accorpamento; se supera 2.500 va valutata la divisione.

## 3. Architettura proposta

### Parte I — Capire l'intelligenza

| # | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| 1 | **Perché studiare l'intelligenza** (`perche-studiarla.qmd`) | Differenze individuali, valore teorico, metodologico e professionale; pregiudizi e storia problematica. Escludere programma, esame e logistica del corso. | `0. Perché studiare lintelligenza.pdf`; selezione da `0. Introduzione al corso.pdf` | 1.400–1.800 |
| 2 | **Che cosa chiamiamo intelligenza** (`che-cosa-e.qmd`) | Definizioni, adattamento, apprendimento, rappresentazioni, abilità mentale generale e significato operativo del QI. Non anticipare tutta la teoria di *g*. | `1. Cosa è intelligenza.pdf` | 1.600–2.000 |

### Parte II — Dati, misure e punteggi

Questa parte fornisce il minimo linguaggio quantitativo necessario al resto del
libro. Deve essere intuitiva, ma non banalizzare.

| # | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| 3 | **Correlazione e differenze individuali** (`correlazione.qmd`) | Che cosa dice `r`, quanto è grande una relazione, perché due variabili possono correlare, mediazione e moderazione. Dettagli su outlier e non linearità restano opzionali. | `La Correlazione spiegata facile.pdf` | 1.400–1.800 |
| 4 | **Distribuzioni, punti z e punteggi standardizzati** (`distribuzioni-e-punteggi.qmd`) | Gaussiana come modello, media/DS, percentili, punti z e scale del QI; distinguere trasformazione lineare e normalizzazione. Cohen's *d* in un box. | `La Gaussiana e i punti z spiegati facili.pdf` | 1.600–2.100 |
| 5 | **Quando una misura è buona** (`qualita-della-misura.qmd`) | Validità, attendibilità, errore, stabilità e consistenza interna; perché un profilo può essere meno affidabile del totale. Le formule avanzate restano opzionali. | `I Criteri psicometrici spiegati abbastanza facili.pdf` | 1.500–2.000 |

### Parte III — Modelli e test dell'intelligenza

Il lungo modulo su intelligenza unitaria, multipla o gerarchica viene diviso in
due pagine. Anche la storia dei test viene divisa: altrimenti entrambe produrrebbero
pagine molto più lunghe del resto del libro.

| # | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| 6 | **Il fattore generale e la positive manifold** (`fattore-g.qmd`) | Dalle correlazioni tra prove al fattore latente; Spearman, significato e limiti di *g*, rischio di reificazione. | `2. Intelligenza unitaria, multipla, o gerarchica.pdf`, circa slide 2–20 | 1.700–2.200 |
| 7 | **Abilità multiple e modelli gerarchici** (`modelli-gerarchici.qmd`) | Thurstone, Sternberg e Gardner con peso proporzionato all'evidenza; Gf/Gc; sintesi gerarchica e CHC; prevalenza di *g* senza cancellare i domini. | stesso PDF, circa slide 21–52 | 1.900–2.300 |
| 8 | **Dai primi test al testing di massa** (`origini-dei-test.qmd`) | Galton, Binet, età mentale, Stern e Army Alpha/Beta; innovazioni, fallimenti, eugenetica e usi sociali. Chiudere prima delle scale moderne. | `3. Storia dei Test.pdf`, circa slide 2–26 | 1.700–2.200 |
| 9 | **Le batterie moderne di intelligenza** (`batterie-moderne.qmd`) | Wechsler, passaggio al QI di deviazione, struttura di batteria/indice/subtest/item, profili e strumenti presenti in Italia. Evitare la riproduzione di item protetti. | stesso PDF, circa slide 27–40; richiami a `1. Cosa è intelligenza.pdf` | 1.500–2.000 |

### Parte IV — Basi biologiche, ambiente e cambiamento

| # | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| 10 | **Geni, ambiente ed ereditabilità** (`geni-ambiente-ereditabilita.qmd`) | Distinguere basi genetiche, ereditabilità e determinismo; twin studies, cambiamento con l'età, correlazione e interazione gene–ambiente, limiti. | `4. Basi Genetiche ed Ereditabilità.pdf`, circa slide 2–22 | 1.900–2.300 |
| 11 | **Che cosa aggiunge la genetica molecolare** (`genetica-molecolare.qmd`) | SNP, GWAS, polygenic score, GCTA, missing heritability, poligenicità e pleiotropia. Nessun dettaglio molecolare non funzionale alla comprensione. | stesso PDF, circa slide 23–39 | 1.600–2.100 |
| 12 | **Cervello e intelligenza** (`cervello-e-intelligenza.qmd`) | Che cosa si tenta di spiegare/predire, limiti di campioni piccoli e overfitting, volume, sostanza bianca, efficienza e P-FIT. Presentare effetti modesti con cautela. | `6. Basi Neurobiologiche dellintelligenza.pdf` | 1.600–2.100 |
| 13 | **L'effetto Flynn e i cambiamenti storici** (`effetto-flynn.qmd`) | Aumento dei punteggi, cause plausibili, differenze tra domini, rapporto con *g*, plateau e inversioni recenti. Evitare una narrazione monocausale sugli smartphone. | `5. Effetto Flynn, una storia progressista.pdf` | 1.900–2.400 |
| 14 | **Si può potenziare l'intelligenza?** (`potenziamento-cognitivo.qmd`) | Scuola e cura in condizioni di svantaggio, fadeout, Mozart effect, musica, training cognitivi, controlli attivi, publication bias e far transfer. | `7. Potenziamento Cognitivo, tra realtà e illusioni.pdf` | 1.800–2.300 |

### Parte V — Scuola, salute e lavoro

Il PDF originario viene diviso in tre pagine brevi e comparabili: scuola, salute
e lavoro hanno letterature, meccanismi e cautele differenti.

| # | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| 15 | **Intelligenza, scuola e condizioni sociali** (`scuola-e-condizioni-sociali.qmd`) | Risultati scolastici, scolarità, SES, causalità reciproca e Matthew effect; non equiparare PISA e QI. | `8. Intelligenza e scuola, salute, lavoro.pdf`, circa slide 2–12 | 1.400–1.800 |
| 16 | **Salute e longevità** (`salute-e-longevita.qmd`) | Epidemiologia cognitiva, principali associazioni e mediatori; distinguere previsione individuale e differenze di gruppo. | stesso PDF, circa slide 13–19 | 1.200–1.600 |
| 17 | **Intelligenza e lavoro** (`intelligenza-e-lavoro.qmd`) | Selezione, training e prestazione; complessità del lavoro, range restriction, casi storici problematici e contributo delle abilità specifiche e della personalità. | stesso PDF, circa slide 20–34 | 1.700–2.200 |

### Parte VI — Intelligenza e condizioni del neurosviluppo

| # | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| 18 | **Dalle categorie alle dimensioni** (`neurosviluppo-dimensionale.qmd`) | Neurodiversità, continuità dei tratti, soglie, comorbilità, limiti dei core deficit e modelli gerarchico-dimensionali. Le definizioni diagnostiche vanno aggiornate e non usate come guida clinica autonoma. | `Disturbi del Neurosviluppo-Cosa sono.pdf` | 2.000–2.400 |
| 19 | **Valutare l'intelligenza nel neurosviluppo** (`valutazione-nel-neurosviluppo.qmd`) | Disabilità intellettiva e adattamento; profili medi in ASD, ADHD e DSA; selezione dei campioni, criteri di esclusione e invarianza di misura. Evitare inferenze diagnostiche da un profilo. | `Disturbi del Neurosviluppo-Valutazione intelligenza.pdf` | 1.900–2.300 |

La bozza contiene quindi **19 pagine didattiche** in sei parti, per circa
32.000–40.000 parole. Il numero è intenzionale ma rivedibile dopo i piloti. La
pagina 16, più corta, può essere accorpata alla 15 se in stesura non raggiunge
autonomia sufficiente.

### Approfondimenti finali — Oltre *g*

Il nuovo PDF `Oltre g.pdf` affronta temi trasversali che non devono appesantire
l'ossatura. Si propone di collocarli dopo le sei parti principali, in una sezione
chiaramente opzionale (“Approfondimenti” o “Oltre *g*”), con due pagine brevi:

| Sigla | Pagina proposta | Domanda guida e confini | Slide principali | Parole |
|---|---|---|---|---:|
| A | **Altre intelligenze o vecchi costrutti con un nome nuovo?** (`intelligenza-emotiva-e-costrutti.qmd`) | Intelligenza emotiva, validità incrementale, sovrapposizione con personalità e abilità cognitive, *jingle/jangle fallacies* e proliferazione degli strumenti. Non diventare un catalogo di etichette. | `Oltre g.pdf`, circa slide 3–9 | 1.200–1.600 |
| B | **Si può spiegare la positive manifold senza un fattore generale?** (`alternative-a-g.qmd`) | Process Overlap Theory, mutualismo, cosa tentano di spiegare, evidenze favorevoli, critiche e possibili versioni compatibiliste. Presentarle come alternative vive ma minoritarie, non come equivalenti già consolidate. | `Oltre g.pdf`, circa slide 10–15 | 1.300–1.700 |

Queste pagine non sono prerequisiti per nessun capitolo. Possono essere escluse
dalla prima release senza lasciare buchi e richiamate con link laterali dai
capitoli 6–7. Il nucleo centrale resta quindi di 19 pagine; il percorso completo
ne comprende 21.

## 4. Gerarchia e regime delle fonti

| Materiale | Funzione nel progetto | Riuso testuale | Obblighi principali |
|---|---|---|---|
| PDF delle slide direttamente in `slide/` | Fonte primaria di struttura, contenuti e voce del corso | Consentito anche letteralmente per il testo originale dell'autore | Verificare le affermazioni; separare e valutare ogni materiale di terzi incorporato |
| DOCX in `libro-mulino-materiali-copyright-attenzione/` | Riferimento di stile e parte della visione | Non consentito pari pari o mediante parafrasi ravvicinata | Procedura anti-ricalco; non pubblicare o convertire |
| Haier, *The Neuroscience of Intelligence* | Quadro neuroscientifico e teorico; pista verso fonti primarie | Solo sintesi autonoma o brevi citazioni puntuali | Citare; non riprodurre testo, figure o tabelle; verificare aggiornamenti |
| Warne, *In the Know* | Sintesi generale, miti, controversie e riferimenti | Solo sintesi autonoma o brevi citazioni puntuali | Citare; non riprodurre testo, figure o tabelle; risalire agli studi primari quando opportuno |
| Articoli e documenti esterni | Evidenza scientifica e aggiornamento | Secondo licenza e normali regole di citazione | Preferire fonti primarie, review, meta-analisi e fonti istituzionali |

I due libri sono conservati in
`slide/altri-libri-importanti-copyright-attenzione/` e restano materiali di
consultazione interna. Non vanno copiati, allegati o resi raggiungibili dal sito.

## 5. Materiale delle slide da non trasferire automaticamente

- Qualsiasi informazione su esame, programma, priorità di studio, materiali
  obbligatori o facoltativi, orari, Moodle, Wooclap, registrazioni e
  organizzazione del corso.
- Indicazioni come “serve/non serve per l'esame”, “da memorizzare”, “bonus
  track”, “per cultura personale” o simili. Il contenuto selezionato è tutto sullo
  stesso piano: si include perché serve al libro, non perché aveva un certo peso
  nel corso.
- Le domande d'esame in quanto tali. Una buona domanda può ispirare una nuova
  attività di riflessione o autoverifica, ma senza conservarne etichetta,
  formulazione contingente o provenienza.
- Meme, reaction image, emoji decorative, vignette, copertine e immagini usate
  solo per ritmo o ironia durante la lezione.
- Screenshot di pagine web, social, giornali o report quando basta un link o una
  sintesi testuale.
- Item e tavole riconoscibili di test commerciali o ancora in uso.
- Lunghi elenchi di numeri, studi o dettagli che funzionano in una presentazione
  ma interrompono il ragionamento in prosa.
- Affermazioni contingenti come “oggi”, “l'ultima edizione” o “il consensus
  attuale” senza verifica alla data di redazione.

La facoltà di riusare il testo delle slide non cambia questa selezione
editoriale: “si può copiare” non significa “conviene trasferire tutto”. Inoltre,
figure e citazioni di terzi conservano il proprio regime di copyright anche se
sono inserite in una slide scritta dall'autore.

## 6. Materiali Il Mulino: riferimento stilistico, non testo sorgente

I DOCX in `slide/libro-mulino-materiali-copyright-attenzione/` sono stati scritti
dall'autore del corso, ma sono coperti da un accordo di copyright con Il Mulino.
Sono utili per riconoscere la voce desiderata e parte dell'impostazione generale;
non possono essere trasferiti nel sito pari pari né mediante parafrasi ravvicinata.

Tratti stilistici da assumere a livello astratto:

- risposta o tesi già nell'apertura, senza una lunga anticamera;
- lessico concreto e periodi relativamente brevi;
- obiezioni formulate nella loro versione più plausibile e poi affrontate;
- esempi quotidiani brevi, soltanto se fanno lavoro concettuale;
- giudizi riconoscibili (“regge”, “non basta”, “il salto non è dimostrato”);
- ironia occasionale, seguita subito dall'argomento;
- finale che risponde davvero alla domanda iniziale.

Procedura di sicurezza per la stesura:

1. definire struttura e contenuti usando slide e letteratura scientifica;
2. scrivere una prima versione autonoma senza ricalcare il DOCX corrispondente;
3. consultare i materiali Il Mulino solo per una verifica macroscopica della
   voce;
4. controllare che non siano sopravvissuti frasi distintive, metafore, stessi
   esempi nello stesso ordine o identica progressione retorica;
5. riscrivere struttura ed esempio, non solo singole parole, nei casi dubbi.

Questi DOCX non vanno copiati sotto `didattica/`, pubblicati, convertiti in
Markdown o aggiunti agli output. I riferimenti bibliografici contenuti al loro
interno sono piste da verificare nelle fonti originali.

## 7. Strategia per figure e materiali extra

Le figure dovrebbero essere soprattutto di quattro tipi:

1. **diagrammi concettuali originali**, per esempio positive manifold → fattore
   latente, gerarchia CHC, causalità/mediatori o geni–ambiente;
2. **grafici ridisegnati da dati pubblicati**, per esempio effetto Flynn,
   ereditabilità con l'età o associazioni con esiti, con fonte e licenza dei dati;
3. **piccole simulazioni originali**, per correlazione, punti z, errore di misura,
   range restriction e overfitting;
4. **immagini storiche verificate**, solo quando la materialità dello strumento o
   del contesto storico è parte dell'argomento.

Materiali extra ammessi, purché subordinati alla lettura principale:

- callout metodologici;
- glossario progressivo;
- domande di autoverifica non valutative;
- brevi attività interattive accessibili anche in forma statica;
- codice o dettagli matematici collassabili;
- link a letture, dataset o strumenti open;
- appendici su notazione, modelli o approfondimenti clinici.

Per ogni figura futura va mantenuto un registro con almeno queste colonne:

`asset | capitolo | slide_origine | fonte_originale | licenza | funzione | rischio | decisione | note`

Il registro dovrebbe essere creato prima dell'importazione massiva delle figure.
La decisione di copyright segue `AGENTS.md`; una semplice citazione non basta a
rendere riutilizzabile un'immagine.

## 8. Struttura di cartelle

```text
didattica/
├── capire-intelligenza/
├── dati-misure-punteggi/
├── modelli-test/
├── basi-ambiente-cambiamento/
├── scuola-salute-lavoro/
├── condizioni-neurosviluppo/
├── approfondimenti/
└── figure/
    └── registro-fonti.csv
```

Le sottocartelle riflettono le parti del libro. Le figure attuali sono generate
da codice R dentro i capitoli, quindi non esistono ancora file immagine
autonomi: eventuali figure statiche future andranno in `figure/originali/` o
`figure/derivate/`. I materiali sorgente restano in `slide/` e non vanno copiati
sotto `didattica/`.

## 9. Sequenza di lavoro per agenti futuri

### Fase A — decisioni e infrastruttura

| Task | Output | Dipendenze | Criterio di accettazione |
|---|---|---|---|
| A1 | Approvazione o revisione dell'indice | questo piano | Ogni pagina ha confini chiari e non ci sono duplicazioni evidenti. |
| A2 | Inventario bibliografico per capitolo | A1 | Ogni affermazione centrale delle slide è collegata a una fonte verificabile; Haier e Warne sono usati come mappe secondarie; riferimenti mancanti segnalati. |
| A3 | Registro figure e triage iniziale | A1 | Ogni candidato è classificato per utilità, provenienza, licenza e rischio. Nessuna immagine è importata “alla cieca”. |
| A4 | Scheletro Quarto e navigazione | A1 | Cartelle e placeholder minimi, `_quarto.yml` valido, sezioni protette invariate. |

### Fase B — due piloti prima della produzione estesa

Scrivere due capitoli con difficoltà diverse:

- **Pilota narrativo:** capitolo 2, “Che cosa chiamiamo intelligenza”.
- **Pilota quantitativo:** capitolo 3 o 4, “Correlazione” oppure “Distribuzioni e
  punteggi”.

Il confronto serve a fissare voce, densità, callout, trattamento delle formule,
didascalie e lunghezza effettiva. Solo dopo revisione dei piloti conviene
parallelizzare gli altri capitoli.

### Fase C — pacchetti di scrittura

I pacchetti riducono le incoerenze concettuali. Possono essere assegnati a task
distinti dopo i piloti:

- C1: capitoli 1–2, orientamento e definizione;
- C2: capitoli 3–5, linguaggio quantitativo e qualità della misura;
- C3: capitoli 6–7, modelli dell'intelligenza;
- C4: capitoli 8–9, storia e batterie;
- C5: capitoli 10–11, genetica comportamentale e molecolare;
- C6: capitoli 12–14, cervello, cambiamento storico e potenziamento;
- C7: capitoli 15–17, esiti nella vita reale;
- C8: capitoli 18–19, neurosviluppo e valutazione.
- C9: approfondimenti A–B, “Oltre *g*”; task differibile e indipendente dalla
  prima release.

Ogni pacchetto deve consegnare anche un elenco di sovrapposizioni, rinvii interni
e termini da armonizzare, senza modificare capitoli assegnati ad altri task.

### Fase D — integrazione e controllo

Un singolo task di integrazione gestisce i file condivisi:

1. navigazione e cross-reference;
2. deduplicazione e glossario;
3. normalizzazione di citazioni e bibliografia;
4. registro figure e attribuzioni visibili;
5. render completo e controllo visivo desktop/mobile;
6. controllo di link, testo alternativo, formule, tabelle e callout;
7. verifica esplicita che `divulgazione-pagine/` e `professione-pagine/` non siano
   cambiate.

## 10. Decisioni ancora aperte

Prima della stesura estesa vanno confermati:

- mantenere 19 pagine oppure accorpare “Salute e longevità” con “Scuola e
  condizioni sociali”;
- collocare il neurosviluppo nel corpo principale, come qui proposto, oppure in
  una parte avanzata esplicitamente opzionale;
- livello di tecnicità dei box su omega, modelli fattoriali, GWAS e invarianza;
- presenza di esercizi/autoverifica e loro formato;
- politica per materiali interattivi e fallback statico;
- se la bibliografia debba essere unica o affiancata da brevi “letture
  consigliate” alla fine di ogni pagina;
- licenza e provenienza effettiva delle figure originali presenti nelle slide.
- includere entrambi gli approfondimenti “Oltre *g*” nella prima release oppure
  prepararli in una fase successiva.

## 11. Criterio per approvare la struttura

La struttura è pronta per diventare scheletro Quarto se:

- l'ordine permette di capire ogni capitolo con i prerequisiti già introdotti;
- ciascun tema delle slide ha una destinazione unica o un rinvio motivato;
- le pagine previste hanno ampiezza comparabile;
- i temi clinici e controversi hanno spazio sufficiente per limiti e cautele;
- il piano delle figure è sostenibile senza dipendere da materiale protetto;
- il libro resta un testo autonomo, non una raccolta di slide commentate.
