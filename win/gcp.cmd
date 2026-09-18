@echo off
REM gcp.cmd - git cherry-pick <commit-hash>

if "%1"=="" (
    echo Error: Commit hash required.
    exit /b 1
)

git cherry-pick %1
