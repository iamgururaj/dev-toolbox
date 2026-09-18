@echo off
REM gls.cmd - git log with commit time, oneline, -n <number>

IF "%~1"=="" (
  echo Error: Number of logs required.
  exit /b 1
)

git log --pretty=format:"%%h %%ad %%s" --date=iso -n %1