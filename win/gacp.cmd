@echo off
REM gacp.cmd - Add, commit, and push with interactive prompts

SETLOCAL ENABLEDELAYEDEXPANSION

SET commit_msg=%~1
SET branch_name=%~2

IF "%commit_msg%"=="" (
  SET /P commit_msg=Enter commit message: 
)

IF "%branch_name%"=="" (
  FOR /F "delims=" %%b IN ('git rev-parse --abbrev-ref HEAD') DO SET branch_name=%%b
)

git add .
git commit -m "%commit_msg%"
git push origin "%branch_name%"
