#!/bin/bash

#flags to comment out parts of the build

build_ffmpeg=true
build_redist=true
build_x264=true
add_x264=true
add_x265=true

add_zlib_msvc=true


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
    extralinkflags=--extra-ldflags="-DEBUG"
else
    fftoolchain=
    fldr_toolchain=mingw
    extracflags=
    extralinkflags="--extra-ldflags=-static-libgcc"
fi

if test "$build_type" == "release"
then
   echo ++release
   debug_flags=--disable-debug

else
   echo ++debug
if [ "$toolchain" == "msvc" ]
then
#MM --disable-optimizations cause link failures. FFMPEG uses if(0) foo(); construct to exclude foo() function from the build. MSVC doesn't remove call to foo() in debug mode.
   debug_flags=
else
   debug_flags=--disable-optimizations
fi

fi #test "$build_type" == "release"

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
    fldr_x264_out=$fld_build_full_path/x264

	mkdir -p $fldr_x264_out

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
           fi
       fi
       echo "+++ x264 done +++"
   fi

   cp $fldr_root/x264/x264.pc  $fldr_mingw/share/pkgconfig

   cp $fldr_root/x264/x264.h           $fldr_x264_out
   cp $fldr_root/x264/x264_config.h    $fldr_x264_out
   cp $fldr_src_x264/*.dll             $fldr_x264_out

   if [ "$toolchain" == "msvc" ]
   then
       cp $fldr_src_x264/libx264.lib $fldr_x264_out
       cp $fldr_src_x264/libx264.lib $fldr_x264_out/x264.lib
       x264_params="--enable-gpl --enable-libx264 --extra-cflags=-I$fldr_x264_out --extra-ldflags=-LIBPATH:$fldr_x264_out"
    else
       cp $fldr_src_x264/libx264.dll.a $fldr_x264_out/x264.a
       cp $fldr_src_x264/libx264.dll.a $fldr_x264_out/libx264.a

       x264_params="--enable-gpl --enable-libx264 --extra-cflags=-I$fldr_x264_out --extra-ldflags=-L$fldr_x264_out"
    fi
else
   x264_params=""
fi


#--------------------------------------------------------
# x265
#--------------------------------------------------------

if [ "$add_x265" = "true" ]
then
    cd $fldr_root

    if [ "$bitness" = "32" ]
    then
       fldr_x265_build=$fldr_root/x265/build/vc12-x86
    else
       fldr_x265_build=$fldr_root/x265/build/vc12-x86_64
    fi
    fldr_x265_bin=$fldr_x265_build/RelWithDebInfo



    fldr_x265_out=$fld_build_full_path/x265

    mkdir -p $fldr_x265_out
 
	cp $fldr_x265_bin/libx265.lib $fldr_x265_out
	cp $fldr_x265_bin/libx265.lib $fldr_x265_out/x265.lib
	cp $fldr_x265_bin/*.dll $fldr_x265_out
	cp $fldr_x265_bin/*.pdb $fldr_x265_out

	cp $fldr_x265_build/x265_config.h $fldr_x265_out
	cp $fldr_root/x265/source/x265.h $fldr_x265_out

    cp $fldr_x265_build/x265.pc  $fldr_mingw/share/pkgconfig


    if [ "$toolchain" == "msvc" ]
    then
        x265_params="--enable-gpl --enable-libx265 --extra-cflags=-I$fldr_x265_out --extra-ldflags=-LIBPATH:$fldr_x265_out"
    else
        x265_params="--enable-gpl --enable-libx265 --extra-cflags=-I$fldr_x265_out --extra-ldflags=-L$fldr_x265_out"
    fi

else
    x265_params=""
fi

#--------------------------------------------------------
# add zlib to msvc build
#--------------------------------------------------------

if [ "$add_zlib_msvc" = "true" ] && [ "$toolchain" == "msvc" ]
then
    cd $fldr_root
    fldr_zlib_out=$fld_build_full_path/zlib
    mkdir -p $fldr_zlib_out

    cp $fldr_mingw/bin/zlib1.dll $fldr_zlib_out
    cp $fldr_mingw/include/zlib.h $fldr_zlib_out
    cp $fldr_mingw/include/zconf.h $fldr_zlib_out

    make_def_and_lib_from_dll $fldr_zlib_out/zlib1.dll $fldr_zlib_out/zlib.lib

    zlib_params="--extra-cflags=-I$fldr_zlib_out --extra-cflags=-DZ_SOLO --extra-ldflags=-LIBPATH:$fldr_zlib_out"

else
    zlib_params=""
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
   $fldr_src_ffmpeg/configure $fftoolchain --arch=$bld_arch --enable-shared --enable-w32threads --enable-avresample $debug_flags $extracflags $extralinkflags $x264_params $x265_params $zlib_params
fi

if [ "$incremental" = "full" ] || [ "$incremental" = "inc" ]
then
   if [ "$toolchain" == "msvc" ]
   then
      make
   else
      make -j6
   fi
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

