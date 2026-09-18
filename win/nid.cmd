@echo off
REM nid.cmd - npm install --save-dev (accepts package names)

if "%1"=="" (
    echo Error: Package name(s) required.
    exit /b 1
)

npm install --save-dev %*
