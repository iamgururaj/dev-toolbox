@echo off

REM gm.cmd - git merge <branch>

IF "%1"=="" (
  echo Error: Branch name required.
  exit /b 1
)

git merge %1
