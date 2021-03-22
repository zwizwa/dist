#!/bin/bash
set -ex
cd $(dirname $0)
make -C deps/libopencm3
./deps/openocd/build_pdap.sh
