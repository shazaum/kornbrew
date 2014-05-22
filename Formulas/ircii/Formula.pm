#!/usr/bin/env perl
package Formula;

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
    $self->{cfg_flags}  = ' --disable-debug
                            --enable-ipv6
                            --disable-dependency-tracking
                            --with-default=irc.freenode.net
    ';

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
