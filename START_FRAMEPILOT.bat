@echo off
cd /d "%~dp0"
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0RUN_WINDOWS.ps1"
if errorlevel 1 (
  echo.
  echo FramePilot could not start. Check the error shown above.
  pause
)
