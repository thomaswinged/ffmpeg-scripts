@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

mkdir jpg

for %%a in (%s%) do call ffmpeg -i %%a -q:v 31 jpg\\"%%~na".jpg

pause
