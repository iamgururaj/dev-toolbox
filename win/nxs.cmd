@echo off
REM nxs.cmd - Add skills for Codex, GitHub Copilot, and Claude Code.
REM Usage: nxs <package> [additional params...]

if "%~1"=="" (
    echo Usage: nxs ^<package^> [additional params...]
    exit /b 1
)

call npx skills add %* -a codex github-copilot claude-code -g
exit /b %errorlevel%
