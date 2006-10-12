package Java::Swing;
use strict; use warnings;

use Carp;
use Inline Java => 'DATA';

our $VERSION = '0.13';

my %callbacks;
my %listeners;

sub import {
    # To add packages to the Java::Swing scheme, see PerlRealPackages.pm.
    # Make your additions in PerlRealLocalPackages.pm or
    # PerlFakeLocalPackages.pm.  Use Real for modules that have a .pm file
    # and Fake for modules this package should fabricate.

    use Java::Swing::PerlRealPackages;
    use Java::Swing::PerlRealLocalPackages;
    foreach my $package (
        @Java::Swing::PerlRealPackages::packages,
        @Java::Swing::PerlRealLocalPackages::local_packages,
    ) {
        no strict;
        *{"$package\::AUTOLOAD"} = \&module_autoload;
    }

    use Java::Swing::PerlFakePackages;
    use Java::Swing::PerlFakeLocalPackages;
    my %package_names = (
        %Java::Swing::PerlFakePackages::names,
        %Java::Swing::PerlFakeLocalPackages::names,
    );
    foreach my $package (
        @Java::Swing::PerlFakePackages::packages,
        @Java::Swing::PerlFakeLocalPackages::local_packages,
    ) {
        no strict;
        *{"$package\::AUTOLOAD"} =
            gen_fake_module_autoload($package_names{$package});
    }
}

sub module_autoload {
    my $invocant = $_[0];
    my $command  = our $AUTOLOAD;
    my $required = "Java/Swing/$invocant.pm";

    require $required;

    goto &$command;
}

sub gen_fake_module_autoload {
    my $package_name = shift || 'javax.swing';

    return sub {
        my $invocant = $_[0];
        my $command  = our $AUTOLOAD;
        my $studied  = "$package_name.$invocant";

        Inline->bind(
            Java       => 'STUDY',
            SHARED_JVM => 1,
            AUTOSTUDY  => 1,
            STUDY      => [ $studied ],
        );

        no strict;
        *{"$invocant\::new"} = gen_generic_new($package_name);

        goto &$command;
    }
}

sub gen_generic_new {
    my $package_name = shift;
    $package_name    =~ s/\./::/g;

    return sub {
        my $class        = shift;
        my $inline_class = "Java\::Swing\::$package_name\::$class";

        # if we were passed a hash reference, construct a default object, then
        # call set on each hash key with the value
        if (ref($_[0]) =~ /HASH/) {
            my $attributes = shift;
            my $retval;

            if ( defined $attributes->{ Object } ) {
                my $init_object = delete $attributes->{ Object };
                $retval = $inline_class->new( $init_object );
            }
            else {
                $retval = $inline_class->new();
            }

            foreach my $attribute (keys %$attributes) {
                my $setter = "set" . ucfirst($attribute);
                eval { $retval->$setter($attributes->{$attribute}); };
                if ($@) {
                    croak "Error: '$attribute' is not an attribute of $class";
                }
            }
            return $retval;
        }
        else { # pass args directly to constructor
            return $inline_class->new(@_);
        }
    }
}

# -------------------------------------------------------------------
# -----     Methods for Java::Swing objects                     -----
# -------------------------------------------------------------------

sub new {
    my $class = shift;
    my $self  = {};

    $self->{OBJECT} = Java::Swing::Swinger->new();

    return bless $self, $class;
}

sub start {
    my $self = shift;

    $self->{OBJECT}->StartCallbackLoop();
}

sub stop {
    my $self = shift;

    $self->{OBJECT}->StopCallbackLoop();
}

# See Timer.pm for an example of using the delayed approach.  To summarize,
# if you need to pass your listener to the constructor of your sender,
# call delayed_connect to get your listener.  Pass it to the constructor.
# Then call finish_delayed_connect with all three pieces (listener, sender,
# and callbacks).
sub delayed_connect {
    my $invocant         = shift;  # not used
    my $listener_type    = shift;
    my $studied          = "Perl$listener_type";

    Inline->bind(
        Java       => 'STUDY',
        SHARED_JVM => 1,
        AUTOSTUDY  => 1,
        STUDY      => [ $studied ],
    );

    my $listening_class  = 'Java::Swing::'
                         . "Perl$listener_type";

    my $listener         = $listening_class->new();

    return $listener;
}

