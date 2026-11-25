@echo off
chcp 65001 > nul
cd /d "%~dp0"
py -3 -m pip install -r requirements.txt
if errorlevel 1 pause & exit /b 1
py -3 aktualizuj.py --max-channels 15 --max-pages 2 --max-new 30
if errorlevel 1 echo Wystapil blad. Sprawdz log powyzej.
echo Wyniki znajduja sie w folderze wyniki
pause
