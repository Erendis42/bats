@echo off
echo Closing Google Chrome...
taskkill /f /im chrome.exe >nul 2>&1

echo Clearing Chrome GPU Cache...
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache" (
    rmdir /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\GPUCache"
    echo GPU Cache cleared successfully!
) else (
    echo GPUCache folder not found.
)

echo Relaunching Chrome...
start "" "%ProgramFiles%\Google\Chrome\Application\chrome.exe"
pause