sub finish_delayed_connect {
    my $invocant         = shift;  # not used
    my $listener         = shift;
    my $sender           = shift;
    my $callbacks        = shift;
    my $send_name        = ref $sender;     # stringify these
    my $call_name        = ref $callbacks;

    $callbacks{$send_name}{$call_name} = $callbacks;
    $listeners{$send_name}{$call_name} = $listener;

    $listener->setSender($send_name);
    $listener->setCallbacks($call_name);
}

sub connect {
    my $invocant         = shift;  # not used
    my $listener_type    = shift;
    my $sender           = shift;
    my $callbacks        = shift;
    my $studied          = "Perl$listener_type";

    Inline->bind(
        Java       => 'STUDY',
        SHARED_JVM => 1,
        AUTOSTUDY  => 1,
        STUDY      => [ $studied ],
    );

    delegate_connection($listener_type, $sender, $callbacks);
}

sub delegate_connection {
    my $listener_type    = shift;
    my $sender           = shift;
    my $callbacks        = shift;
    my $send_name        = ref $sender;     # stringify these
    my $call_name        = ref $callbacks;

    my $listening_class  = 'Java::Swing::'
                         . "Perl$listener_type";

    my $listener         = $listening_class->new($send_name, $call_name);

    $callbacks{$send_name}{$call_name} = $callbacks;
    $listeners{$send_name}{$call_name} = $listener;

    my $add_method       = "add$listener_type";
    $sender->$add_method($listener);
}

# XXX not tested
sub disconnect {
    my $invocant         = shift;  # not used
    my $listener_type    = shift;
    my $sender           = shift;
    my $callbacks        = shift;
    my $listener_package = "Java::Swing::$listener_type";

    $listener_package->disconnect($sender, $callbacks);
}

sub _Listener {  # for the private use of our java class friends.
    my $sender_name      = shift;
    my $callbacks_name   = shift;
    my $triggered_method = shift;
    my $event            = shift;

    my $methods = $callbacks{$sender_name}{$callbacks_name}
        or die "No registered callback for $sender_name $callbacks_name\n";
    my $method = $methods->{$triggered_method} || sub {};

    no strict;
    $method->($sender_name, $event);
}

1;

=head1 NAME

Java::Swing - Perl extension providing direct access to the Java Swing API

=head1 SYNOPSIS

  BEGIN { $ENV{CLASSPATH} .= ':/path/to/Java/Swing/java'; }

  use Java::Swing;
  my $swinger = Java::Swing->new();

  my $frame  = JFrame->new();
  my $button = JButton->new( { label => 'Press Me' } );

  $frame->getContentPane()->add($button);

  $swinger->connect(
    'ActionListener', $button, { actionPerformed => \&myListener }
  );

  my $timer = Timer->new(10, { actionPerformed => \&timer_catcher });
  $timer->start();

  $swinger->start();

  sub mylistener {
    my $generating_object = shift;
    my $event             = shift;
    print "Hello, Rob!\n";
  }

  my $count = 1;
  sub timer_catcher {
    print "Timer went off " . $count++;
  }

=head1 ABSTRACT

  Provides direct access to the Java Swing toolkit from Perl.

=head1 DESCRIPTION

Though you can write a Java program which is driven by Perl, some people
may prefer to keep their Perl pure.  This package lets you do that in manner
similar to the way Perl/Tk and Gtk2:: provide access to their underlying
libraries.  This lets us code in our favorite language, while using the
graphical interface capabilities of Java Swing.

=head1 EXAMPLE

In the example directory of the distribution there is an example called
calc.  Here I will walk through it a bit at a time.  To see it in one
piece look in the untarred distribution.  To run it after make
and before installing Java::Swing type:

    perl -I blib/lib example/calc

After installation just use:

    perl example/calc

But remember to change the path separators to fit your OS.

    use strict; use warnings;

    # This program provides an example of a simple Java::Swing application.
    # Type an expression in the top text box, press evaluate, and see the
    # answer in the other box.

As the comment tries to say, this program displays two JTextFields and
a JButton.  When the button is pressed, the expression in the first field
is eval'd and the result is placed in the second field.

    # Note that to make the example work, you must have the directory containing
    # the Java::Swing classes in the classpath.  In the distribution this is
    # called java.

    BEGIN { $ENV{CLASSPATH} .= ':java' }

No changes to the CLASSPATH will be effective if they come after
use Java::Swing, so put them in a BEGIN block before that statement.
The classes in the java directory of the distribution provide support
for event listeners.

    use Java::Swing;

