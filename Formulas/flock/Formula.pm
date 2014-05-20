#!/usr/bin/env ksh
formula="flock"
homepage=""
url="http://blade2k.humppa.hu/distfiles/flock-20110525.c"
sha1="4ab12fd44627254d060387f36b67d875a4d5b776"

#type="package" | type="source"
type="source"

#depends=""a

#build[0]="mv flock-20110525.c flock.c"

make_bin="gcc $DOWNFILE -o flock"

postbuild[0]="mkdir -p $PREFIX/bin"
postbuild[1]="cp flock $PREFIX/bin"
