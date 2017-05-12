#!/bin/bash
# Sierra Toolchain for UNIX like host systems.
# Build script.
# Version 2.0
# Copyright (c) 2017 Jacobo Soffer.
echo Downloading sources…
wget -i wget-list
echo Extracting archives…
for f in *.tar*; do tar xf $f; done
echo Preparing to build…
cd gcc-7.1.0
ln -s ../mpfr-3.1.5 mpfr
ln -s ../gmp-6.1.1 gmp
ln -s ../mpc-1.0.3 mpc
cd ..
export PREFIX="$HOME/toolchains/i386"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"
echo $PREFIX
echo $TARGET
echo $PATH
echo Building Binutils…
mkdir binutils-build
cd binutils-build
../binutils-2.28/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j2
make install
cd ..
echo Building GCC…
mkdir gcc-build
cd gcc-build
../gcc-7.1.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
make all-target-libssp
make install-target-libssp
echo Toolchain Built!
echo Your toolchain was installed in $HOME/toolchains/i386
 
