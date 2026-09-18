@echo off
REM gco.cmd - git checkout branch

if "%1"=="" (
    echo Error: Branch name required.
    exit /b 1
)

git checkout %1
