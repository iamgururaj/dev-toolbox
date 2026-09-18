@echo off
REM gcob.cmd - git checkout -b branch

if "%1"=="" (
    echo Error: Branch name required.
    exit /b 1
)

git checkout -b %1
