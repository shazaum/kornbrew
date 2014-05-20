#!/usr/bin/env perl
package Formula;

sub new {
	my $class = shift;
	my $prefix = shift;
	my $self = {};
	bless( $self, $class );
	
	$self->{prefix}		= $prefix;
	$self->{name}		= "nano";
	$self->{homepage}	= "http://www.nano-editor.org/";
	$self->{url}		= "http://www.nano-editor.org/dist/v2.2/nano-2.2.6.tar.gz";
	$self->{sha1}		= "f2a628394f8dda1b9f28c7e7b89ccb9a6dbd302a";
	$self->{type}		= "package";
	$self->{depends}	= qw(gmake);
	$self->{make}		= "make";

	return $self;
}

sub install {
	my $self = shift;
	my $install = shift;
	my $make = $self->{make};
	system("./configure --prefix $self->{prefix}",
							"--enable-utf8"
	);
	system("$make");
	system("$make install");
}

1;
