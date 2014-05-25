#!/usr/bin/env perl
package Formula;

use strict;
use warnings;
use encoding 'utf8';
use 5.14.1;

use constant AUTHOR     => 'Antonio Feitosa aka TeeBSD <https://twitter.com/teebsd>';
use constant LICENSE    => 'http://opensource.org/licenses/BSD-2-Clause';

sub new {
    my $class = shift;
    my $prefix = shift;
    my $self = {};
    $self->{prefix} = $prefix;
    # Changeable - START
    
    $self->{name}       = "curl";
    $self->{homepage}   = "http://www.curl.haxx.se";
    $self->{url}        = "http://curl.haxx.se/download/curl-7.37.0.tar.gz";
    $self->{sha1}       = "cdbffccb3652ecc1b045bd31399f3934d80d0714";
    $self->{type}       = "package";
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
    
        "--disable-debug",
        "--disable-dependency-tracking",
    
    # Changeable - END
    );
    push(@command,"$_ ") foreach (@cfg_flags);
    system("@command");
    system("$make");
    system("$make install");
}

1;
