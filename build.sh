#!/bin/bash
# JSLK Toolchain for UNIX like host systems.
# Build script.
# Version 3.0
# Copyright (c) Jacobo Soffer.
echo JSLK Toolchain v.3.0
echo Build Script license: GPL 3
echo Release Notes: https://github.com/sofferjacob/jslk-toolchain/releases/tag/v3.0
echo Git repo: https://github.com/sofferjacob/jslk-toolchain
echo Submit a bug report: https://github.com/sofferjacob/jslk-toolchain/issues
echo Downloading sources…
wget -i wget-list
echo Extracting archives…
for f in *.tar*; do tar xf $f; done
echo Preparing to build…
cd gcc-7.4.0
ln -s ../mpfr-4.0.2 mpfr
ln -s ../gmp-6.1.2 gmp
ln -s ../mpc-1.1.0 mpc
cd ..
export PREFIX="$HOME/toolchains/i386"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"
echo Prefix: $PREFIX
echo Target: $TARGET
echo Path: $PATH
cp toolchain.info $PREFIX
echo Building Binutils…
mkdir binutils-build
cd binutils-build
../binutils-2.33.1/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make -j2
make install
cd ..
echo Building GCC…
mkdir gcc-build
cd gcc-build
../gcc-7.4.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-languages=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
make all-target-libssp
make install-target-libssp
echo JSLK Toolchain Built!
echo Your toolchain was installed in $HOME/toolchains/i386
