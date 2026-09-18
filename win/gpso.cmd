@echo off
REM gpso.cmd - git push origin branch

if "%1"=="" (
    echo Error: Branch name required.
    exit /b 1
)

git push origin %1
