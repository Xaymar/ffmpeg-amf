SET "CWD=%~dp0"
SET "IN=R:\ImageSequence\Unreal Engine Elemental Demo 1080p60_%%4d.png"
SET "OUT=R:\UnrealEngineElementalDemo"

SET BITRATE=2500
SET "BASIC=-n -c:v h264_nvenc -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -rc cbr -profile:v high -level auto"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset default "%OUT%.nvenc.%BITRATE%kbit-default.h264.mp4" > nvenc-default-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hp "%OUT%.nvenc.%BITRATE%kbit-hp.h264.mp4" > nvenc-hp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hq "%OUT%.nvenc.%BITRATE%kbit-hq.h264.mp4" > nvenc-hq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset bd "%OUT%.nvenc.%BITRATE%kbit-bd.h264.mp4" > nvenc-bd-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhp "%OUT%.nvenc.%BITRATE%kbit-llhp.h264.mp4" > nvenc-llhp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhq "%OUT%.nvenc.%BITRATE%kbit-llhq.h264.mp4" > nvenc-llhq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset ll "%OUT%.nvenc.%BITRATE%kbit-ll.h264.mp4" > nvenc-ll-%BITRATE%.txt 2>&1

SET BITRATE=3500
SET "BASIC=-n -c:v h264_nvenc -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -rc cbr -profile:v high -level auto"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset default "%OUT%.nvenc.%BITRATE%kbit-default.h264.mp4" > nvenc-default-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hp "%OUT%.nvenc.%BITRATE%kbit-hp.h264.mp4" > nvenc-hp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hq "%OUT%.nvenc.%BITRATE%kbit-hq.h264.mp4" > nvenc-hq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset bd "%OUT%.nvenc.%BITRATE%kbit-bd.h264.mp4" > nvenc-bd-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhp "%OUT%.nvenc.%BITRATE%kbit-llhp.h264.mp4" > nvenc-llhp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhq "%OUT%.nvenc.%BITRATE%kbit-llhq.h264.mp4" > nvenc-llhq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset ll "%OUT%.nvenc.%BITRATE%kbit-ll.h264.mp4" > nvenc-ll-%BITRATE%.txt 2>&1

SET BITRATE=6000
SET "BASIC=-n -c:v h264_nvenc -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -rc cbr -profile:v high -level auto"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset default "%OUT%.nvenc.%BITRATE%kbit-default.h264.mp4" > nvenc-default-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hp "%OUT%.nvenc.%BITRATE%kbit-hp.h264.mp4" > nvenc-hp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hq "%OUT%.nvenc.%BITRATE%kbit-hq.h264.mp4" > nvenc-hq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset bd "%OUT%.nvenc.%BITRATE%kbit-bd.h264.mp4" > nvenc-bd-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhp "%OUT%.nvenc.%BITRATE%kbit-llhp.h264.mp4" > nvenc-llhp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhq "%OUT%.nvenc.%BITRATE%kbit-llhq.h264.mp4" > nvenc-llhq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset ll "%OUT%.nvenc.%BITRATE%kbit-ll.h264.mp4" > nvenc-ll-%BITRATE%.txt 2>&1

SET BITRATE=2500
SET "BASIC=-n -c:v h264_nvenc -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -rc vbr_2pass -profile:v high -level auto"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset default "%OUT%.nvenc.%BITRATE%kbit-vbr-default.h264.mp4" > nvenc-default-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset default "%OUT%.nvenc.%BITRATE%kbit-vbr-default-2pass.h264.mp4" > nvenc-default-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hp "%OUT%.nvenc.%BITRATE%kbit-vbr-hp.h264.mp4" > nvenc-hp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset hp "%OUT%.nvenc.%BITRATE%kbit-vbr-hp-2pass.h264.mp4" > nvenc-hp-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hq "%OUT%.nvenc.%BITRATE%kbit-vbr-hq.h264.mp4" > nvenc-hq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset hq "%OUT%.nvenc.%BITRATE%kbit-vbr-hq-2pass.h264.mp4" > nvenc-hq-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset bd "%OUT%.nvenc.%BITRATE%kbit-vbr-bd.h264.mp4" > nvenc-bd-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset bd "%OUT%.nvenc.%BITRATE%kbit-vbr-bd-2pass.h264.mp4" > nvenc-bd-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhp "%OUT%.nvenc.%BITRATE%kbit-vbr-llhp.h264.mp4" > nvenc-llhp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset llhp "%OUT%.nvenc.%BITRATE%kbit-vbr-llhp-2pass.h264.mp4" > nvenc-llhp-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhq "%OUT%.nvenc.%BITRATE%kbit-vbr-llhq.h264.mp4" > nvenc-llhq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset llhq "%OUT%.nvenc.%BITRATE%kbit-vbr-llhq-2pass.h264.mp4" > nvenc-llhq-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset ll "%OUT%.nvenc.%BITRATE%kbit-vbr-ll.h264.mp4" > nvenc-ll-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset ll "%OUT%.nvenc.%BITRATE%kbit-vbr-ll-2pass.h264.mp4" > nvenc-ll-%BITRATE%-2pass.txt 2>&1

