@echo off
REM gsu.cmd - set upstream to origin/<current-branch>

setlocal EnableExtensions EnableDelayedExpansion

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo Not inside a git repository.
  exit /b 1
)

set "branch="
for /f "delims=" %%b in ('git branch --show-current') do set "branch=%%b"

if "!branch!"=="" (
  echo You are not on a branch. Switch to a branch before running this command.
  exit /b 1
)

git branch --set-upstream-to=origin/!branch! !branch!
if errorlevel 1 exit /b 1

endlocal