#!/usr/bin/env perl
package Formula;

use strict;
use warnings;
use encoding 'utf8';
use 5.14.1;

use constant AUTHOR     => 'Antonio Feitosa aka TeeBSD <https://twitter.com/teebsd>';
use constant LICENSE    => 'http://opensource.org/licenses/BSD-2-Clause';

sub new {
    my $class  = shift;
    my $prefix = shift;
    my $self   = {};
    $self->{prefix} = $prefix;
    # Changeable - START

    $self->{name}       = "ircii";
    $self->{homepage}   = "http://www.eterna.com.au/ircii/";
    $self->{url}        = "http://ircii.warped.com/ircii-20131230.tar.bz2";
    $self->{sha1}       = "b59f8fcd344c09b8820f6efbcc74ba9af7e587ce";
    $self->{type}       = "package";
    $self->{depends}    = qw(gmake);
    $self->{make}       = "make";

    # Changeable - END
    bless( $self, $class );
    return $self;
}

sub install {
    my $self        = shift;
    my $make        = $self->{make};
    my $prefix      = $self->{prefix};
    my @cfg_flags   = ("./configure",
        "--prefix $prefix",
        # Changeable - START

        "--disable-debug",
        "--enable-ipv6",
        "--disable-dependency-tracking",
        "--with-default=irc.freenode.net"

        # Changeable - END
    );
    push(@command,"$_ ") foreach (@cfg_flags);
    system(@command);
    system("$make");
    system("$make install");
}

1;

