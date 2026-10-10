---
title: "Dossier — Correlazione e differenze individuali"
lang: it
date: 2026-09-15
---

Progettazione del capitolo 3, non testo destinato alla pubblicazione.

## Mandato e tesi

Slug previsto: `didattica/dati-misure-punteggi/correlazione.qmd`.
Fonte di perimetro: `slide/La Correlazione spiegata facile.pdf`, 19 pagine.

Domanda guida: che cosa permette di concludere una correlazione fra due misure,
e che cosa richiede altre informazioni?

Tesi da sviluppare: la correlazione riassume una regolarità fra differenze
individuali. Va interpretata insieme alla forma dei dati, alla loro incertezza
e al disegno dello studio. Descrizione, previsione e spiegazione causale sono
passaggi distinti.

## Mappa delle slide

| Pagine PDF | Contenuto | Decisione per il pilota |
|---|---|---|
| 1–2 | Frontespizio e introduzione | Sostituire con apertura autonoma. |
| 3–5 | Intuizione, segno, intensità, esempio QI–voti | Nucleo iniziale; esplicitare che Pearson descrive l'associazione lineare. Usare dati costruiti. |
| 6–7 | Interpretazione tramite deviazioni standard | Rinviare al capitolo 4: qui creerebbe un prerequisito non ancora introdotto. |
| 8 | Etichette di intensità | Conservare il confronto grafico; eliminare soglie universali e inferenza di identità dei costrutti. |
| 9 | Varianza spiegata | Un breve «Punto metodologico», con condizioni del rapporto tra r e R². |
| 10 | Outlier e Spearman | Breve richiamo a ispezione dei dati; nessun automatismo di sostituzione del coefficiente. |
| 11–13 | Non linearità, LOESS e modello quadratico | Una relazione a U basta per mostrare il limite di r. Omettere confronto fra algoritmi e giudizio generale sui polinomi. |
| 14–17 | Incertezza, significatività e cause | Riorganizzare: stima campionaria → incertezza → possibili spiegazioni. |
| 18–19 | Mediazione e moderazione | Conservare entrambe, con un esempio ipotetico semplice e linguaggio causale condizionale. |

Le etichette di priorità didattica delle pp. 9–13 non si trasferiscono nel libro.
Gli esempi legati a prove accademiche contingenti vanno sostituiti con attività
di apprendimento o prestazioni descritte senza logistica del corso.

## Correzioni prima della stesura

| Punto delle slide | Specificazione necessaria | Fonte o verifica |
|---|---|---|
| P. 4: r = 0 come assenza di relazione | Assenza di associazione **lineare**; una relazione a U può avere r = 0. | @schober2018correlation; esempio algebrico sotto. |
| P. 4: intensità come rarità delle eccezioni | Leggere quanto i punti si dispongono lungo una retta; r non è la percentuale di persone che seguono una regola. | @schober2018correlation. |
| Pp. 6–7: da z = 1 a un valore medio pari a r | Vale per il valore adattato dalla regressione lineare semplice standardizzata; l'interpretazione come media condizionata richiede una relazione media lineare. | @pennstateSimpleLinearRegression. |
| P. 8: soglie qualitative rigide | Interpretare grandezza e utilità nel contesto della domanda. | @schober2018correlation, sezione sull'interpretazione. |
| P. 8: r = 0,80 implica lo stesso costrutto | Non basta: r² = 0,64 nel modello semplice. L'identità teorica non si ricava da una soglia numerica. | Calcolo e distinzione concettuale; rinvio alla validità di misura. |
| P. 9: R² come quadrato di r | Specificare regressione lineare semplice ai minimi quadrati con intercetta, sugli stessi dati. «Spiegata» ha qui significato statistico. | @pennstateSimpleLinearRegression. |
| P. 10: Spearman come soluzione agli outlier | I ranghi limitano l'influenza delle distanze estreme, ma descrivono un'associazione monotona; controllare dati e domanda prima di scegliere. | @schober2018correlation. |
| Pp. 15–16: significatività come verifica che la correlazione sia reale | Distinguere stima, precisione e compatibilità con un modello nullo. p non misura né grandezza dell'effetto né probabilità che l'ipotesi sia vera. | @wasserstein2016pvalues. |
| P. 17: correlazione implica comunque qualche causalità | Considerare cause comuni, selezione e oscillazioni campionarie; non inferire automaticamente un legame causale tra le due variabili. | @rohrer2018thinking. |
| P. 17: precedenza temporale risolve la direzione | La sequenza temporale aiuta, ma non elimina confondimento e altri problemi del disegno. | @rohrer2018thinking. |
| P. 18: mediazione come causazione già accertata | Presentare un percorso causale ipotizzato; una mediazione statistica trasversale non dimostra il processo nel tempo. | @maxwell2007bias. |
| P. 19: moderazione come causazione modificata | Definire anzitutto un'associazione che varia con una terza variabile; l'interpretazione causale richiede ulteriori assunzioni. | Distinzione concettuale di @baron1986moderator; cautele di @rohrer2018thinking. |

