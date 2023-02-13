@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -hwaccel auto -i %%a -ab 320k -map_metadata 0 -id3v2_version 3 -y "%%~na".mp3

pause
