@ECHO OFF
REM prerequisites: ffmpeg, yt-dlp

:loop
REM yt-dlp -x --audio-format mp3 --audio-quality 0 --yes-playlist %1
yt-dlp -x --audio-format mp3 --audio-quality 0 %1
shift
if not "%~1"=="" goto loop
