#!/bin/bash

SD_BOOT=/media/BOOT
SD_ROOTFS=/media/rootfs
KERN_DIR=/home/neal/allwinner-tab/linux-git/linux-allwinner
IMG_DIR=/arch/arm/boot
OUT_DIR=/output

set -e

echo "Building kernel"
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j8 uImage modules

read -p "Waiting, if compilation failed, abort with control-c"
echo "Copying modules"
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=output modules_install
echo "New kernel ready"

