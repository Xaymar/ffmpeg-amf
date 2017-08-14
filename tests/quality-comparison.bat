SET "CWD=%~dp0"
SET "VIDREF=R:\ImageSequence\Unreal Engine Elemental Demo 1080p60_%%4d.png"


:RESTART
IF "%~n1"=="" GOTO :EOF

CD /D %~dp1

"%CWD%\bin\ffmpeg.exe" -i "%~1" -framerate 60 -i "%VIDREF%" -lavfi ssim="stats_file='%~n1.psnr.log'" -f null - > "%~dpn1.txt" 2>&1

SHIFT /1
GOTO :RESTART
