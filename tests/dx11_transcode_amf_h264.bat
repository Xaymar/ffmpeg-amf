rem echo off
if "%~1"=="" (
echo input file name is empty. Use dx11_transcode_amf_h264.bat video.mp4
goto error
)

SET "CWD=%~dp0"
SET bitrate=5M
SET maxbitrate=6M
SET bufsize=2M


"%CWD%\..\bin\ffmpeg.exe" -y -t 100 -hwaccel d3d11va -hwaccel_output_format d3d11 -threads 1 -i "%~1" -c:v h264_amf          -b:v %bitrate% -maxrate %maxbitrate% -bufsize %bufsize% -rc vbr_peak shared_dx11_amf_h264.mp4
"%CWD%\..\bin\ffmpeg.exe" -y -t 100 -hwaccel d3d11va                              -threads 1 -i "%~1" -c:v h264_amf_d3d11va  -b:v %bitrate% -maxrate %maxbitrate% -bufsize %bufsize% -rc vbr_peak custom_dx11_amf_h264.mp4