This innocuous looking statement actually sets up the aliases that make it
easy to refer to Java Swing classes.  In particular, it sets up namespaces
for each Component so you can refer to them directly as shown immediately
below.  It does not load the Java classes until you actually use them.

    my $expression  = JTextField->new();
    my $answer      = JTextField->new( { columns => 10 } );
    my $submit      = JButton   ->new("Evaluate");
    my $frame       = JFrame    ->new();
    my $root_pane   = $frame    ->getContentPane();
    my $south_panel = JPanel    ->new();

Once you use Java::Swing, you can refer to javax.swing classes by their
class name alone as if it name were a Perl package name.  All class methods,
including constructors, can be called as normal through this Perl package
name.

But, if you like, you may also use Java::Swing named attribute construction,
as shown for the second JTextField above.  Simply supply a hash reference
whose keys are attributes of the class with the proper values.  Your object
will be constructed by calling the empty argument constructor.  Then the
attribute values will be supplied by calling set accessors.  So columns => 10
will translate into setColumns(10).

As of version 0.12, you may add an Object attribute to the constructor
hash.  Then Java::Swing will call the constructor on the underlying class
which expects it, and then call set accessors for any additional attributes.
For example:

        my $label = JLabel->new(
            { Object => $icon,
              text   => 'caption', }
        );
Thanks to Andreas Puerzer for suggesting this additional sugar.

Continuing with the example:

    $south_panel->add(JLabel->new("Answer:"), "West"  );
    $south_panel->add($answer,                "Center");
    $south_panel->add($submit,                "East"  );

    $root_pane->add($expression,  "North");
    $root_pane->add($south_panel, "South");

    $frame->setSize(300, 100);
    $frame->show();

These lines perform Component layout.  If you are not familiar with layouts in
Java Swing (which has the same scheme as awt), consult a book (O'Reilly
has more than one that will do, try the Java Foundation Classes in a Nutshell
or Java Swing).

    my $swinger = Java::Swing->new();

At some point, you must obtain a Java::Swing object.  Through it, you
stop and start event listening.  It also allows you to connect listeners
directly to Perl code.

    $swinger->connect(
            "ActionListener", $submit, { actionPerformed => \&evaluate }
    );

    $swinger->connect(
            "WindowListener", $frame, { windowClosing => \&ending }
    );

Call connect through your Java::Swing object passing it the listener type,
the object to listen to, and a hash reference whose keys are all the events
you care about.  The values in the hash must be code references.  These
will be called when the event is triggered.  They will receive the stringified
name of the sending object (the originator of the event) and the event object.
If you need the actual sending object, ask the event for it (try getSource).
You only need to supply the events you care about.  Leave others out,
default no-ops will be called for them.

If you plan to disconnect, you need to store the hash reference in a
variable, so that you can pass EXACTLY the same arguments to the disconnect
method.  It is not enough to have the same data in the hash reference, it
must be the same reference.

If you want multiple routines called for the same event, call connect
repeatedly.  Give it a different hash reference each time, even if that
reference refers to the same name/code ref pairs.

    $swinger->start();

After everything is ready, call start on your Java::Swing object.  Once you
do this Java takes over control with its event loop.  This probably makes
Java::Swing incompatible with other packages that want to manage the main
loop, like POE (if you can make such packages cooperate, please advise me
on how it is done).

    sub evaluate {
        my $sender_name = shift;
        my $event       = shift;

        $answer->setText(eval $expression->getText());
    }

