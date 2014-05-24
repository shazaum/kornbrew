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
    
    $self->{name}       = "python";
    $self->{homepage}   = "http://www.python.org";
    $self->{url}        = "http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tgz";
    $self->{sha1}       = "8328d9f1d55574a287df384f4931a3942f03da64";
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
    system("@command");
    system("$make");
    system("$make install");
    # Changeable - START
    
    system("ftp http://python-distribute.org/distribute_setup.py");
    system("python distribute_setup.py");

    # Changeable - END
}

1;
