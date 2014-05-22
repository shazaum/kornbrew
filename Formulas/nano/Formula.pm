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
	$self->{prefix}		= $prefix;
    # Changeable - START
    
    $self->{name}		= "nano";
	$self->{homepage}	= "http://www.nano-editor.org/";
	$self->{url}		= "http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz";
	$self->{sha1}		= "f2a628394f8dda1b9f28c7e7b89ccb9a6dbd302a";
	$self->{type}		= "package";
	$self->{depends}	= qw(gmake);
	$self->{make}		= "make";
    $self->{cfg_flags}  = "--enable-utf8";
    
    # Changeable - END
    bless( $self, $class );
	return $self;
}

sub install {
	my $self        = shift;
    my $make        = $self->{make};
    my $prefix      = $self->{prefix};
    my $cfg_flags   = $self->{cfg_flags};
    system("./configure --prefix $prefix $cfg_flags");
    system("$make");
    system("$make install");
}

1;
