@echo off
REM gpf.cmd - pull a file from a branch, commit, and push

setlocal

set "branch=%~1"
set "path=%~2"
set "message=%~3"
set "remote=%~4"

if "%branch%"=="" (
  set /p branch=Branch to pull from: 
)

if "%path%"=="" (
  set /p path=Path to file: 
)

if "%remote%"=="" (
  set /p remote=Remote (default: origin): 
)
if "%remote%"=="" set "remote=origin"

if "%message%"=="" set "message=Merge %path% from %branch%"

git rev-parse --is-inside-work-tree >nul 2>&1
if errorlevel 1 (
  echo Not inside a git repository.
  exit /b 1
)

REM Fetch the file from the specified branch and merge into current branch.
git fetch "%remote%" "%branch%"
if errorlevel 1 exit /b 1

git checkout FETCH_HEAD -- "%path%"
if errorlevel 1 exit /b 1

git add "%path%"
if errorlevel 1 exit /b 1

git commit -m "%message%"
if errorlevel 1 exit /b 1

git push "%remote%" HEAD
if errorlevel 1 exit /b 1

endlocal
