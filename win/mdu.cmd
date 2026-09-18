@echo off
mvn versions:display-dependency-updates | findstr /I "RELEASE Final GA ." | findstr /I /V "alpha beta rc prerelease"
