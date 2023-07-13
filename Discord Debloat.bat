@echo off & SetLocal EnableDelayedExpansion & color a & title Discord Debloat & mode con: cols=90 lines=20
echo.
echo.				Discord Debloat Script
echo.
echo Killing Discord Process...

taskkill /f /im Discord.exe > nul 2> nul
taskkill /f /im Discord.exe > nul 2> nul

cd /d %LOCALAPPDATA%\Discord\app-1.0.*\ > nul 2> nul
copy "locales\en-US.pak" "%LOCALAPPDATA%\Discord\" > nul 2> nul
rmdir /s /q "locales" & mkdir "locales" > nul 2> nul
move "%LOCALAPPDATA%\Discord\en-US.pak" "locales" > nul 2> nul

rmdir /s /q "%LOCALAPPDATA%\Discord\Packages" > nul 2> nul
del /f /q "%LOCALAPPDATA%\Discord\*.log" > nul 2> nul
del /f /q "%LOCALAPPDATA%\Discord\app.ico" > nul 2> nul

cd /d %LOCALAPPDATA%\Discord\app-1.0.*\ > nul 2> nul
del /f /q chrome*.pak  > nul 2> nul
del /f /q %LOCALAPPDATA%\Discord\Update.exe > nul 2> nul
del /f /q "%HOMEPATH%\Desktop\Discord.lnk" > nul 2> nul
del /f /q "%HOMEPATH%\Desktop\Discord Start.exe" > nul 2> nul
mklink "Discord Start.exe" "%cd%\Discord.exe" > nul 2> nul
move "Discord Start.exe" %HOMEPATH%\Desktop  > nul 2> nul

choice /c YN /m "Remove Discord Overlay?"
IF %ERRORLEVEL% EQU 1 (
cd /d %LOCALAPPDATA%\Discord\app-1.0.*\modules > nul 2> nul
rmdir /s /q discord_overlay2-2 > nul 2> nul
)

cd /d %LOCALAPPDATA%\Discord\app-1.0.*\modules > nul 2> nul
for %%a in ("discord_cloudsync-1" "discord_dispatch-1" "discord_erlpack-1" "discord_game_utils-1" "discord_media-2" "discord_spellcheck-1" "discord_hook-2") do rmdir /s /q "%%~a" > nul 2> nul

echo Discord Debloated
pause & exit
