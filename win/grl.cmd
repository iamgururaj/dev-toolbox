@echo off
REM grl.cmd - hard reset to previous n commits (removes last n commits from history)

set num=%1
if "%num%"=="" set num=1

git reset --hard HEAD~%num%
