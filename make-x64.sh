#!/bin/bash

CROSS_COMPILE=""

if [ ! -d ./build/x64 ]; then
	mkdir -p ./build/x64;
fi

pushd ./build/x64 > /dev/null 2>&1
cmake -DCMAKE_CXX_COMPILER=/usr/bin/${CROSS_COMPILE}g++ \
  -DCMAKE_C_COMPILER=/usr/bin/${CROSS_COMPILE}gcc \
  -DCMAKE_LINKER=/usr/bin/${CROSS_COMPILE}ld \
  -DCMAKE_AR=/usr/bin/${CROSS_COMPILE}ar \
  -DCMAKE_NM=/usr/bin/${CROSS_COMPILE}nm \
  -DCMAKE_OBJCOPY=/usr/bin/${CROSS_COMPILE}objcopy \
  -DCMAKE_OBJDUMP=/usr/bin/${CROSS_COMPILE}objdump \
  -DCMAKE_RANLIB=/usr/bin/${CROSS_COMPILE}ranlib \
  -DCMAKE_STRIP=/usr/bin/${CROSS_COMPILE}strip \
  -DCMAKE_INSTALL_PREFIX=../_install/x64 \
  ../../

ccmake ../../
cmake ../../
make
popd > /dev/null 2>&1
