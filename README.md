# JSLK Toolchain
[![Build Status](https://travis-ci.org/sofferjacob/edison-toolchain.svg?branch=master)](https://travis-ci.org/sofferjacob/edison-toolchain)

The toolchain used to cross-compile the JSLK kernel.

# Using it.
You can build it and use the toolchain in any UNIX like OS (Linux, macOS, BSD). First clone the repository to your computer and run:
```
cd toolchain
./build.sh
```

Wait a while for your toolchain to download and build, then you will have your toolchain installed in ``/home/toolchains/i386``. 

## How to check which version you are using?
Starting with toolchain verion 2.0, to check which version of the toolchain check the file ``toolchain.info`` in the toolchain install directory.

## Porting to a different target architecture
To port the toolchain to a different architecture, just change the ``TARGET=`` field in line 17 of ``build.sh`` and if you feel like sharing create a pull request.

> Current stable version: 3.0 

> Current GCC: 9.2.0 

> Current Binutils: 2.33.1 

> Supported archs: i386-elf


