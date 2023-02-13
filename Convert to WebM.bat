@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -hwaccel auto -i %%a -c:v libvpx-vp9 -crf 4 -b:v 0 -threads 16 -y "%%~na"_c.webm

pause
