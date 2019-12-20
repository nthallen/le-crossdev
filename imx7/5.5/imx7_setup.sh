# Working from https://www.embeddeduse.com/2017/06/03/cmake-cross-compilation-based-on-yocto-sdk/
# export SYSROOTS=/media/nort/Yocto/yocto_varsomam33.u14/SDK/sysroots
# I have hard coded that here, since there are other changes involved

SYSROOTS=/media/nort/Yocto/cl_som_imx7/5.5
TARGETSYSROOT=${SYSROOTS}/sysroot-glibc-linaro-2.21-2017.10-arm-linux-gnueabihf
[ -d /mnt/sysroot/usr ] && TARGETSYSROOT=/mnt/sysroot
# set(CMAKE_SYSTEM_PROCESSOR armv7-a)
TOOLCHAIN_BIN=${SYSROOTS}/gcc-linaro-5.5.0-2017.10-x86_64_arm-linux-gnueabihf/bin
PATH=${TOOLCHAIN_BIN}:$PATH
TOOLCHAIN_PREFIX=arm-linux-gnueabihf-

COMPILER_FLAGS=" -march=armv7-a -marm -mfpu=neon -mfloat-abi=hard -O2 -pipe -g -feliminate-unused-debug-types "
COMPILER_FLAGS+="--sysroot=${TARGETSYSROOT} "

#  -fdebug-prefix-map=${tmpdir}/work/x86_64-nativesdk-arago-linux/meta-environment-varsomam33/1.0-r8=/usr/src/debug/meta-environment-varsomam33/1.0-r8 -fdebug-prefix-map=${tmpdir}/sysroots/x86_64-linux= -fdebug-prefix-map=${tmpdir}/sysroots/x86_64-nativesdk-arago-linux= ")

export CC="${TOOLCHAIN_PREFIX}gcc ${COMPILER_FLAGS}"
export CXX="${TOOLCHAIN_PREFIX}g++ ${COMPILER_FLAGS}"
export CPP="${TOOLCHAIN_PREFIX}gcc -E ${COMPILER_FLAGS}"
export AS="${TOOLCHAIN_PREFIX}as "
export LD="${TOOLCHAIN_PREFIX}ld --sysroot=$TARGETSYSROOT "
export GDB=${TOOLCHAIN_PREFIX}gdb
export STRIP=${TOOLCHAIN_PREFIX}strip
export RANLIB=${TOOLCHAIN_PREFIX}ranlib
export OBJCOPY=${TOOLCHAIN_PREFIX}objcopy
export OBJDUMP=${TOOLCHAIN_PREFIX}objdump
export AR=${TOOLCHAIN_PREFIX}ar
export NM=${TOOLCHAIN_PREFIX}nm
export M4=m4
export CONFIGURE_FLAGS="--target=arm-linux-gnueabi --host=arm-linux-gnueabi --build=x86_64-linux --with-libtool-sysroot=$TARGETSYSROOT"

export CFLAGS=-isystem${TARGETSYSROOT}/usr/include
CXX_INCLUDE=${TARGETSYSROOT}/gcc-linaro-5.5.0-2017.10-x86_64-arm-linux-gnueabihf/arm-linux-gnueabihf/include/c++/5.5.0
export CXXFLAGS="-isystem${CXX_INCLUDE} -isystem${CXX_INCLUDE}/arm-linux-gnueabihf"

export CROSS_COMPILE=$TOOLCHAIN_PREFIX
export CROSS_STAGE=/opt/linkeng/imx7
