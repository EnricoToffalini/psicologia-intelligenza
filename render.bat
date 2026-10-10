@echo off
rem Rigenera il libro (HTML + PDF) in website\ e pulisce i residui del render.
rem Uso: doppio clic, oppure "render" dal terminale nella cartella del progetto.
cd /d "%~dp0"
git config core.hooksPath .githooks >nul 2>&1

quarto render
if errorlevel 1 (
  echo.
  echo ERRORE: il render non e' riuscito. Leggi i messaggi sopra.
  pause
  exit /b 1
)

del /q *.tex *.log >nul 2>&1
if exist site_libs rmdir /s /q site_libs
for %%D in (didattica divulgazione-pagine professione-pagine) do (
  for /d /r "%%D" %%F in (*_files) do if exist "%%F" rmdir /s /q "%%F"
)

if not exist "website\Psicologia-dell-Intelligenza.pdf" (
  echo ERRORE: manca website\Psicologia-dell-Intelligenza.pdf
  pause
  exit /b 1
)
echo.
echo Fatto. Sito e PDF aggiornati in website\  -  ora puoi fare commit e push.
pause
