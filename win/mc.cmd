@echo off
set start=%time%
mvn -q compile -DskipTests
call log_time.cmd "%start%"
