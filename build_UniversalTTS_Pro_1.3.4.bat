@echo off
REM ════════════════════════════════════════════════════════════════════
REM  build_UniversalTTS_Pro.bat
REM  Run this from the project root folder!
REM  Fully clean, isolated venv-based build process (virgin install)
REM ════════════════════════════════════════════════════════════════════

echo.
echo  === UniversalTTS_Pro CLEAN BUILD STARTING ===
echo.

REM 1. Delete previous build_venv, if it exists (to guarantee a clean environment)
if exist "build_venv" (
    echo [INFO] Removing previous clean environment...
    rmdir /s /q "build_venv"
)

REM 2. Create a new, clean virtual environment
echo [INFO] Creating fresh Python virtual environment (venv)...
python -m venv build_venv
if %errorlevel% neq 0 (
    echo [ERROR] Failed to create the virtual environment! Check your Python installation.
    pause
    exit /b 1
)

REM 3. Upgrade pip in the clean environment
echo [INFO] Upgrading pip...
build_venv\Scripts\python -m pip install --upgrade pip >nul 2>&1

REM 4. Install dependencies into the clean environment
echo [INFO] Installing required packages...

if exist "requirements.txt" (
    echo [INFO] requirements.txt found, installing packages from it...
    build_venv\Scripts\pip install -r requirements.txt
) else (
    echo [WARNING] requirements.txt not found! Installing default packages...
    :: supertonic is already included here, so it won't be missing!
    build_venv\Scripts\pip install numpy sounddevice sherpa-onnx supertonic
)

REM FIXED: separate check RIGHT AFTER dependency installation,
REM not after the pyinstaller install (that used to hide this error!)
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Dependency installation failed!
    echo         Check your Python version and internet connection.
    pause
    exit /b 1
)

REM 5. Make sure PyInstaller is installed into the venv
echo [INFO] Installing PyInstaller...
build_venv\Scripts\pip install pyinstaller

REM FIXED: this check now truly only applies to the PyInstaller
REM installation, no longer mixed up with the previous step.
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] PyInstaller installation failed!
    pause
    exit /b 1
)

echo [OK] Clean environment and all dependencies installed successfully.
echo.

REM 6. Run the build using the clean venv's Python module
echo [INFO] Starting PyInstaller build...
build_venv\Scripts\python -m PyInstaller UniversalTTS_Pro.spec --noconfirm --clean

if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Build failed!
    pause
    exit /b 1
)

REM ── Copy models/ folder next to the exe (NOT into _internal!) ──
if exist "models" (
    echo.
    echo  Copying models: dist\UniversalTTS_Pro\models\
    if exist "dist\UniversalTTS_Pro\models" (
        rmdir /s /q "dist\UniversalTTS_Pro\models"
    )
    xcopy /E /I /Q "models" "dist\UniversalTTS_Pro\models"
    echo  [OK] models/ copied
) else (
    echo  [WARNING] models/ folder not found - copy it manually!
)

REM ── Copy license_texts/ folder next to the exe (MANDATORY!) ──
REM  This contains the full license texts displayed by the license
REM  gates (Supertonic / Piper-ONNX). Without it, the program will
REM  start, but the license acceptance window will show "MISSING" for
REM  every file, and the user will never be able to actually accept it!
if exist "license_texts" (
    echo.
    echo  Copying license texts: dist\UniversalTTS_Pro\license_texts\
    if exist "dist\UniversalTTS_Pro\license_texts" (
        rmdir /s /q "dist\UniversalTTS_Pro\license_texts"
    )
    xcopy /E /I /Q "license_texts" "dist\UniversalTTS_Pro\license_texts"
    echo  [OK] license_texts/ copied
) else (
    echo.
    echo  [ERROR] license_texts/ folder not found in the project root!
    echo          The license gates will not work - the build technically
    echo          completed, but DO NOT release/distribute it until this is fixed!
    pause
)

REM ── Copy the main license files next to the exe (LICENSE.txt / THIRD_PARTY) ──
if exist "LICENSE.txt" (
    copy /Y "LICENSE.txt" "dist\UniversalTTS_Pro\LICENSE.txt" >nul
    echo  [OK] LICENSE.txt copied
) else (
    echo  [WARNING] LICENSE.txt not found - copy it manually!
)

if exist "THIRD_PARTY_LICENSES.txt" (
    copy /Y "THIRD_PARTY_LICENSES.txt" "dist\UniversalTTS_Pro\THIRD_PARTY_LICENSES.txt" >nul
    echo  [OK] THIRD_PARTY_LICENSES.txt copied
) else (
    echo  [WARNING] THIRD_PARTY_LICENSES.txt not found - copy it manually!
)

REM ── Copy README.md next to the exe ──
if exist "README.md" (
    copy /Y "README.md" "dist\UniversalTTS_Pro\README.md" >nul
    echo  [OK] README.md copied
) else (
    echo  [WARNING] README.md not found - copy it manually!
)

echo.
echo  === BUILD COMPLETED SUCCESSFULLY ===
echo  THE AVAILABLE PROGRAM CAN BE FOUND HERE: dist\UniversalTTS_Pro\
echo  == szabiz ==
echo.
pause
