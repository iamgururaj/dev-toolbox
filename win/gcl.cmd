@echo off
REM gcl.cmd - git clone url

if "%1"=="" (
    echo Error: Repository URL required.
    exit /b 1
)

git clone %1
