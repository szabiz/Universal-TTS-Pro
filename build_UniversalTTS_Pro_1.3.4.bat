@echo off
REM ════════════════════════════════════════════════════════════════════
REM  build_UniversalTTS_Pro.bat
REM  Futtasd a projekt gyokermappajabol!
REM  Teljesen tiszta, izolalt venv alapu build folyamat (szuz telepites)
REM ════════════════════════════════════════════════════════════════════

echo.
echo  === UniversalTTS_Pro TISZTA BUILD INDUL ===
echo.

REM 1. Elozo build_venv torlese, ha letezik (hogy garantaltan szuz legyen)
if exist "build_venv" (
    echo [INFO] Elozo tiszta kornyezet torlese...
    rmdir /s /q "build_venv"
)

REM 2. Uj, tiszta virtualis kornyezet letrehozasa
echo [INFO] Friss Python virtualis kornyezet (venv) letrehozasa...
python -m venv build_venv
if %errorlevel% neq 0 (
    echo [HIBA] Nem sikerult letrehozni a virtualis kornyezetet! Ellenorizd a Python telepitesed.
    pause
    exit /b 1
)

REM 3. Pip frissitese a tiszta kornyezetben
echo [INFO] Pip frissitese...
build_venv\Scripts\python -m pip install --upgrade pip >nul 2>&1

REM 4. Fuggosegek telepitese a tiszta kornyezetbe
echo [INFO] Szukseges csomagok telepitese...

if exist "requirements.txt" (
    echo [INFO] requirements.txt talalhato, csomagok telepitese abbol...
    build_venv\Scripts\pip install -r requirements.txt
) else (
    echo [FIGYELEM] requirements.txt nem talalhato! Alapveto csomagok telepitese...
    :: Itt mar benne van a supertonic is, hogy ne hianyozzon!
    build_venv\Scripts\pip install numpy sounddevice sherpa-onnx supertonic
)

REM JAVITVA: kulon ellenorzes MINDJART a fuggosegek telepitese utan,
REM nem a pyinstaller-telepites utan (az korabban elfedte ezt a hibat!)
if %errorlevel% neq 0 (
    echo.
    echo [HIBA] A fuggosegek telepitese sikertelen volt!
    echo        Ellenorizd a Python verziot es az internetkapcsolatot.
    pause
    exit /b 1
)

REM 5. PyInstaller biztos telepitese a venv-be
echo [INFO] PyInstaller telepitese...
build_venv\Scripts\pip install pyinstaller

REM JAVITVA: ez az ellenorzes most mar tenyleg csak a pyinstaller
REM telepitesere vonatkozik, nem keveredik ossze az elozo lepessel.
if %errorlevel% neq 0 (
    echo.
    echo [HIBA] A PyInstaller telepitese sikertelen volt!
    pause
    exit /b 1
)

echo [OK] Tiszta kornyezet es osszes fuggoseg sikeresen telepitve.
echo.

REM 6. Build futtatasa a tiszta venv Python moduljaval
echo [INFO] PyInstaller build inditasa...
build_venv\Scripts\python -m PyInstaller UniversalTTS_Pro.spec --noconfirm --clean

if %errorlevel% neq 0 (
    echo.
    echo [HIBA] Build sikertelen!
    pause
    exit /b 1
)

REM ── models/ mappa masolasa az exe melle (nem _internal-ba!) ──
if exist "models" (
    echo.
    echo  Modellek masolasa: dist\UniversalTTS_Pro\models\
    if exist "dist\UniversalTTS_Pro\models" (
        rmdir /s /q "dist\UniversalTTS_Pro\models"
    )
    xcopy /E /I /Q "models" "dist\UniversalTTS_Pro\models"
    echo  [OK] models/ atmasolva
) else (
    echo  [FIGYELEM] models/ mappa nem talalhato - kezileg masold at!
)

echo.
echo  === BUILD SIKERESEN BEFEJEZODOTT ===
echo  Az elerheto program itt talalhato: dist\UniversalTTS_Pro\
echo.
pause
