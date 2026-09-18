@echo off
REM gr.cmd - git remote add origin url

if "%1"=="" (
    echo Error: Remote URL required.
    exit /b 1
)

git remote add origin %1
