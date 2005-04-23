package Timer;
use strict; use warnings;

use Carp;

use Java::Swing::ActionListener;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['javax.swing.Timer'];

sub new {
    my $class     = shift;
    my $delay     = shift;
    my $callbacks = shift;
    my $listener  = Java::Swing::ActionListener->get_listener();

    my $retval     = Timer::javax::swing::Timer->new($delay, $listener);

    Java::Swing::ActionListener->add_callbacks($listener, $retval, $callbacks);

    return $retval;
}

1;
