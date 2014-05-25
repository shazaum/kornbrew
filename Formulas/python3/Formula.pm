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
    
    $self->{name}       = "python3";
    $self->{homepage}   = "http://www.python.org";
    $self->{url}        = "http://www.python.org/ftp/python/3.4.0/Python-3.4.0.tgz";
    $self->{sha1}       = "bb5125d1c437caa5a62e0a3d0fee298e91196d6f";
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
    
    
    # Changeable - END
    );
    push(@command,"$_ ") foreach (@cfg_flags);
    system("@command") or die $!;
    system("$make") or die $!;
    system("$make install") or die $!;
    # Changeable - START
    
    system("ftp http://python-distribute.org/distribute_setup.py") or die $!;
    system("python3 distribute_setup.py") or die $!;

    # Changeable - END
}

1;
