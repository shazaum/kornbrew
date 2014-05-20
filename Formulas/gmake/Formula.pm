#!/usr/bin/env ksh
formula="gmake"
homepage="http://www.gnu.org/software/make/"
url="http://ftp.gnu.org/gnu/make/make-4.0.tar.gz"
sha1="b092020919f74d56118eafac2c202f25ff3b6e59"

type="package"

#depends=""

build[0]="./configure"
build[1]="--prefix=${PREFIX}"

make_bin="make"

postbuild="ln -s $INSTALL_DIR/make $INSTALL_DIR/$formula"
