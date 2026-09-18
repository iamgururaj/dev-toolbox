@echo off
REM gcm.cmd - git commit -m <message>

if "%~1"=="" (
    echo Usage: gcm.cmd "commit message"
    exit /b 1
)
git commit -m "%*"
