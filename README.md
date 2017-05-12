# Edison Toolchain
This toolchain can be used to cross-compile software for the i386-elf architecture. It is compatible with any kind of
architecture (host).

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

> Current stable version: 2.0 

> Current GCC: 7.1.0 

> Current Binutils: 2.8 

> Supported archs: i386-elf, arm-eabi

Copyright (c) 2017 Jacobo Soffer.
