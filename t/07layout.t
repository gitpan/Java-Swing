use strict;
use Test::More tests => 1;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $frame  = JFrame->new();
my $pane   = $frame->getContentPane();
my $layout = FlowLayout->new();
$pane->setLayout($layout);

# use Data::Dumper; print STDERR Dumper($constr);

my $label1 = JLabel->new("Drag In");
my $label2 = JLabel->new("This Window");

$frame->getContentPane()->add($label1);
$frame->getContentPane()->add($label2);

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
