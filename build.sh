#!/bin/bash
set -ex
cd $(dirname $0)

# OpenOCD fork with PDAP driver
./deps/openocd/build_pdap.sh

GCC_DIR=gcc-arm-none-eabi-4_8-2014q2
if [ ! -d deps/$GCC_DIR ]; then
    (cd deps;
     wget https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q2-update/+download/gcc-arm-none-eabi-4_8-2014q2-20140609-linux.tar.bz2;
     tar xf gcc-arm-none-eabi-4_8-2014q2-20140609-linux.tar.bz2)
fi

export PATH=$(readlink -f deps)/$GCC_DIR/bin:$PATH

# OpenCM3 is used by uc_tools
make -C deps/libopencm3

# uc_tools contains bootloader and main application.
make -C deps/uc_tools -f rules.mk \
     gdb/bl_c8t6_boot1.core.f103.elf \
     gdb/pdap.x8.f103.elf \

# Flash the bootloader (bl) first, as it contains a default control
# block that is overwritten by the application (pdap).



