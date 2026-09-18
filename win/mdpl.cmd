@echo off
mvn versions:display-plugin-updates | findstr /I "RELEASE Final GA ." | findstr /I /V "alpha beta rc prerelease"
