@echo off
setlocal

set "ROOT_DIR=%~dp0..\..\"
cd /d "%ROOT_DIR%frontend"

echo Lyceum Frontend
echo ---------------

if not exist "node_modules\.bin\vite.CMD" (
  echo Installing frontend dependencies with pnpm...
  call pnpm install
  if errorlevel 1 (
    echo.
    echo [ERROR] pnpm install failed.
    pause
    exit /b 1
  )
)

echo Starting Vite at http://localhost:5173
call node_modules\.bin\vite.CMD --host localhost

endlocal
