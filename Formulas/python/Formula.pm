#!/usr/bin/env ksh
formula="python"
homepage="http://www.python.org"
url="https://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz"
sha1="8328d9f1d55574a287df384f4931a3942f03da64"

type="package"

build[0]="./configure"
build[1]="--prefix=${PREFIX}"

make_bin="make"

postbuild[0]="ftp http://python-distribute.org/distribute_setup.py"
postbuild[1]="python distribute_setup.py"
