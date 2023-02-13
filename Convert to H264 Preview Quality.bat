@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -hwaccel auto -i %%a -c:v h264 -b:v 3000k -minrate 2000k -maxrate 4000k -c:a mp3 -b:a 128k -filter:v fps=fps=25 -y "%%~na"_preview.mp4

pause
