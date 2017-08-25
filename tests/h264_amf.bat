@ECHO OFF
SETLOCAL EnableDelayedExpansion

CALL ffmpeg-env.bat
SET "ENCODER=h264_amf"
SET "OPTS=-bf 0 -filler_data false -level auto -profile:v high -usage transcoding"
SET "QVALS=speed balanced quality"

MKDIR out
MKDIR out\%ENCODER%

FOR /L %%i IN (1,1,%BITRATE#%) DO (
	FOR %%p IN (%QVALS%) DO (
		"%FFMPEG%" %OPT_INPUT% %OPT_COMMON% -vcodec %ENCODER% %OPTS% -quality %%p -vbaq false -preanalysis false -rc cbr -b:v !BITRATE[%%i]! -bufsize !BITRATE[%%i]! "out\%ENCODER%\!BITRATE[%%i]!-%%p.mp4"
		"%FFMPEG%" %OPT_INPUT% %OPT_COMMON% -vcodec %ENCODER% %OPTS% -quality %%p -vbaq false -preanalysis true -rc cbr -b:v !BITRATE[%%i]! -bufsize !BITRATE[%%i]! "out\%ENCODER%\!BITRATE[%%i]!-%%p-p.mp4"
		"%FFMPEG%" %OPT_INPUT% %OPT_COMMON% -vcodec %ENCODER% %OPTS% -quality %%p -vbaq true -preanalysis false -rc cbr -b:v !BITRATE[%%i]! -bufsize !BITRATE[%%i]! "out\%ENCODER%\!BITRATE[%%i]!-%%p-v.mp4"
		"%FFMPEG%" %OPT_INPUT% %OPT_COMMON% -vcodec %ENCODER% %OPTS% -quality %%p -vbaq true -preanalysis true -rc cbr -b:v !BITRATE[%%i]! -bufsize !BITRATE[%%i]! "out\%ENCODER%\!BITRATE[%%i]!-%%p-pv.mp4"
	)
)
PAUSE