Here, evaluate pays no attention to the arguments it receives, but they
are included so you can see how they come in.  Instead, the text in the
expression box is passed directly to eval (yes, security is important here,
don't set uid).  That answer is directly placed in the answer field via
setText.

    sub ending {
        $swinger->stop();
    }

When you receive control via an event, you can stop the Java event loop by
calling stop on your Java::Swing object.  Here that happens when the user
closes the window.  When you stop the event loop, your program terminates.

=head1 EXTENDING

While I have tried to provide all the Swing you will ever need, there
are inevitably some things I have not gotten to.  Further, you may have
in house code which you would like to incoroprate into this scheme.
This section explains the pieces needed to use other code as part of
Java::Swing.

=head2 Adding Components or Families of Them

While most of the Components from Swing are implemented, AWT, SWT and other
kits are not implemented (though parts of AWT are).  Most Components have
the same basic plan.  They are part of Swing.  They have a no argument
constructor and accessors for all of their attributes.  If that describes
your widget, there is only one thing to do:

    Add the base name of your class to the @packages list in
    Swing::PerlFakeLocalPackages

If your widget is not at the top level of its package include the
subdirectories leading from the package to it like so:

    text::html::AccessibleHTML

If the widget has all of the above traits, but is in a different package,
you should still add it to C<@packages> in C<Swing::PerlFakeLocalPackages>.
But, you also need to add an entry for it in C<%names> like so:

    YourWidget => 'com.yourcompany.package',

If you are adding lots of widgets, you'll want to automate this, but
I don't have a lot of advice on how to do so.  I did it once and forgot
the scripts.  I don't think they were complex.

If the Java class is standard (for some sense of standard), send the module
to me so I can add it to future distributions.

=head2 Adding Listeners

In Java::Swing, events are handled through callbacks to Perl code.  To make
the callbacks happen, you need a Java class which implements the
listener interface.  As of version 0.10, you no longer need a corresponding
Perl module, the code from those modules is now implemented once in
Swing.pm.  It is possible to hand code the Java listener implementation,
but it is a pain.

There are two real possibilities.  Either you have a single listener or
you have several.  In the first case, you can use listener_generator.
This script is not installed, but can be found in the Swing/Generate
subdirectory of the distribution.  Details follow.

=head3 One Listener at a Time

Create a file describing the listener with a valid Perl hash reference in it
like this:

{
    'listener' => 'TreeWillExpandListener',
    'methods' => [
        {
            'name' => 'treeWillExpand',
            'type' => 'javax.swing.event.TreeExpansionEvent',
            'throws' => 'javax.swing.tree.ExpandVetoException'
        },
        {
            'name' => 'treeWillCollapse',
            'type' => 'javax.swing.event.TreeExpansionEvent',
            'throws' => 'javax.swing.tree.ExpandVetoException'
        }
    ],
    'full_name' => 'javax.swing.event.TreeWillExpandListener'
}

Always use all three keys:

=over 4

=item full_name

The fully qualified name of the listener interface.

=item listener

The interface name (short form, not qualified).

=item methods

An anonymous list of hash references.  Each hash needs two keys:

=over 4

=item name (required)

The name of the method.

=item type (required)

The type of event the method receives.

=item throws (optional)

The type of event the method throws.

=back

=back

Once you have a file describing your listener, run C<listener_generator>
with that file as the only command line argument.  This writes to standard
out.  Save the resulting file as C<PerlNameListener.java>.  When you
compile the java file, include the Inline classes in the CLASSPATH, these
will be in a directory like 

    /cpan/modules/Inline-Java-0.47/Java/classes

(During run time, Inline::Java makes sure these are in the CLASSPATH.)

=head3 Families of Listeners

When adding a whole new toolkit (like swt) you need to add all the listeners.
To do this use the following steps (all scripts mentioned are in the
Swing/Generate directory of the distribution):

=over 4

=item 1

Use C<decomp_listeners>, giving it the package name and the directory where
source and class files live.  (Note that it relies on a hard coded path
to your rt.jar, change that to the correct location.)
(If you don't have sources, you'll have to change the script substantially.)
The output comes to standard out, store it in a file.

=item 2

Use C<all_listeners>, giving it the name of the file from step one along with
directory for the java pieces.

=item 3

Compile the java programs.  Remember to include the Inline::Java classes
in the CLASSPATH for compilation (they are supplied for you at run time).
On my machine these are in /usr/src/Inline-Java-0.47/Java/classes.

=item 4

Make sure that the classes from step 3 are in the CLASSPATH for all
scripts that need them.

=back

=head2 Adding Constant Interfaces

Since C<Java::Swing> is based on C<Inline::Java> it is inherently a remote
procedure call system.  Among other things this means that only methods
can be called from one language to another.  Constants cannot be seen.
Therefore, if you have constants in an interface, or even in a class,
you must provide methods for these, typically in both java and perl.

To see how to do this, consult C<PerlSwingConstants.java> in the java
directory of the distribution and its pair C<SwingConstants.pm> in
the Swing directory.

There is not currently an automated way to build these wrappers.

=head2 EXPORT

None.

=head1 SEE ALSO

The documentation above is, of course, incomplete.  It gives you the
spirit of using the kit.  The real documentation is the official
Java documentation for the version of the jdk you have installed.

Particular Java::Swing:: modules may have additional Perl specific
documentation.  See the Swing directory for these modules.

Questions about this module may be addressed to the author or posted to
the Inline mailing list to which the author and other interested parties
subscribe.

=head1 AUTHOR

Phil Crow, E<lt>philcrow2000@yahoo.comE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Philip Crow

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl 5.8.0 itself. 

=cut

__DATA__
__Java__
import org.perl.inline.java.*;

public class Swinger extends InlineJavaPerlCaller {
    public Swinger() throws InlineJavaException {}
}
