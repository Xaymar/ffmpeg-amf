echo off
if "%~1"=="" (
echo input file name is empty. Use basic_transcode_amf_hevc.bat video.mp4
goto error
)

SET "CWD=%~dp0"
SET bitrate=5M
SET maxbitrate=6M
SET bufsize=2M
SET x265_preset=veryfast
SET amf_quality=speed


rem veryfast and zerolatency options make x265 comparable with VCE


"%CWD%\..\bin\ffmpeg.exe" -y -t 100 -threads 0 -i "%~1" -c:v hevc_amf  -b:v %bitrate% -maxrate %maxbitrate% -bufsize %bufsize% -rc vbr_peak -quality %amf_quality% out_amf_hevc.mp4
"%CWD%\..\bin\ffmpeg.exe" -y -t 100 -threads 0 -i "%~1" -c:v libx265   -b:v %bitrate% -maxrate %maxbitrate% -bufsize %bufsize% -preset %x265_preset% -x265-params vbv-maxrate=6000:vbv-bufsize=2000 -tune zerolatency out_x265_hevc.mp4

echo PSNR > result.txt	

"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_amf_hevc.mp4  -lavfi psnr="stats_file='amf_hevc.psnr.log'"  -f null - > "trace.txt" 2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo amf_hevc : %%A >end.txt
type end.txt >> result.txt


"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_x265_hevc.mp4 -lavfi psnr="stats_file='x265_hevc.psnr.log'" -f null - > "trace.txt" 2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo x265_hevc: %%A >end.txt
type end.txt >> result.txt


echo SSIM >> result.txt	

"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_amf_hevc.mp4  -lavfi ssim="stats_file='amf_hevc_ssim.log'" -f null - > "trace.txt"  2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo amf_hevc : %%A >end.txt
type end.txt >> result.txt

"%CWD%\..\bin\ffmpeg.exe" -y -hide_banner -loglevel info -t 100 -threads 0 -i "%~1" -i out_x265_hevc.mp4  -lavfi ssim="stats_file=x265_hevc_ssim.log'" -f null - > "trace.txt"  2>&1
for /f "tokens=*" %%A in ('type "trace.txt"') do @echo x265_hevc: %%A >end.txt
type end.txt >> result.txt

del trace.txt
del end.txt

echo 
type result.txt


:error










