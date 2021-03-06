SET "CWD=%~dp0"
SET "FFMPEG_DIR=%~dp0..\redist\ffmpeg-msvc-x64\release\bin\"
SET "FFMPEG=%FFMPEG_DIR%ffmpeg.exe"
SET "FFPROBE=%FFMPEG_DIR%ffprobe.exe"

SET "INPUT=%CWD%raw\Unreal Engine Elemental Demo 1080p60_%%04d.png"
SET "OPT_INPUT=-f image2 -framerate 60/1 -c:v png"
SET "OPT_COMMON=-framerate 60/1 -an -g 120 -pix_fmt yuv420p -flags loop -y"
 REM -v debug"

:: Bitrates to test
SET BITRATE#=0
REM 720p30
SET /A BITRATE#=BITRATE#+1
SET "BITRATE[%BITRATE#%]=2500k"
REM 720p30, 720p60 (low motion)
SET /A BITRATE#=BITRATE#+1
SET "BITRATE[%BITRATE#%]=3500k"
REM 720p60, 1080p30
SET /A BITRATE#=BITRATE#+1
SET "BITRATE[%BITRATE#%]=6000k" 
::SET /A BITRATE#=BITRATE#+1
::SET BITRATE[%BITRATE#%]=9000 REM 720p60, 1080p30
::SET /A BITRATE#=BITRATE#+1
::SET BITRATE[%BITRATE#%]=12000 REM 1080p60, 1440p48
::SET /A BITRATE#=BITRATE#+1
::SET BITRATE[%BITRATE#%]=16000 REM 1080p60, 1440p60, 2160p30
::SET /A BITRATE#=BITRATE#+1
::SET BITRATE[%BITRATE#%]=20000 REM 2160p60
