@echo off
REM Clone a GitHub repository into the current directory by default.
gh repo clone %*
exit /b %errorlevel%
