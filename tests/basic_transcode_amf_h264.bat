echo off
if "%~1"=="" (
echo input file name is empty. Use basic_transcode_amf_h264.bat video.mp4
goto error
)

SET "CWD=%~dp0"
SET bitrate=5M
SET maxbitrate=6M
SET bufsize=2M
SET x264_preset=veryfast

rem veryfast and zerolatency options make x264 comparable with VCE


"%CWD%\..\bin\ffmpeg.exe" -y -t 100 -threads 0 -i "%~1" -c:v h264_amf  -b:v %bitrate% -maxrate %maxbitrate% -bufsize %bufsize% -rc vbr_peak                   out_amf_h264.mp4
"%CWD%\..\bin\ffmpeg.exe" -y -t 100 -threads 0 -i "%~1" -c:v libx264   -b:v %bitrate% -maxrate %maxbitrate% -bufsize %bufsize% -preset %x264_preset% -nal-hrd vbr -tune zerolatency out_x264_h264.mp4

echo PSNR > result.txt	

"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_amf_h264.mp4  -lavfi psnr="stats_file='amf_h264.psnr.log'"  -f null - > "trace.txt" 2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo amf_h264 : %%A >end.txt
type end.txt >> result.txt


"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_x264_h264.mp4 -lavfi psnr="stats_file='x264_h264.psnr.log'" -f null - > "trace.txt" 2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo x264_h264: %%A >end.txt
type end.txt >> result.txt


echo SSIM >> result.txt	

"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_amf_h264.mp4  -lavfi ssim="stats_file='amf_h264_ssim.log'" -f null - > "trace.txt"  2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo amf_h264 : %%A >end.txt
type end.txt >> result.txt

"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_x264_h264.mp4  -lavfi ssim="stats_file=x264_h264_ssim.log'" -f null - > "trace.txt"  2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo x264_h264: %%A >end.txt
type end.txt >> result.txt

del trace.txt
del end.txt

echo 
type result.txt


:error










