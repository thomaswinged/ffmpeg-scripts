@echo off
setlocal ENABLEDELAYEDEXPANSION

set s=%*
call :GetUnixTime UNIX_TIME

call ffmpeg -i %%1 -i %%2 -filter_complex "[1][0]hstack=inputs=2" -qscale 60 %UNIX_TIME%.webp

pause


:GetUnixTime
setlocal enableextensions
for /f %%x in ('wmic path win32_utctime get /format:list ^| findstr "="') do (
    set %%x)
set /a z=(14-100%Month%%%100)/12, y=10000%Year%%%10000-z
set /a ut=y*365+y/4-y/100+y/400+(153*(100%Month%%%100+12*z-3)+2)/5+Day-719469
set /a ut=ut*86400+100%Hour%%%100*3600+100%Minute%%%100*60+100%Second%%%100
endlocal & set "%1=%ut%" & goto :EOF