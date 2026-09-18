@echo off
set start=%time%
mvn -q test
call log_time.cmd "%start%"
