#!/usr/bin/env ksh
formula="python"
homepage="http://www.python.org"
url="https://www.python.org/ftp/python/3.4.0/Python-3.4.0.tgz"
sha1="bb5125d1c437caa5a62e0a3d0fee298e91196d6f"

type="package"

build[0]="./configure"
build[1]="--prefix=${PREFIX}"

make_bin="make"

postbuild[0]="ftp -o - http://python-distribute.org/distribute_setup.py | python3"
