@echo off
setlocal EnableDelayedExpansion
title FlClash Portable Cleanup Tool

cd /d "%~dp0"

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting Administrator privileges...
    powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

echo ========================================================
echo             FlClash Portable Cleanup Tool
echo ========================================================
echo.
echo This tool will perform the following cleanup actions:
echo  1. Terminate running FlClash processes
echo  2. Stop and delete FlClashHelperService system service
echo  3. Delete FlClash scheduled startup tasks
echo  4. Reset Windows system proxy settings
echo  5. Remove leftover Wintun network adapters
echo  6. Clean up application registry entries
echo.
set /p CONFIRM="Are you sure you want to clean up system traces? (Y/N): "
if /i not "!CONFIRM!"=="Y" (
    echo.
    echo Operation cancelled by user.
    pause
    exit /b
)

echo.
set /p CLEAN_DATA="Do you also want to delete the portable data folder? (Y/N): "
echo.

echo [1/6] Terminating running processes...
taskkill /f /im FlClash.exe >nul 2>&1
taskkill /f /im FlClashDev.exe >nul 2>&1
taskkill /f /im FlClashCore.exe >nul 2>&1
taskkill /f /im FlClashDevCore.exe >nul 2>&1
taskkill /f /im FlClashHelperService.exe >nul 2>&1
taskkill /f /im FlClashDevHelperService.exe >nul 2>&1

echo [2/6] Cleaning system services...
sc stop FlClashHelperService >nul 2>&1
sc delete FlClashHelperService >nul 2>&1
sc stop FlClashDevHelperService >nul 2>&1
sc delete FlClashDevHelperService >nul 2>&1

echo [3/6] Cleaning scheduled tasks...
schtasks /Delete /TN "FlClash" /F >nul 2>&1
schtasks /Delete /TN "FlClash Dev" /F >nul 2>&1

echo [4/6] Resetting system proxy settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f >nul 2>&1
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v AutoConfigURL /f >nul 2>&1

echo [5/6] Cleaning virtual network adapters...
powershell -NoProfile -Command "Get-NetAdapter -ErrorAction SilentlyContinue | Where-Object { $_.InterfaceDescription -like '*FlClash*' -or $_.Name -like '*FlClash*' } | ForEach-Object { Disable-NetAdapter $_ -Confirm:$false -ErrorAction SilentlyContinue; Remove-NetAdapter $_ -Confirm:$false -ErrorAction SilentlyContinue }" >nul 2>&1

echo [6/6] Cleaning registry entries...
reg delete "HKCU\Software\com.assassin321.flclash" /f >nul 2>&1
reg delete "HKCU\Software\com.assassin321\FlClash" /f >nul 2>&1
reg delete "HKCU\Software\FlClash" /f >nul 2>&1
reg delete "HKCU\Software\FlClashDev" /f >nul 2>&1

if /i "!CLEAN_DATA!"=="Y" (
    echo.
    echo Cleaning portable data folder...
    if exist "portable" (
        rd /s /q "portable" >nul 2>&1
    )
)

echo.
echo ========================================================
echo       Cleanup completed! System traces removed.
echo ========================================================
echo.
pause
