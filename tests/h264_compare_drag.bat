@ECHO OFF
CALL "%~dp0\ffmpeg-env.bat"

SET "LOG=%CWD%\h264_compare.log"
SET "LOG2=%CWD%\h264_compare.log.tmp"
DEL "%LOG%"
DEL "%LOG2%"

:RESTART

ECHO ----------------------------- >> "%LOG%"
ECHO %1 >> "%LOG%"
ECHO %1
"%FFMPEG%" -i "%~1" %OPT_INPUT% -i "%INPUT%" -lavfi ssim="stats_file='%~n1_psnr.log'" -f null -hide_banner -v info -nostats - > "%LOG2%" 2>&1
FINDSTR /C:"Parsed_ssim" "%LOG2%" >> "%LOG%"
DEL "%LOG2%"

SHIFT /1
IF "%~1"=="" (
	GOTO :EOF
) ELSE (
	GOTO :RESTART
)