@echo off
REM Append a directory to PATH for current user permanently.
REM Usage: apath <directory>

IF "%~1"=="" (
  ECHO Usage: apath ^<directory^>
  EXIT /B 1
)

SET "DIR=%~1"
IF NOT EXIST "%DIR%" (
  ECHO Directory does not exist: %DIR%
  EXIT /B 1
)

REM Get existing user PATH
FOR /F "usebackq tokens=*" %%A IN (`reg query HKCU\Environment /v PATH 2^>NUL ^| find /I "PATH"`) DO SET "LINE=%%A"
SET "CURRENT_PATH="
FOR /F "tokens=1,2,*" %%A IN ("%LINE%") DO SET "CURRENT_PATH=%%C"

ECHO %CURRENT_PATH% | FIND /I "%DIR%" >NUL
IF %ERRORLEVEL%==0 (
  ECHO Already present in user PATH.
  EXIT /B 0
)

SET "NEW_PATH=%DIR%;%CURRENT_PATH%"
REG ADD HKCU\Environment /F /V PATH /T REG_EXPAND_SZ /D "%NEW_PATH%" >NUL
ECHO Added to user PATH.
ECHO You must log off and back on OR run: setx PATH "%NEW_PATH%"
