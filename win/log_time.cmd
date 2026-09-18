@echo off
REM log_time.cmd: Usage log_time <start>
setlocal enabledelayedexpansion
set startTime=%~1
for /f "tokens=1-4 delims=:.," %%a in ("%startTime%") do set /a "startMs=(((%%a*60+%%b)*60+%%c)*1000+%%d*10)"
set endTime=%time%
for /f "tokens=1-4 delims=:.," %%a in ("!endTime!") do set /a "endMs=(((%%a*60+%%b)*60+%%c)*1000+%%d*10)"
set /a durationMs=endMs-startMs
set /a duration=durationMs/1000
set /a ms=durationMs%%1000
set /a s=durationMs/1000
set seconds=!duration!.!ms!
echo Time taken: !seconds!s (!durationMs!ms)
exit /b
