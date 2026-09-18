@echo off
set start=%time%
mvn -q install -DskipTests
call log_time.cmd "%start%"
