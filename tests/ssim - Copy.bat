@ECHO OFF
SET "CWD=%~dp0"

call "%CWD%\ssim_val.bat"

:RESTART
IF "%~n1"=="" GOTO :EOF

ECHO Video: %~1
ECHO Reference: %VIDREF%

"%CWD%\bin\ffmpeg.exe" -i "%~1" -i "%VIDREF%" -lavfi ssim;[0:v][1:v]psnr="stats_file='%~n1_psnr.log'" -f null - > "%~dpn1.txt" 2>&1
REM "%CWD%\bin\ffmpeg.exe" -i "%~1" -i "%VIDREF%" -lavfi ssim="stats_file='%~n1_ssin.log'" -f null - > "%~dpn1.txt" 2>&1

SHIFT /1
GOTO :RESTART
PAUSE