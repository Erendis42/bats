@ECHO OFF
rem *** prerequisites: ffmpeg, yt-dlp
 
:loop
yt-dlp %1 -S res:1080,ext:mp4:m4a --recode mp4
shift
if not "%~1"=="" goto loop
