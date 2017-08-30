@ECHO OFF
SETLOCAL EnableDelayedExpansion

CALL ffmpeg-env.bat
SET "ENCODER=h264_nvenc"
SET "OPTS=-profile:v high -level auto -bf 0"
SET "QVALS=hp default bd hq llhp ll llhq"
SET "RCVALS=cbr cbr_hq cbr_ld_hq"

MKDIR out
MKDIR out\%ENCODER%

FOR /L %%i IN (1,1,%BITRATE#%) DO (
	FOR %%p IN (%QVALS%) DO (
		FOR %%r IN (%RCVALS%) DO (
			"%FFMPEG%" %OPT_INPUT% -i "%INPUT%" %OPT_COMMON% -vcodec %ENCODER% %OPTS% -preset %%p -rc %%r -b:v !BITRATE[%%i]! -bufsize !BITRATE[%%i]! "out\%ENCODER%\!BITRATE[%%i]!-%%p-%%r.mp4"
		)
	)
)

# NVENC Two-Pass is cbr_hq and cbr_ld_hq