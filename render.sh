#!/bin/sh
# Rigenera il libro (HTML + PDF) in website/ e pulisce i residui del render.
# Uso: sh render.sh
set -e
cd "$(dirname "$0")"
git config core.hooksPath .githooks 2>/dev/null || true
quarto render
rm -f ./*.tex ./*.log
rm -rf site_libs
find didattica divulgazione-pagine professione-pagine -type d -name '*_files' -prune -exec rm -rf {} +
test -f website/Psicologia-dell-Intelligenza.pdf || { echo "ERRORE: manca il PDF in website/"; exit 1; }
echo "Fatto. Sito e PDF aggiornati in website/ - ora puoi fare commit e push."
