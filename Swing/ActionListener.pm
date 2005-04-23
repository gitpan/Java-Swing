package Java::Swing::ActionListener;
use strict; use warnings;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['PerlActionListener'];

my %callbacks;
my %listeners;

# Normally, you should connect in favor of this method.
# Use get_listener only if you need to pass a listener to a constructor.  That
# situation defeats the normal action of connect.  It expects to receive
# the sending object.  For classes like javax.swing.Timer, you need a
# listener to pass to the constructor, before it gives you a reference.
# Therefore, for classes like Timer, first call get_listener.  Pass the
# returned listener to the Timer constructor.  Then, you MUST call
# add_callbacks on this class.
sub get_listener {
    my $invocant       = shift;  # not used
    return Java::Swing::ActionListener::PerlActionListener->new();
}

sub add_callbacks {
    my $invocant       = shift;  # ignored class name
    my $listener       = shift;
    my $sender         = shift;
    my $callbacks      = shift;
    my $object_name    = ref $sender;
    my $callbacks_name = ref $callbacks;

    $callbacks{$object_name}{$callbacks_name} = $callbacks;
    $listeners{$object_name}{$callbacks_name} = $listener;

    $listener->setSender($object_name);
    $listener->setCallbacks($callbacks_name);
}

sub connect {
    my $invocant       = shift;
    my $sender         = shift;
    my $callbacks      = shift;
    my $object_name    = ref $sender;
    my $callbacks_name = ref $callbacks;
    my $listener       =
        Java::Swing::ActionListener::PerlActionListener->new(
            $object_name,
            $callbacks_name
        );

    $callbacks{$object_name}{$callbacks_name} = $callbacks;
    $listeners{$object_name}{$callbacks_name} = $listener;

#    no strict;
    $sender->addActionListener($listener);
}

sub disconnect {
    my $invocant       = shift;  # not used
    my $sender         = shift;
    my $callbacks      = shift;
    my $object_name    = ref $sender;
    my $callbacks_name = ref $callbacks;

    undef $callbacks{$object_name}{$callbacks_name};
    $sender->removeActionListener(
        $listeners{$object_name}{$callbacks_name}
    );
}

sub _ActionListener {
    my $sender_name      = shift;
    my $callbacks_name   = shift;
    my $triggered_method = shift;
    my $event            = shift;

    my $methods = $callbacks{$sender_name}{$callbacks_name}
        or die "No registered _ActionListener callback for $sender_name\n";
    my $method = $methods->{$triggered_method} || sub {};

    no strict;
    $method->($sender, $event);
}

1;
