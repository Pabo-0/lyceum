@echo off
setlocal

set "ROOT_DIR=%~dp0"
cd /d "%ROOT_DIR%"

echo Starting Lyceum local development...
echo.

if not exist "%ROOT_DIR%.venv\Scripts\python.exe" (
  echo [ERROR] Python virtual environment not found at .venv
  echo Create it with:
  echo   python -m venv .venv
  echo   .venv\Scripts\python.exe -m pip install -r requirements\dev.txt
  pause
  exit /b 1
)

if not exist "%ROOT_DIR%backend\.env" (
  echo [ERROR] backend\.env was not found.
  echo Copy backend\.env.example to backend\.env and add local secrets.
  pause
  exit /b 1
)

if not exist "%ROOT_DIR%frontend\.env" (
  echo [ERROR] frontend\.env was not found.
  echo Copy frontend\.env.example to frontend\.env.
  pause
  exit /b 1
)

if not exist "%ROOT_DIR%frontend\node_modules\.bin\vite.CMD" (
  echo Installing frontend dependencies with pnpm...
  cd /d "%ROOT_DIR%frontend"
  call pnpm install
  if errorlevel 1 (
    echo [ERROR] Frontend dependency installation failed.
    pause
    exit /b 1
  )
  cd /d "%ROOT_DIR%"
)

echo Opening backend and frontend terminals...
start "Lyceum Backend" /d "%ROOT_DIR%" cmd /k "scripts\local\run_backend.bat"
start "Lyceum Frontend" /d "%ROOT_DIR%" cmd /k "scripts\local\run_frontend.bat"

echo.
echo Backend:  http://127.0.0.1:8000
echo Frontend: http://localhost:5173
echo.
echo Close the two opened terminal windows to stop the servers.
endlocal
