@echo off
setlocal

set "ROOT_DIR=%~dp0..\..\"
cd /d "%ROOT_DIR%"

echo Lyceum Backend
echo --------------
echo Activating Python venv...
call "%ROOT_DIR%.venv\Scripts\activate.bat"

echo Running Django checks...
python backend\manage.py check
if errorlevel 1 (
  echo.
  echo [ERROR] Django check failed.
  pause
  exit /b 1
)

echo.
echo Starting Django at http://127.0.0.1:8000
python backend\manage.py runserver 127.0.0.1:8000

endlocal
