#!/bin/bash

#flags to comment out parts of the build

build_ffmpeg=true
build_redist=true
build_x264=true
add_x264=true



#--------------------------------------------------------
# command line parameters 
#--------------------------------------------------------

# build_type: debug. release
# bitness: 32, 64
# toolchain: mingw, msvc 
# incremental: full, inc, pack

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

fldr_root=$PWD
fldr_build=$PWD/build
fldr_redist=$PWD/redist

fldr_src_ffmpeg=$PWD/ffmpeg
fldr_src_x264=$PWD/x264


if [ "$bitness" = "32" ]
then
   bld_arch=x86
   lib_arch=X86
   flg_output=win32 
   fldr_mingw=/mingw32
   host_def=i686-w64-mingw32
else
   bld_arch=x86_64
   lib_arch=X64
   flg_output=x64
   fldr_mingw=/mingw64
   host_def=x86_64-w64-mingw32
fi



#--------------------------------------------------------
# TOOLCHAIN CONFIG
#--------------------------------------------------------

if [ "$toolchain" == "msvc" ]
then
 fftoolchain=--toolchain=msvc 
 extracflags=--extra-cflags="-Zi"
 fldr_toolchain=msvc
else
 fftoolchain=
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

if [ "$toolchain" == "msvc" ]
then
   extralinkflags=--extra-ldflags="-DEBUG"
else
   #extralinkflags=--extra-ldflags='"-static-libgcc -L$fld_build_full_path"'
   extralinkflags="--extra-ldflags=-static-libgcc --extra-ldflags=-L$fld_build_full_path"

fi

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
echo extralinkflags=$extralinkflags

#--------------------------------------------------------
#create def and lib file from dll
#--------------------------------------------------------
function make_def_and_lib_from_dll
{
dllname=$1
libname=$2

rm -f ${libname}.txt
rm -f ${libname}.def
rm -f ${libname}

dumpbin -exports ${dllname} > ${libname}.txt

echo EXPORTS >> ${libname}.def

sed -e '1,19d' ${libname}.txt |
while read line; do
eval array=($line) 
if [ "${array[3]}" != "" ]
then 
	echo ${array[3]}>> ${libname}.def
fi
done

lib.exe -MACHINE:${lib_arch} -DEF:"${libname}.def" -OUT:"${libname}" -NAME:"${dllname}"
}

mkdir -p $fld_build_full_path


#--------------------------------------------------------
# x264
#--------------------------------------------------------

if [ "$add_x264" = "true" ]
then
    if [ "$build_x264" = "true" ]
    then
       echo "+++ x264 start +++"
       cd $fldr_src_x264
       if [ "$incremental" = "full" ]
       then
           make clean
           ./configure --enable-shared --host=$host_def --extra-ldflags="-static-libgcc -static-libstdc++" --extra-ldflags=-Wl,--output-def=libx264.def
       fi
       if [ "$incremental" = "full" ] || [ "$incremental" = "inc" ]
       then
           make
           if [ "$toolchain" == "msvc" ]
           then
              make_def_and_lib_from_dll libx264-152.dll libx264.lib
              cp $fldr_src_x264/*.lib $fld_build_full_path
           else
              #cp $fldr_src_x264/*.a $fld_build_full_path
              cp $fldr_src_x264/libx264.dll.a $fld_build_full_path/x264.a
			  cp $fldr_src_x264/libx264.dll.a $fld_build_full_path/libx264.a
           fi
           mkdir -p $fld_build_full_path/x264
		   cp $fldr_src_x264/*.h $fld_build_full_path/x264
           cp $fldr_src_x264/*.dll $fld_build_full_path
       fi
       echo "+++ x264 done +++"
   fi
   x264_params="--enable-gpl --enable-libx264 --extra-cflags=-I$fld_build_full_path/x264"
else
   x264_params=""
fi



#--------------------------------------------------------
# build FFMPEG
#--------------------------------------------------------

if [ "$build_ffmpeg" = "true" ]
then

#export PKG_CONFIG_PATH=/local/lib/pkgconfig


cd $fld_build_full_path

#MSYS2 Win build

if [ "$incremental" = "full" ]
then
    make clean
   $fldr_src_ffmpeg/configure $fftoolchain --arch=$bld_arch --enable-shared --enable-w32threads --enable-avresample $x264_params $debug_flags $extracflags $extralinkflags
fi

if [ "$incremental" = "full" ] || [ "$incremental" = "inc" ]
then
  #make -j6
  make
fi


fi #build_ffmpeg=true

#--------------------------------------------------------
# Package FFMPEG
#--------------------------------------------------------

if [ "$build_redist" = "true" ]
then

fldr_include=$fld_redist_full_path/include
fldr_lib=$fld_redist_full_path/lib
fldr_bin=$fld_redist_full_path/bin
fldr_tests=$fld_redist_full_path/tests

echo include: $fldr_include

mkdir -p $fldr_include
mkdir -p $fldr_lib
mkdir -p $fldr_bin
mkdir -p $fldr_tests

cp $fldr_root/tests/*.* $fldr_tests

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

