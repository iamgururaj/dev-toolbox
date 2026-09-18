@echo off
REM Show current date and time in UTC
for /f "tokens=2 delims==" %%A in ('wmic OS get LocalDateTime /value ^| find "LocalDateTime"') do set ldt=%%A
REM Format: YYYYMMDDhhmmss.xxxxxx+timezone
set yyyy=%ldt:~0,4%
set mm=%ldt:~4,2%
set dd=%ldt:~6,2%
set hh=%ldt:~8,2%
set mi=%ldt:~10,2%
set ss=%ldt:~12,2%
echo %yyyy%-%mm%-%dd%T%hh%:%mi%:%ss%Z
