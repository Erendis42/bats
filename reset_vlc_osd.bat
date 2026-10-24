@echo off
:: VLC OSD and Cache Reset Script
:: This script clears the VLC configuration cache and resets the interface settings 
:: to fix missing subtitles, volume percentages, and fullscreen text overlays.

echo ===================================================
echo   Resetting VLC OSD and Interface Cache...
echo ===================================================
echo.

:: Close VLC if it is running
echo Closing VLC Media Player...
taskkill /f /im vlc.exe >nul 2>&1
timeout /t 2 /nobreak >nul

:: Navigate to VLC AppData directory
set "VLC_DIR=%APPDATA%\vlc"

if exist "%VLC_DIR%" (
    echo.
    echo Found VLC data folder at: %VLC_DIR%
    
    :: Remove the interface configuration file
    if exist "%VLC_DIR%\vlc-qt-interface.ini" (
        echo Removing vlc-qt-interface.ini...
        del /f /q "%VLC_DIR%\vlc-qt-interface.ini"
    )
    
    :: Remove cache directories if they exist
    if exist "%VLC_DIR%\cache" (
        echo Clearing VLC cache directory...
        rmdir /s /q "%VLC_DIR%\cache"
    )
    
    if exist "%VLC_DIR%\art" (
        echo Clearing artwork cache...
        rmdir /s /q "%VLC_DIR%\art"
    )

    echo.
    echo ===================================================
    echo  Success! VLC interface files and cache cleared.
    echo  When you open VLC next time, it will automatically
    echo  rebuild its font/text cache and restore the OSD.
    echo ===================================================
) else (
    echo.
    echo [ERROR] VLC AppData folder not found. 
    echo Please make sure VLC is installed for the current user.
)

echo.
pause
