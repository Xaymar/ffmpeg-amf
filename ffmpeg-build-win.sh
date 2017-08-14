#!/bin/bash

#flags to comment out parts of the build

build_ffmpeg=true
build_redist=true

#--------------------------------------------------------
# command line parameters 
#--------------------------------------------------------

# build_type: debug. release
# bitness: 32, 64
# toolchain: mingw, msvc 
# incremental: full, inc

build_type=$1
bitness=$2
toolchain=$3
incremental=$4

if [ "$incremental" = "" ]
then
   incremental="full"
fi



#--------------------------------------------------------
# FOLDERS CONFIG
#--------------------------------------------------------

fldr_build=$PWD/build
fldr_redist=$PWD/redist

fldr_src_ffmpeg=$PWD/ffmpeg

if [ "$bitness" = "32" ]
then
   bld_arch=x86
   lib_arch=X86
   flg_output=win32 
else
   bld_arch=x86_64
   lib_arch=X64
   flg_output=x64
fi



#--------------------------------------------------------
# TOOLCHAIN CONFIG
#--------------------------------------------------------

if [ "$toolchain" == "msvc" ]
then
 fftoolchain=--toolchain=msvc 
 extracflags=--extra-cflags="-Zi"
 extralinkflags=--extra-ldflags="-DEBUG"
 fldr_toolchain=msvc
else
 fftoolchain=
 extralinkflags=--extra-ldflags=-static-libgcc
 fldr_toolchain=mingw
 extracflags=
fi

if test "$build_type" == "release"
then
   echo ++release
   debug_flags=--disable-debug

else
   echo ++debug
#MM --disable-optimizations cause link failures. FFMPEG uses if(0) foo(); construct to exclude foo() function from the build. MSVC doesn't remove call to foo() in debug mode.
#if [ "$toolchain" == "msvc" ]
#then
#   debug_flags=--disable-debug
#
#fi
fi

#--------------------------------------------------------
# full paths
#--------------------------------------------------------

fld_build_full_path=$fldr_build/ffmpeg-$fldr_toolchain-$flg_output/$build_type
fld_redist_full_path=$fldr_redist/ffmpeg-$fldr_toolchain-$flg_output/$build_type

#--------------------------------------------------------
# trace
#--------------------------------------------------------


echo build_type=$build_type
echo bitness=$bitness
echo lib_arch=$lib_arch
echo fldr_build=$fldr_build
echo debug_flags=$debug_flags
echo fftoolchain=$fftoolchain
echo fld_build_full_path=$fld_build_full_path
echo fld_redist_full_path=$fld_redist_full_path


#--------------------------------------------------------
# build FFMPEG
#--------------------------------------------------------

if [ "$build_ffmpeg" = "true" ]
then

#export PKG_CONFIG_PATH=/local/lib/pkgconfig

mkdir -p $fld_build_full_path

cd $fld_build_full_path

if [ "$incremental" = "full" ]
then
    make clean
fi

#MSYS2 Win build

if [ "$incremental" = "full" ]
then
   $fldr_src_ffmpeg/configure $fftoolchain --arch=$bld_arch --enable-shared --enable-w32threads --enable-avresample $debug_flags $extracflags $extralinkflags
fi
#make -j6
make

fi #build_ffmpeg=true

#--------------------------------------------------------
# Package FFMPEG
#--------------------------------------------------------

if [ "$build_redist" = "true" ]
then

fldr_include=$fld_redist_full_path/include
fldr_lib=$fld_redist_full_path/lib
fldr_bin=$fld_redist_full_path/bin

echo include: $fldr_include

mkdir -p $fldr_include
mkdir -p $fldr_lib
mkdir -p $fldr_bin

cd $fldr_src_ffmpeg
find ./ -type f -name "*.h" -exec cp --parents {}  $fldr_include/"$name" \;
cd $fld_build_full_path
find ./ -name "*.dll" -type f -exec cp {}  $fldr_bin \;
find ./ -name "*.exe" -type f -exec cp {}  $fldr_bin \;
find ./ -name "*.pdb" -type f -exec cp {}  $fldr_bin \;
find ./ -name "*.lib" -type f -exec cp {}  $fldr_lib \;
cd $fld_build_full_path
find ./ -type f -name "*.h" -exec cp --parents {}  $fldr_include/"$name" \;

fi # build_redist=true

