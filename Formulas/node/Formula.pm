#!/usr/bin/env ksh
formula="node"
homepage="http://www.nodejs.org"
url="http://nodejs.org/dist/v0.10.28/node-v0.10.28.tar.gz"
sha1="ef08a75f6359a16e672cae684e0804ca7f4554b7"

type="package"

depends="flock gmake python"
#prebuild[0]="echo Need libexecinfo. Sorry put as root: pkg_add libexecinfo"
#prebuild[1]="exit 1"

build[0]="./configure"
build[1]="--prefix=${PREFIX}"

make_bin="gmake"

#postbuild[0]=""
