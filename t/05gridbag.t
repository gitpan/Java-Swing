use strict;
use Test::More tests => 1;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $frame  = JFrame->new();
my $pane   = $frame->getContentPane();
my $layout = GridBagLayout->new();
my $constr = GridBagConstraints->new();
$pane->setLayout($layout);

my $label1 = JLabel->new("Drag In");
my $label2 = JLabel->new("This Window");

$constr->setGridx(1);
$constr->setGridy(1);

$layout->setConstraints($label1, $constr);

$frame->getContentPane()->add($label1);

$constr->setGridx(1);
$constr->setGridy(2);

$layout->setConstraints($label2, $constr);

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
