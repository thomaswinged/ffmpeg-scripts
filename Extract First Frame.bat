@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

mkdir screenshots

for %%a in (%s%) do call ffmpeg -i %%a -ss 00:00:01 -vframes 1 -qscale:v 2 screenshots\\"%%~na".jpg

pause
