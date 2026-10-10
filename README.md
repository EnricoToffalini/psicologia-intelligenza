Libro online: https://enricotoffalini.github.io/psicologia-intelligenza/
(versione PDF scaricabile dall'icona in alto nel sito)

Repository di supporto a insegnamento e divulgazione sulla psicologia dell'intelligenza umana. Questa repo raccoglie materiali didattici e divulgativi (dispense, slide, letture di approfondimento e risorse multimediali) relativi al tema della Psicologia dell'Intelligenza Umana. L'obiettivo è offrire uno spazio di riferimento aggiornato e accessibile per studenti e interessati al tema, favorendo una comprensione integrata dei diversi approcci teorici, metodologici e applicativi allo studio dell'intelligenza umana.

## Come modificare e pubblicare il libro

1. **Modifica i sorgenti**, mai `website/`:
   - capitoli: `didattica/<parte>/<capitolo>.qmd`;
   - introduzione: `index.qmd`; altre sezioni: `divulgazione-pagine/`, `professione-pagine/`;
   - impostazioni comuni: `_quarto.yml`; ordine di parti e capitoli del sito:
     `_quarto-sito.yml`; del libro PDF (solo didattica, formato A5): `_quarto-libro.yml`;
   - fonti citate: `references.bib` (unico archivio; `bibliografia.qmd` è solo la
     pagina che le stampa e non va toccata); stile grafico e PDF: `assets/`.
2. **Renderizza**: doppio clic su `render.bat` (Windows) oppure `sh render.sh`.
   Rigenera in `website/` sia il sito sia `Psicologia-dell-Intelligenza.pdf`
   (il PDF contiene solo la parte didattica).
   Servono Quarto, R con `ggplot2` e una distribuzione LaTeX con `xelatex`.
3. **Pubblica**: `git add -A`, `git commit`, `git push`. GitHub Pages pubblica la
   cartella `website/` così com'è: senza il passo 2 online resta la versione vecchia
   (un controllo automatico blocca il commit in quel caso).

`website/` viene cancellata e riscritta a ogni render: qualsiasi modifica fatta lì
a mano va persa. I file `*.tex` e le cartelle `*_files/` che compaiono durante il
render sono intermedi e vengono rimossi dallo script. `progetto/` contiene piano,
stato dei lavori e registro delle figure, che non finiscono nel libro; le istruzioni per agenti AI sono in
`AGENTS.md`.

## Licenza
Questo progetto è rilasciato sotto licenza [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/).
