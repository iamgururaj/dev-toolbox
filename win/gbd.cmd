@echo off
REM gbd.cmd - delete a git branch by name

IF "%~1"=="" (
  echo Usage: gbd ^<branch-name^>
  exit /b 1
)

git branch -D %1
