# Funzioni comuni per i diagrammi (scatole, ellissi, frecce) disegnati in base R.
# Si caricano nel chunk setup del capitolo con source("../../assets/diagrammi.R").
# Un diagramma ha le stesse proporzioni nel sito e nel PDF: nel sito la figura è
# più grande del fattore `scala`, e testo, linee e punte delle frecce crescono
# di conseguenza. Le misure della figura vanno quindi scritte come
# `#| fig-width: !expr 4.45 * scala` e `#| fig-height: !expr 3 * scala`.
stampa = knitr::is_latex_output()
scala = if (stampa) 1 else 1.5

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
  if (code == 0) segments(p0[1], p0[2], p1[1], p1[2], col = col, lwd = lwd * scala, lty = lty)
  else arrows(p0[1], p0[2], p1[1], p1[2], length = .06 * scala, angle = 22, code = code,
              col = col, lwd = lwd * scala, lty = lty)
  if (!is.null(etichetta)) {
    m = p0 + pos_et * (p1 - p0)
    text(m[1], m[2], etichetta, cex = cex_et, col = col_et, adj = adj_et)
  }
}

# Freccia libera fra due punti
freccia = function(x0, y0, x1, y1, col = "grey25", lwd = 1.1, lty = 1, code = 2)
  arrows(x0, y0, x1, y1, length = .06 * scala, angle = 22, code = code, col = col, lwd = lwd * scala, lty = lty)
