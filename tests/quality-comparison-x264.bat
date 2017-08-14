SET "CWD=%~dp0"
SET "IN=R:\ImageSequence\Unreal Engine Elemental Demo 1080p60_%%4d.png"
SET "OUT=R:\UnrealEngineElementalDemo"

SET "BITRATE=2500"
SET "BASICS=-n -c:v libx264 -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -x264opts bitrate=%BITRATE%:vbv-maxrate=%BITRATE%:vbv-bufsize=%BITRATE%:keyint=120:min-keyint=120"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset ultrafast "%OUT%.x264.%BITRATE%kbit-ultrafast.h264.mp4" > x264-ultrafast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset superfast "%OUT%.x264.%BITRATE%kbit-superfast.h264.mp4" > x264-superfast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset veryfast "%OUT%.x264.%BITRATE%kbit-veryfast.h264.mp4"   > x264-veryfast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset faster "%OUT%.x264.%BITRATE%kbit-faster.h264.mp4"       > x264-faster-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset fast "%OUT%.x264.%BITRATE%kbit-fast.h264.mp4"           > x264-fast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset medium "%OUT%.x264.%BITRATE%kbit-medium.h264.mp4"      > x264-medium-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset slow "%OUT%.x264.%BITRATE%kbit-slow.h264.mp4"          > x264-slow-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset slower "%OUT%.x264.%BITRATE%kbit-slower.h264.mp4"      > x264-slower-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset veryslow "%OUT%.x264.%BITRATE%kbit-veryslow.h264.mp4"  > x264-veryslow-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset placebo "%OUT%.x264.%BITRATE%kbit-placebo.h264.mp4"    > x264-placebo-%BITRATE%.txt 2>&1

SET "BITRATE=3500"
SET "BASICS=-n -c:v libx264 -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -x264opts bitrate=%BITRATE%:vbv-maxrate=%BITRATE%:vbv-bufsize=%BITRATE%:keyint=120:min-keyint=120"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset ultrafast "%OUT%.x264.%BITRATE%kbit-ultrafast.h264.mp4" > x264-ultrafast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset superfast "%OUT%.x264.%BITRATE%kbit-superfast.h264.mp4" > x264-superfast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset veryfast "%OUT%.x264.%BITRATE%kbit-veryfast.h264.mp4"   > x264-veryfast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset faster "%OUT%.x264.%BITRATE%kbit-faster.h264.mp4"       > x264-faster-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset fast "%OUT%.x264.%BITRATE%kbit-fast.h264.mp4"           > x264-fast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset medium "%OUT%.x264.%BITRATE%kbit-medium.h264.mp4"       > x264-medium-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset slow "%OUT%.x264.%BITRATE%kbit-slow.h264.mp4"           > x264-slow-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset slower "%OUT%.x264.%BITRATE%kbit-slower.h264.mp4"      > x264-slower-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset veryslow "%OUT%.x264.%BITRATE%kbit-veryslow.h264.mp4"  > x264-veryslow-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset placebo "%OUT%.x264.%BITRATE%kbit-placebo.h264.mp4"    > x264-placebo-%BITRATE%.txt 2>&1

SET "BITRATE=6000"
SET "BASICS=-n -c:v libx264 -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -x264opts bitrate=%BITRATE%:vbv-maxrate=%BITRATE%:vbv-bufsize=%BITRATE%:keyint=120:min-keyint=120"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset ultrafast "%OUT%.x264.%BITRATE%kbit-ultrafast.h264.mp4" > x264-ultrafast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset superfast "%OUT%.x264.%BITRATE%kbit-superfast.h264.mp4" > x264-superfast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset veryfast "%OUT%.x264.%BITRATE%kbit-veryfast.h264.mp4"   > x264-veryfast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset faster "%OUT%.x264.%BITRATE%kbit-faster.h264.mp4"       > x264-faster-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset fast "%OUT%.x264.%BITRATE%kbit-fast.h264.mp4"           > x264-fast-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset medium "%OUT%.x264.%BITRATE%kbit-medium.h264.mp4"       > x264-medium-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset slow "%OUT%.x264.%BITRATE%kbit-slow.h264.mp4"           > x264-slow-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset slower "%OUT%.x264.%BITRATE%kbit-slower.h264.mp4"      > x264-slower-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset veryslow "%OUT%.x264.%BITRATE%kbit-veryslow.h264.mp4"  > x264-veryslow-%BITRATE%.txt 2>&1
::"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASICS% -preset placebo "%OUT%.x264.%BITRATE%kbit-placebo.h264.mp4"    > x264-placebo-%BITRATE%.txt 2>&1