SET BITRATE=3500
SET "BASIC=-n -c:v h264_nvenc -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -rc vbr_2pass -profile:v high -level auto"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset default "%OUT%.nvenc.%BITRATE%kbit-vbr-default.h264.mp4" > nvenc-default-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset default "%OUT%.nvenc.%BITRATE%kbit-vbr-default-2pass.h264.mp4" > nvenc-default-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hp "%OUT%.nvenc.%BITRATE%kbit-vbr-hp.h264.mp4" > nvenc-hp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset hp "%OUT%.nvenc.%BITRATE%kbit-vbr-hp-2pass.h264.mp4" > nvenc-hp-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hq "%OUT%.nvenc.%BITRATE%kbit-vbr-hq.h264.mp4" > nvenc-hq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset hq "%OUT%.nvenc.%BITRATE%kbit-vbr-hq-2pass.h264.mp4" > nvenc-hq-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset bd "%OUT%.nvenc.%BITRATE%kbit-vbr-bd.h264.mp4" > nvenc-bd-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset bd "%OUT%.nvenc.%BITRATE%kbit-vbr-bd-2pass.h264.mp4" > nvenc-bd-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhp "%OUT%.nvenc.%BITRATE%kbit-vbr-llhp.h264.mp4" > nvenc-llhp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset llhp "%OUT%.nvenc.%BITRATE%kbit-vbr-llhp-2pass.h264.mp4" > nvenc-llhp-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhq "%OUT%.nvenc.%BITRATE%kbit-vbr-llhq.h264.mp4" > nvenc-llhq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset llhq "%OUT%.nvenc.%BITRATE%kbit-vbr-llhq-2pass.h264.mp4" > nvenc-llhq-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset ll "%OUT%.nvenc.%BITRATE%kbit-vbr-ll.h264.mp4" > nvenc-ll-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset ll "%OUT%.nvenc.%BITRATE%kbit-vbr-ll-2pass.h264.mp4" > nvenc-ll-%BITRATE%-2pass.txt 2>&1

SET BITRATE=6000
SET "BASIC=-n -c:v h264_nvenc -an -b:v %BITRATE%k -g 120 -pix_fmt yuv420p -rc vbr_2pass -profile:v high -level auto"
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset default "%OUT%.nvenc.%BITRATE%kbit-vbr-default.h264.mp4" > nvenc-default-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset default "%OUT%.nvenc.%BITRATE%kbit-vbr-default-2pass.h264.mp4" > nvenc-default-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hp "%OUT%.nvenc.%BITRATE%kbit-vbr-hp.h264.mp4" > nvenc-hp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset hp "%OUT%.nvenc.%BITRATE%kbit-vbr-hp-2pass.h264.mp4" > nvenc-hp-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset hq "%OUT%.nvenc.%BITRATE%kbit-vbr-hq.h264.mp4" > nvenc-hq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset hq "%OUT%.nvenc.%BITRATE%kbit-vbr-hq-2pass.h264.mp4" > nvenc-hq-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset bd "%OUT%.nvenc.%BITRATE%kbit-vbr-bd.h264.mp4" > nvenc-bd-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset bd "%OUT%.nvenc.%BITRATE%kbit-vbr-bd-2pass.h264.mp4" > nvenc-bd-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhp "%OUT%.nvenc.%BITRATE%kbit-vbr-llhp.h264.mp4" > nvenc-llhp-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset llhp "%OUT%.nvenc.%BITRATE%kbit-vbr-llhp-2pass.h264.mp4" > nvenc-llhp-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset llhq "%OUT%.nvenc.%BITRATE%kbit-vbr-llhq.h264.mp4" > nvenc-llhq-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset llhq "%OUT%.nvenc.%BITRATE%kbit-vbr-llhq-2pass.h264.mp4" > nvenc-llhq-%BITRATE%-2pass.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass false -preset ll "%OUT%.nvenc.%BITRATE%kbit-vbr-ll.h264.mp4" > nvenc-ll-%BITRATE%.txt 2>&1
"%CWD%\bin\ffmpeg.exe" -framerate 60/1 -i "%IN%" %BASIC% -2pass true -preset ll "%OUT%.nvenc.%BITRATE%kbit-vbr-ll-2pass.h264.mp4" > nvenc-ll-%BITRATE%-2pass.txt 2>&1
