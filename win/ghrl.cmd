@echo off
REM List GitHub repositories for a user or organization.
gh repo list %*
exit /b %errorlevel%
