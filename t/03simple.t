use strict;
use Test::More tests => 3;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $frame = JFrame->new();

isa_ok($frame, 'JFrame::javax::swing::JFrame', 'JFrame proper blessing');

my $button = JButton->new("Click Here");

isa_ok($button, 'JButton::javax::swing::JButton', 'JButton proper blessing');

my $rootPane = $frame->getContentPane();

$rootPane->add($button);

$frame->setSize(200, 300);
$frame->show();

my $swinger = Java::Swing->new();
$swinger->connect("ActionListener", $button, { actionPerformed => \&pressed });
$swinger->start();

sub pressed {
    pass("button pressed");
    $swinger->stop();
}
