@ECHO OFF
CALL ffmpeg-env.bat

SET "LOG=%CWD%\h264_compare.log"
SET "LOG2=%CWD%\h264_compare.log.tmp"
DEL "%LOG%"
DEL "%LOG2%"

PUSHD out
ECHO begin > "%LOG%"
(
	FOR /D %%d IN (*) DO (
		PUSHD %%d
		FOR /R %%a IN (*.mp4) DO (
			ECHO ----------------------------- >> "%LOG%"
			ECHO %%d^> %%a >> "%LOG%"
			ECHO %%d^> %%a
			"%FFMPEG%" -i "%%a" %OPT_INPUT% -i "%INPUT%" -lavfi ssim="stats_file='%%~na_psnr.log'" -f null - >> "%LOG2%" 2>&1
			FINDSTR /C:"Parsed_ssim" "%LOG2%" >> "%LOG%"
			DEL "%LOG2%"
		)
		POPD
	)
)
POPD
PAUSE