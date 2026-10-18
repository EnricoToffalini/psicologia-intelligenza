# Funzioni comuni per i diagrammi (scatole, ellissi, frecce) disegnati in base R.
# Si caricano nel chunk setup del capitolo con source("../../assets/diagrammi.R").
# Un diagramma ha le stesse proporzioni nel sito e nel PDF: nel sito la figura è
# più grande del fattore `scala`, e testo, linee e punte delle frecce crescono
# di conseguenza. Le misure della figura vanno quindi scritte come
# `#| fig-width: !expr 4.45 * scala` e `#| fig-height: !expr 3 * scala`.
# Le figure contengono accenti, «», →, greco: se R parte con una codifica non
# UTF-8 (per esempio LC_ALL=C nell'ambiente) li scriverebbe come <U+00E0>.
# Si forza quindi la codifica UTF-8 e, se non è possibile, il render si ferma.
if (!l10n_info()$`UTF-8`)
  for (loc in c(".UTF-8", "C.UTF-8", "en_US.UTF-8", "it_IT.UTF-8"))
    if (suppressWarnings(Sys.setlocale("LC_CTYPE", loc)) != "" && l10n_info()$`UTF-8`) break
if (!l10n_info()$`UTF-8`) stop("R non usa la codifica UTF-8: accenti e simboli delle figure sarebbero illeggibili")
stampa = knitr::is_latex_output()
scala = if (stampa) 1 else 1.5
# Nel PDF le figure usano cairo_pdf, che gestisce caratteri come •, –, →, greco
if (stampa) knitr::opts_chunk$set(dev = "cairo_pdf")

# Area di disegno vuota in coordinate arbitrarie
tela = function(xlim = c(0, 10), ylim = c(0, 10)) {
  par(mar = c(0, 0, 0, 0), cex = scala, xpd = NA)
  plot(0, 0, type = "n", xlim = xlim, ylim = ylim, axes = FALSE, xlab = "", ylab = "", xaxs = "i", yaxs = "i")
}

# Disegna un nodo (scatola o ovale) e restituisce posizione e misure per collega()
nodo = function(x, y, testo = "", w = 2, h = .8, forma = "scatola", bg = "grey95",
                border = "grey35", cex = .75, font = 1, col = "black", lwd = 1) {
  if (forma == "ovale") {
    t = seq(0, 2 * pi, length.out = 120)
    polygon(x + w / 2 * cos(t), y + h / 2 * sin(t), col = bg, border = border, lwd = lwd * scala)
  } else if (forma == "scatola") {
    rect(x - w / 2, y - h / 2, x + w / 2, y + h / 2, col = bg, border = border, lwd = lwd * scala)
  }
  text(x, y, testo, cex = cex, font = font, col = col)
  invisible(list(x = x, y = y, w = w, h = h, forma = forma))
}

# Punto sul bordo di un nodo nella direzione (dx, dy)
bordo = function(n, dx, dy) {
  if (n$forma == "ovale") t = 1 / sqrt((dx / (n$w / 2))^2 + (dy / (n$h / 2))^2)
  else if (n$forma == "scatola") t = min(abs(n$w / 2 / dx), abs(n$h / 2 / dy))
  else t = 0
  c(n$x + t * dx, n$y + t * dy)
}

# Freccia fra due nodi, dal bordo dell'uno al bordo dell'altro.
# code = 2: verso b; code = 3: doppia; code = 0: semplice linea.
collega = function(a, b, col = "grey25", lwd = 1.1, lty = 1, code = 2, gap = .06, etichetta = NULL,
                   pos_et = .5, cex_et = .65, col_et = col, adj_et = c(.5, -.4)) {
  dx = b$x - a$x; dy = b$y - a$y
  p0 = bordo(a, dx, dy); p1 = bordo(b, -dx, -dy)
  u = c(dx, dy) / sqrt(dx^2 + dy^2)
  p0 = p0 + gap * u; p1 = p1 - gap * u
  freccia(p0[1], p0[2], p1[1], p1[2], col = col, lwd = lwd, lty = lty, code = code)
  if (!is.null(etichetta)) {
    m = p0 + pos_et * (p1 - p0)
    text(m[1], m[2], etichetta, cex = cex_et, col = col_et, adj = adj_et)
  }
}

# Punta piena di freccia in (x1, y1), orientata da (x0, y0); lunghezza in pollici.
# Le punte piene e larghe restano leggibili anche nella pagina A5.
punta = function(x0, y0, x1, y1, col = "grey25", lunghezza = .1, larghezza = .075) {
  ux = diff(par("usr")[1:2]) / par("pin")[1]; uy = diff(par("usr")[3:4]) / par("pin")[2]
  dx = (x1 - x0) / ux; dy = (y1 - y0) / uy; d = sqrt(dx^2 + dy^2)
  if (d == 0) return(invisible(c(x1, y1)))
  dx = dx / d; dy = dy / d; L = lunghezza * scala; W = larghezza * scala / 2
  bx = x1 - L * dx * ux; by = y1 - L * dy * uy
  polygon(c(x1, bx - W * dy * ux, bx + W * dy * ux), c(y1, by + W * dx * uy, by - W * dx * uy),
          col = col, border = col, lwd = .5)
  invisible(c(bx, by))
}

# Freccia libera fra due punti, con punta piena.
# code = 2: verso (x1, y1); code = 1: verso (x0, y0); code = 3: doppia; code = 0: linea.
freccia = function(x0, y0, x1, y1, col = "grey25", lwd = 1.1, lty = 1, code = 2) {
  a = c(x0, y0); b = c(x1, y1)
  if (code %in% c(2, 3)) b = punta(x0, y0, x1, y1, col = col)
  if (code %in% c(1, 3)) a = punta(x1, y1, x0, y0, col = col)
  segments(a[1], a[2], b[1], b[2], col = col, lwd = lwd * scala, lty = lty, lend = 1)
}
