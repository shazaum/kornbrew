#!/usr/bin/env perl
package Formula;

use strict;
use warnings;
use encoding 'utf8';
use 5.14.1;

use constant AUTHOR     => 'Renato dos Santos (Shazaum)';
use constant LICENSE    => 'http://opensource.org/licenses/BSD-2-Clause';

sub new {
    my $class = shift;
    my $prefix = shift;
    my $self = {};
    $self->{prefix} = $prefix;
    # Changeable - START
    
    $self->{name}       = "xz";
    $self->{homepage}   = "http://tukaani.org/xz/";
    $self->{url}        = "http://tukaani.org/xz/xz-5.0.5.tar.gz";
    $self->{sha1}       = "26fec2c1e409f736e77a85e4ab314dc74987def0";
    $self->{type}       = "package";
#    $self->{depends}    = qw(gmake);
    $self->{make}       = "make";
    
    # Changeable - END
    bless( $self, $class );
    return $self;
}

sub install {
    my $self = shift;
    my $make = $self->{make};
    my $prefix = $self->{prefix};
    my @command;
    my @cfg_flags = ("./configure", "--prefix $prefix",
    # Changeable - START
    
        "--enable-utf8",
    
    # Changeable - END
    );
    push(@command,"$_ ") foreach (@cfg_flags);
    system("@command");
    system("$make");
    system("$make install");
}

1;	
