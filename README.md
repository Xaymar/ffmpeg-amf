# Building
## Prerequisites
- MSYS2 (32 or 64 bit)
- MSYS2 MingW
- MSYS2 YASM
- NASM from http://www.nasm.us/pub/nasm/releasebuilds/2.13.01/ for x264 support.

## Installation
1. MSYS 2
  - Install MSYS2 to any location, preferably without any spaces, slashes or other special symbols.
  - Open an MSYS2 shell and run 'pacman -Syu' (without ') and wait for it to finish. Close it when it asks for it.
  - Open an MSYS2 shell and run 'pacman -Su' (without '), wait for it to complete.
2. MingW and YASM
  - Open an MSYS2 shell.
  - Run 'pacman -S make diffutils yasm nasm mingw-w64-x86_64-gcc mingw-w64-i686-gcc mingw-w64-x86_64-gtk3 mingw-w64-i686-gtk3' (without ').
  - Done

### Warnings about using MSYS2 with MinGW
- Binaries in MSYS2 are older than the recommended stable, this leads to unstable or incorrect code generation.
- NASM can be manually updated from: http://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D
- YASM can be manually updated from: http://yasm.tortall.net/

## Compiling

### Build Environment
- Visual Studio:
  1. Launch a "Visual Studio Native Tools Command Prompt".
  2. Navigate to the MSYS2 installation directory.
  3. Launch an msys2 shell with 'msys2_shell.cmd -full-path'
  4. Verify that everything is correct using 'which link' and 'which cl' (they should be pointing to VS versions)
- MinGW
  1. Launch a MSYS2 shell that matches the architecture you want to build for.

### Compiling
- Using the previous shell, navigate to the ffmpeg build directory and run:
  (MingW 32): './ffmpeg-build-win release 32'
  (MingW 64): './ffmpeg-build-win release 64'
  (VS 32): './ffmpeg-build-win release 32 msvc'
  (VS 64): './ffmpeg-build-win release 64 msvc'
- Wait until it's done.
- Pick up your correctly built ffmpeg from /build and /redist.

# Old VS Build Steps

- libx264 Build steps -
1. Grab the current stable source.
2. Using the above shell, navigate to the stable source.
3. CC=cl configure --prefix={FFMPEG Shared Path} --enable-shared --extra-cflags="-DNO_PREFIX"
4. make
5. make install-lib-shared
6. Navigate to {FFMPEG Shared Path}/lib and rename libx264.dll.lib to libx264.lib.

- ffmpeg Build steps - 
1. Follow this: https://trac.ffmpeg.org/wiki/CompilationGuide/MSVC
2. Add the following extra commands to the configure command:
	--extra-cflags='-I{FFMPEG Shared Path}\\include' (Path must be in linux format)
	--extra-ldflags='-LIBPATH:"{FFMPEG Shared Path}\\lib"' (Path must be in windows format)
	--enable-gpl
	--enable-libx264
3. make
4. make install
5. Copy the libx264-*.dll from {FFMPEG Shared Path}/bin to the ffmpeg output directory.
./configure --prefix=/d/Projects/Cpp/ffmpeg-shared --enable-asm --disable-doc --enable-gpl --enable-nonfree --enable-w32threads --extra-ldflags=-static-libgcc --enable-muxer=av1 --enable-parser=av1
./configure --prefix=/d/Projects/Cpp/ffmpeg-shared --enable-shared --toolchain=msvc --enable-asm --enable-yasm --disable-doc --extra-cflags=-I/d/Projects/Cpp/ffmpeg-shared/include --extra-ldflags='-LIBPATH:"D:\\Projects\\Cpp\\ffmpeg-shared\\lib"' --enable-gpl --enable-libx264 --enable-encoder=h264_vce --enable-lto
./configure --prefix=/d/Projects/Cpp/ffmpeg-shared --enable-asm --enable-yasm --toolchain=msvc --enable-shared --enable-gpl --enable-nonfree --enable-lto