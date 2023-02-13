@echo off
setlocal ENABLEDELAYEDEXPANSION

set /p TARGET_SIZE=Enter target size in MB:
set s=%*

for %%f in (%s%) do (
	set "GetDurationCmd=ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 %%f"

	for /F "delims=" %%I in ('!GetDurationCmd!') do set "duration=%%I"
	echo Duration: !duration!

	set /a bitrate=!TARGET_SIZE! * 9/10 * 8 * 1024 / !duration!
	echo Bitrate: !bitrate!

	ffmpeg -y -i "%%~f" -c:v libx264 -b:v !bitrate!k -pass 1 -c:a mp3 -b:a 128k -f mp4 "%%~f_tmp.mp4"
	ffmpeg -y -i "%%~f_tmp.mp4" -c:v libx264 -b:v !bitrate!k -pass 2 -c:a mp3 -b:a 128k "%%~nf_c.mp4"
	del "%%~f_tmp.mp4"
	del "ffmpeg2pass-0.log"
	del "ffmpeg2pass-0.log.mbtree"
)

pause