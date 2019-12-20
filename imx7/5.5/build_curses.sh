#! /bin/bash
. ./imx7_setup.sh
pkg=ncurses
ver=6.1
URL=/home/nort/Downloads/${pkg}-${ver}.tar.gz
DESTDIR=/media/nort/Yocto/cl_som_imx7/5.5/extinst

# This archive is double-gzipped:
zcat $URL | tar -xzf -
# For singley-gzipped archives:
# tar -xzf $URL

mv ${pkg}-${ver} src
mkdir build
cd build
../src/configure --prefix=/usr --with-install-prefix=$DESTDIR $CONFIGURE_FLAGS &&
make &&
make install

# include(ExternalProject)
# ExternalProject_Add(libncurses
#   PREFIX ${CMAKE_CURRENT_BINARY_DIR}/ncurses-6.1
#   CONFIGURE_COMMAND ${CMAKE_CURRENT_BINARY_DIR}/ncurses-6.1/src/libncurses/configure --prefix=/usr --with-install-prefix=/media/nort/Yocto/cl_som_imx7/5.5/extinst
#   BUILD_COMMAND make
#   INSTALL_COMMAND make install
# )
# 