Queste specificazioni non richiedono un capitolo tecnico: bastano formulazioni
esatte, un controesempio ben scelto e rinvii mirati.

## Fonti: livello effettivo di verifica

Verifica svolta il 15 settembre 2026. Le fonti metodologiche sono state aggiunte
per controllare le slide; non erano tutte citate nel PDF.

- **Schober, Boer e Schwarte (2018).** Verificati abstract nel
  [repository istituzionale](https://pure.amsterdamumc.nl/en/publications/correlation-coefficients-appropriate-use-and-interpretation/)
  e passaggio sulle soglie nel [testo indicizzato dall'editore](https://doi.org/10.1213/ANE.0000000000002864).
  Non recuperato integralmente il PDF. Il repository esporta gli autori in
  ordine diverso: nel BibTeX si adotta Schober, Boer, Schwarte, riscontrato nei
  [metadati bibliografici PubMed che richiamano l'articolo](https://pubmed.ncbi.nlm.nih.gov/39163456/).
- **Penn State, STAT 501.** Verificate le sezioni 1.5, 1.6 e 1.8 dei
  [materiali ufficiali sulla regressione semplice](https://online.stat.psu.edu/stat501/Lesson01).
  Fonte didattica per identità algebriche e limiti interpretativi; non fonte di
  dati sull'intelligenza. La relazione standardizzata si ricava ponendo
  entrambe le deviazioni standard uguali a 1 nella formula della pendenza.
- **Wasserstein e Lazar (2016).** Identificati DOI, fascicolo e autori; verificati
  i principi nel [testo indicizzato dell'articolo](https://doi.org/10.1080/00031305.2016.1154108)
  e il rilascio nella [comunicazione ufficiale ASA](https://community.amstat.org/communities/community-home/digestviewer/viewthread?CommunityKey=6b2d607a-e31f-4f19-8357-020a8631b999&GroupId=2653&MID=31155&tab=digestviewer).
  L'apertura diretta del testo completo ha restituito un errore di accesso.
- **Rohrer (2018).** Consultate le sezioni su confondimento, selezione e
  mediazione nel [testo dell'editore](https://doi.org/10.1177/2515245917745629).
  Base per distinguere schemi causali ipotizzati e associazioni osservate.
- **Maxwell e Cole (2007).** Verificati metadati e
  [abstract dello studio metodologico](https://pubmed.ncbi.nlm.nih.gov/17402810/).
  Supporta la cautela generale sulla mediazione trasversale; non se ne
  trasferiscono risultati numerici o dettagli non controllati nel testo.
- **Baron e Kenny (1986).** Verificati metadati e
  [abstract dell'articolo](https://pubmed.ncbi.nlm.nih.gov/3806354/).
  Riferimento storico per distinguere i due concetti; non adottare la procedura
  a passi come protocollo aggiornato di analisi.

## Scaletta e prerequisiti

Obiettivo: circa 1.800 parole, sei sezioni più apertura. Il lettore deve sapere
solo che le persone possono differire su due misure. Non richiedere già punti z,
test di ipotesi, analisi fattoriale o regressione multipla.

| Sezione | Passaggio da costruire | Parole |
|---|---|---:|
| Apertura, senza titolo | Una previsione può essere utile anche quando ammette molti casi discordanti. | 100 |
| Leggere una nuvola di punti | Due misure per persona, segno, intensità e intervallo da −1 a +1. | 350 |
| Quanto dice un numero | Interpretazione contestuale; previsione imperfetta; breve box su r². | 300 |
| Guardare anche la forma | Relazione a U; casi influenti; differenza essenziale fra Pearson e Spearman. | 260 |
| Dal campione alla popolazione | Incertezza della stima, numerosità e limiti di una soglia di significatività. | 220 |
| Dall'associazione alle spiegazioni | Causa comune, direzione, selezione; distinguere mediazione e moderazione con un esempio. | 470 |
| In breve | Quattro controlli: segno, intensità, forma, disegno. | 100 |
| **Totale** | | **1.800** |

Il capitolo 4 riprenderà le pp. 6–7 con la formula
$\widehat{z_Y} = r z_X$ e ne spiegherà il significato. Questo dossier assegna il
rinvio, senza modificare quel capitolo o il piano generale.

## Specifica per esempi e figure originali

### Figura 1: associazioni diverse, stessa scala

Una figura a quattro pannelli: associazione positiva, negativa, quasi nulla e
relazione a U. Usare etichette neutre «Misura A» e «Misura B», unità identiche
fra pannelli comparabili, marcatori leggibili senza distinguere colori e valori
di r calcolati dai punti effettivamente disegnati.

Per i primi tre pannelli, dati simulati con seme registrato; scrivere
«dati simulati a scopo illustrativo» in didascalia. Non attribuire quei numeri a
una popolazione o a una meta-analisi. Per la U basta il seguente controesempio
costruito, verificabile senza simulazione:

| x | −2 | −1 | 0 | 1 | 2 |
|---|---:|---:|---:|---:|---:|
| y = x² | 4 | 1 | 0 | 1 | 4 |

La media di x è zero e la somma dei prodotti x·y è zero: la covarianza è zero,
quindi r = 0, pur essendo y determinato esattamente da x. Questo esempio
illustra un'identità matematica; non rappresenta cinque partecipanti reali.

Testo alternativo previsto: «Quattro diagrammi mostrano andamenti crescente,
decrescente, senza tendenza lineare e a U. Il coefficiente di Pearson può
essere nullo anche quando i punti seguono esattamente una curva.»

### Figura 2: causa comune e mediazione

Due schemi piccoli, creati con funzionalità native di Quarto:
`A ← C → B` e `A → M → B`. Didascalia: le frecce esprimono ipotesi causali,
non conclusioni tratte dalle sole correlazioni. Specificare in prosa che un
modello di mediazione può includere anche un percorso diretto da A a B.

Per la moderazione basta un esempio verbale ipotetico: l'associazione fra tempo
di pratica e prestazione può dipendere dall'esperienza iniziale. Per la
mediazione: si ipotizza che una pratica diversa modifichi una strategia, che a
sua volta influisca sulla prestazione. Non presentare questi esempi come
risultati empirici dimostrati.

Testo alternativo previsto: «Nel primo schema C influenza sia A sia B; nel
secondo il percorso da A a B passa attraverso M.»

### Triage delle immagini nelle slide

La ricognizione è testuale: paternità delle immagini, dati sorgente e licenze
non sono verificati. Nessun candidato è approvato per l'importazione.

| Origine | Funzione | Provenienza e base d'uso | Rischio e decisione |
|---|---|---|---|
| Pp. 4–8, nuvole di punti ed emoji | Segno e intensità | Autori dei singoli elementi, anno, dati e licenze non verificati | Rischio non determinato; sostituzione con la figura 1 originale. |
| Pp. 10–13, outlier e adattamenti | Limiti del coefficiente lineare | Dati e fonte grafica non verificati | Rischio non determinato; sostituzione con il controesempio a U. |
| Pp. 15–16, campioni di diversa numerosità | Variabilità campionaria | Dati, seme e paternità grafica non verificati | Rischio non determinato; sostituzione con spiegazione verbale nel pilota. |
| P. 18, schema di mediazione | Percorsi indiretti | Non accertata la paternità dello schema | Rischio non determinato; sostituzione con la figura 2 e nuovo esempio. |
| P. 19, grafici di moderazione | Variazione dell'associazione | Fonti dei risultati e licenze non verificate | Rischio non determinato; sostituzione con esempio ipotetico in prosa. |

Prima di creare e integrare gli asset, registrare file, autore, data, codice o
dati, licenza effettiva, didascalia e testo alternativo nel registro generale.
Le descrizioni sopra sono specifiche di lavoro, non immagini già prodotte.

## Controlli per la futura stesura

- Nessun valore simulato presentato come dato empirico.
- Nessuna stima di correlazione descritta come percentuale di persone.
- Nessun p-value usato come probabilità che un'ipotesi sia vera.
- Nessun diagramma presentato come dimostrazione di un nesso causale.
- Valori nelle didascalie calcolati dagli stessi dati dei grafici.
- Distinzione chiara fra esempio algebrico, ipotesi e risultato scientifico.

## Riferimenti del dossier
