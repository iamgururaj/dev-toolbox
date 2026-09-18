@echo off
mvn versions:display-property-updates | findstr /I "RELEASE Final GA ." | findstr /I /V "alpha beta rc prerelease"
