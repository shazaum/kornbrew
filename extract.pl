#!/usr/bin/perl
use strict;
use warnings;

use Archive::Extract;
### build an Archive::Extract object ###
print "\$0: $0\n";
my $filename = shift or die "Usage: $0 FILENAME\n";
my $ae = Archive::Extract->new( archive => $filename );
my $ok = $ae->extract;
print $ok;
