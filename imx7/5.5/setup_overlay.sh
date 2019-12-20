#! /bin/bash
function nl_error {
  echo "setup_overlay: $*" >&2
  exit 1
}

base=/media/nort/Yocto/cl_som_imx7/5.5
lowerdir=$base/sysroot-glibc-linaro-2.21-2017.10-arm-linux-gnueabihf
upperdir=$base/extinst
[ -d $lowerdir ] || nl_error lowerdir not found
[ -d $upperdir ] || nl_error upperdir not found
[ -d /mnt/sysroot ] || mkdir /mnt/sysroot
[ -d /mnt/sysroot/lib ] ||
mount -t overlay overlay -o lowerdir=$lowerdir:$upperdir /mnt/sysroot

