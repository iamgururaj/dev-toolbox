@echo off
REM Script to run mvn spotless:apply in quiet mode and log time
set start=%time%
mvn -q spotless:apply
call log_time.cmd "%start%"
