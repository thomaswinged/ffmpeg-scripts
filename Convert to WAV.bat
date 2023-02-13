@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -hwaccel auto -i %%a -ar 44.1k -ac 2 -y "%%~na".wav

pause
