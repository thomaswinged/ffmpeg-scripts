@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -i %%a -vf "scale=iw/2:ih/2" -q:v 1 "%%~na"_HALF"%%~xa"

pause
