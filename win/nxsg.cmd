@echo off
REM nxsg.cmd - Add skills globally for Codex, GitHub Copilot, and Claude Code.
REM Usage: nxsg <package> [additional params...]

if "%~1"=="" (
    echo Usage: nxsg ^<package^> [additional params...]
    exit /b 1
)

call npx skills add %* -g -a codex github-copilot claude-code
exit /b %errorlevel%
