@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -hwaccel auto -i %%a -vf "scale=iw/2:ih/2" -c:v h264 -b:v 30000k -minrate 20000k -maxrate 40000k -c:a mp3 -b:a 192k -y "%%~na"_HALF"%%~xa"

pause
