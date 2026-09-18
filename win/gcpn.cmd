@echo off
REM gcpn.cmd - cherry-pick last N commits from a branch onto current branch

IF "%~1"=="" (
  echo Usage: gcpn ^<branch^> ^<number-of-commits^>
  exit /b 1
)
IF "%~2"=="" (
  echo Usage: gcpn ^<branch^> ^<number-of-commits^>
  exit /b 1
)

set "branch=%~1"
set "n=%~2"

echo Cherry-picking these commits from %branch% (oldest first):
git log %branch% -%n% --reverse --oneline

FOR /F "delims=" %%H IN ('git log %branch% -%n% --reverse --format=%%H') DO (
  git cherry-pick %%H
)
