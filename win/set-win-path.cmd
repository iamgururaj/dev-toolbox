@echo off
setlocal enabledelayedexpansion

title Setting Dev-Toolbox PATH...

echo ========================================================
echo   Dev-Toolbox: Windows PATH Configuration Setup
echo ========================================================
echo.

:: 1. Auto-detect the 'win' directory
set "TARGET_DIR=%~dp0win"

:: If this script is run from inside the 'win' directory itself:
if not exist "%TARGET_DIR%" (
    if exist "%~dp0gaa.cmd" (
        set "TARGET_DIR=%~dp0"
    )
)

:: If a specific directory argument was provided, use that instead:
if not "%~1"=="" (
    if not "%~1"=="--pause" (
        if not "%~1"=="/p" (
            set "TARGET_DIR=%~1"
        )
    )
)

:: Resolve to full absolute path
for %%I in ("%TARGET_DIR%") do set "TARGET_DIR=%%~fI"

:: Strip trailing backslash if present
if "%TARGET_DIR:~-1%"=="\" set "TARGET_DIR=%TARGET_DIR:~0,-1%"

:: Verify directory exists
if not exist "%TARGET_DIR%" (
    echo [ERROR] Target directory not found: "%TARGET_DIR%"
    echo Please make sure the 'win' directory exists or pass its path as an argument.
    exit /b 1
)

echo Target Directory: "%TARGET_DIR%"
echo.

:: 2. Use PowerShell to update User PATH permanently (avoids 1024-character truncation limit and broadcasts WM_SETTINGCHANGE)
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
    "$ErrorActionPreference = 'Stop'; " ^
    "$target = [System.IO.Path]::GetFullPath($env:TARGET_DIR).TrimEnd('\', '/'); " ^
    "$userPath = [System.Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User); " ^
    "$entries = @(); " ^
    "if ($userPath) { $entries = @($userPath.Split(';', [System.StringSplitOptions]::RemoveEmptyEntries)) }; " ^
    "$filtered = @($entries | Where-Object { $_.Trim().TrimEnd('\', '/').ToLowerInvariant() -ne $target.ToLowerInvariant() }); " ^
    "$alreadyAtFront = ($entries.Count -gt 0 -and $entries[0].Trim().TrimEnd('\', '/').ToLowerInvariant() -eq $target.ToLowerInvariant()); " ^
    "if ($alreadyAtFront) { " ^
    "    Write-Host '[INFO] Directory is already present and active at the top of User PATH.' -ForegroundColor Yellow; " ^
    "} else { " ^
    "    $newPath = if ($filtered.Count -gt 0) { ($target + ';' + ($filtered -join ';')) } else { $target }; " ^
    "    [System.Environment]::SetEnvironmentVariable('Path', $newPath, [System.EnvironmentVariableTarget]::User); " ^
    "    Write-Host '[SUCCESS] Directory successfully set in Windows User PATH permanently!' -ForegroundColor Green; " ^
    "}"

:: 3. Fallback to Registry if PowerShell failed
if %ERRORLEVEL% NEQ 0 (
    echo [WARN] PowerShell update encountered an issue. Falling back to Registry method...
    for /F "usebackq tokens=*" %%A in (`reg query HKCU\Environment /v PATH 2^>nul ^| find /I "PATH"`) do set "LINE=%%A"
    set "CURRENT_REG_PATH="
    for /F "tokens=1,2,*" %%A in ("!LINE!") do set "CURRENT_REG_PATH=%%C"

    echo !CURRENT_REG_PATH! | find /I "%TARGET_DIR%" >nul
    if !ERRORLEVEL! EQU 0 (
        echo [INFO] Directory is already present in User PATH registry.
    ) else (
        if defined CURRENT_REG_PATH (
            set "NEW_REG_PATH=%TARGET_DIR%;!CURRENT_REG_PATH!"
        ) else (
            set "NEW_REG_PATH=%TARGET_DIR%"
        )
        reg add HKCU\Environment /f /v PATH /t REG_EXPAND_SZ /d "!NEW_REG_PATH!" >nul
        if !ERRORLEVEL! EQU 0 (
            echo [SUCCESS] Added to User PATH permanently via Registry.
        ) else (
            echo [ERROR] Failed to update PATH in Registry.
            exit /b 1
        )
    )
)

echo.
echo [INFO] Available commands in "%TARGET_DIR%":
echo   Git shortcuts:  gaa, gac, gacp, gb, gbd, gcl, gcm, gco, gcob, gcom, gp, gs, gsu, etc.
echo   npm shortcuts:  ni, nid, nd, nci, nl, np, ns, nt, etc.
echo.
echo [INFO] Newly opened terminals (CMD, PowerShell, Windows Terminal, VS Code) will automatically have access.

:: 4. Update PATH in the current session so commands can be used immediately
endlocal & (
    echo %PATH% | find /I "%TARGET_DIR%" >nul 2>&1
    if errorlevel 1 (
        set "PATH=%TARGET_DIR%;%PATH%"
        echo [INFO] Current session PATH updated. Commands are immediately available!
    )
)

echo.
echo ========================================================
echo   Setup completed successfully!
echo ========================================================

:: If requested via --pause or /p argument, pause before exiting
if /i "%~1"=="--pause" pause
if /i "%~1"=="/p" pause
