package Java::Swing::ChangeListener;
use strict; use warnings;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['PerlChangeListener'];

my %callbacks;
my %listeners;

sub connect {
    my $invocant       = shift;  # not used
    my $sender         = shift;
    my $callbacks      = shift;
    my $object_name    = ref $sender;
    my $callbacks_name = ref $callbacks;
    my $listener       =
        Java::Swing::ChangeListener::PerlChangeListener->new(
            $object_name,
            $callbacks_name
        );

    $callbacks{$object_name}{$callbacks_name} = $callbacks;
    $listeners{$object_name}{$callbacks_name} = $listener;

    no strict;
    $sender->addChangeListener($listener);
}

sub disconnect {
    my $invocant       = shift;  # not used
    my $sender         = shift;
    my $callbacks      = shift;
    my $object_name    = ref $sender;
    my $callbacks_name = ref $callbacks;

    undef $callbacks{$object_name}{$callbacks_name};
    $sender->removeChangeListener(
        $listeners{$object_name}{$callbacks_name}
    );
}

sub _ChangeListener {
    my $sender_name      = shift;
    my $callbacks_name   = shift;
    my $triggered_method = shift;
    my $event            = shift;

    my $methods = $callbacks{$sender_name}{$callbacks_name}
        or die "No registered _ChangeListener callback for $sender_name\n";
    my $method = $methods->{$triggered_method} || sub {};

    no strict;
    $method->($sender, $event);
}

1;
