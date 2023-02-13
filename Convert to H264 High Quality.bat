@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -hwaccel auto -i %%a -c:v h264 -b:v 22500k -minrate 15000k -maxrate 30000k -c:a mp3 -b:a 192k -y "%%~na"_c.mp4

pause
