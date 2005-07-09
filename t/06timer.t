use strict;
use Test::More tests => 1;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $timer       = Timer->new(10, { actionPerformed => \&timer });
my $swinger     = Java::Swing->new();

$timer->start();
$swinger->start();

sub timer {
    pass("timer connection");
    $swinger->stop();
}
