@echo off
REM Shortcut for 'poetry add <package>'
IF "%~1"=="" (
  ECHO Usage: pa <package>
  EXIT /B 1
)
poetry add %~1
