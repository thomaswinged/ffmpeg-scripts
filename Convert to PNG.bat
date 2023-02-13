@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*

for %%a in (%s%) do call ffmpeg -i %%a -q:v 1 "%%~na"_c.png

pause
