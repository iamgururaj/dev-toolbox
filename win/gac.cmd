@echo off
REM Usage: gac "commit message"

IF "%~1"=="" (
  echo Error: Commit message required. Usage: gac "commit message"
  exit /b 1
)

git add .
git commit -m "%~1"
