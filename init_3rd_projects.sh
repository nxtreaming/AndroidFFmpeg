#!/bin/sh

git submodule init
git submodule sync
git submodule update

cd FFmpegLibrary
cd jni

echo "try to generate freetype2 configure"
cd freetype2
./autogen.sh
cd ..

echo "try to generate fribidi configure"
cd fribidi
autoreconf -ivf
cd ..

echo "try to generate libass configure"
cd libass
autoreconf -ivf
cd ..

echo "try to generate vo-aacenc configure"
cd vo-aacenc
autoreconf
cd ..

echo "try to generate vo-amrwbenc configure"
cd vo-amrwebenc
autoreconf
cd ..

echo "try to build the jni shared library"
$NDK/ndk-build

echo "Fininshed compiling"

