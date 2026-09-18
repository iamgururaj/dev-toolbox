@echo off
REM ni.cmd - npm install (optionally accepts package names)

if "%~1"=="" (
    npm install
) else (
    npm install %*
)
