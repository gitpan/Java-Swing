use strict;
use Test::More tests => 1;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $frame = JFrame->new();
my $label = JLabel->new(
    { text => "Drag Here", horizontalAlignment => SwingConstants->CENTER }
);

$frame->getContentPane()->add($label);
$frame->setSize(200, 300);
$frame->show();

my $swinger = Java::Swing->new();
$swinger->connect(
    "MouseMotionListener", $frame, { mouseDragged => \&dragged }
);
$swinger->start();

sub dragged {
    pass("mouse dragged");
    $swinger->stop();
}
