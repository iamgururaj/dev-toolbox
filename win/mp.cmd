@echo off
set start=%time%
mvn -q package -DskipTests
call log_time.cmd "%start%"
