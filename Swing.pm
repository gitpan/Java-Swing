package Java::Swing;
use strict; use warnings;

use Inline Java => 'DATA';

our $VERSION = '0.03';
my %callbacks;

BEGIN {
    # To add packages to the Java::Swing scheme, see PerlLocalPackages.pm.

    use Java::Swing::PerlPackages;
    use Java::Swing::PerlLocalPackages;
    foreach my $package (
        @Java::Swing::PerlPackages::packages,
        @Java::Swing::PerlLocalPackages::local_packages,
    ) {
        no strict;
        *{"$package\::AUTOLOAD"} = \&module_autoload;
    }
}

sub module_autoload {
    my $invocant = $_[0];
    my $command  = our $AUTOLOAD;
    my $required = "Java/Swing/$invocant.pm";

    require $required;

    goto &$command;
}

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

sub connect {
    my $invocant         = shift;  # not used
    my $listener_type    = shift;
    my $sender           = shift;
    my $callbacks        = shift;
    my $listener_package = "Java::Swing::$listener_type";

    require "Java/Swing/$listener_type.pm";

    $listener_package->connect($sender, $callbacks);
}

sub disconnect {
    my $invocant         = shift;  # not used
    my $listener_type    = shift;
    my $sender           = shift;
    my $callbacks        = shift;
    my $listener_package = "Java::Swing::$listener_type";

    $listener_package->disconnect($sender, $callbacks);
}

1;

=head1 NAME

Java::Swing - Perl extension providing direct access to the Java Swing API

=head1 SYNOPSIS

  BEGIN { $ENV{CLASSPATH} .= ':java'; }

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

  This package provides direct access to the Java Swing toolkit from Perl.
  It is similar in spirit to Gtk2 (from CPAN).  You need to install Inline
  and Inline::Java before using it.

=head1 DESCRIPTION

Though you can write a Java program which is driven by Perl, some people
may prefer to keep their Perl pure.  This package lets you do that in manner
similar to the way Perl/Tk and Gtk2:: provide access to their underlying C
libraries.  This lets us code in our favorite language, while using the
graphical interface capabilities of Java Swing.  Swing is advantageous
since it is highly platform independent.

=head1 EXAMPLE

In the example directory of the distribution there are two examples that
differ by only one character.  The unix version uses : for the classpath
separator, win32 uses ;.  The unix version is below, for no particular
reason.  Comments are interspersed.  To see the uninterrupted version,
look for example/calc.*.

    #!/usr/bin/perl
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
for each widget so you can refer to them directly as shown immediately below.

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

But, if you like, you may also used Java::Swing named attribute construction,
as shown for the second JTextField above.  Simply supply a hash reference
whose keys are attributes of the widget with the proper values.  Your object
will be constructed by calling the empty argument constructor.  Then the
attribute values will be supplied by calling set accessors.  So columns => 10
will translate into setColumns(10).

    $south_panel->add(JLabel->new("Answer:"), "West"  );
    $south_panel->add($answer,                "Center");
    $south_panel->add($submit,                "East"  );

    $root_pane->add($expression,  "North");
    $root_pane->add($south_panel, "South");

    $frame->setSize(300, 100);
    $frame->show();

These lines perform widget layout.  If you are not familiar with layouts in
Java Swing (which has the same scheme as awt), consult a book (O'Reilly
has more than one that will do, try the Java Foundation Classes Nutshell
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
calling stop on you Java::Swing object.  Here that happens when the user
closes the window.

=head1 EXTENDING

While I have tried to provide all the Swing you will ever need, there
are inevitably some things I have not gotten to.  Further, you may have
in house code which you would like to incoroprate into this scheme.
This section explains the pieces needed to use other code as part of
Java::Swing.

=head2 Adding Widgets or Families of Them

While most of the widgets from Swing are implemented, AWT, SWT and other
kits are not implemented (though parts of AWT are).  If you have one
widget to add do the following:

=over 4

=item 1

Make a module in the Java/Swing directory or a subdirectory of it named
for the Java class.

=item 2

Name the package for your new module with the Java class name (don't include
Java::Swing in front)

=item 3

Use the widget_generator program (in the Swing/Generate subdirectory of the
distribution) or follow the plan in any of the standard widgets like
JFrame or JButton.

=item 4

Add your short package name to the list in PerlLocalPackages.pm.

=item 5

If you need an AUTOLOAD in your module, turn warnings off before defining
it.  Swing.pm uses AUTOLOAD to avoid loading all modules at once.  Your
AUTOLOAD will be a redefinition which generates a warning.

=item 6

If the Java class is standard (for some sense of standard), send the module
to me so I can add it to future distributions.

=back

For one widget, the above is easy enough.  If you need to add multiple
widgets (like if you want to implement all of SWT), there is another way.

=over 4

=item 1

Use all_widgets (in the Swing/Generate subdirectory of the distribution).
Provide it with the Java package name (like java.awt), the directory
containing the java source files you want to incorporate, and a directory
where perl modules should be built.

=item 2

After you verify that you have the perl modules of your choosing, copy or
move them into the Swing directory of the distribution, unless you built
them in place in step 1.

=item 3

Update the list of widgets, usually in PerlLocalPackages.pm.

=item 4

If your additions are for common classes, send in the modules.  Then they
might be added to the widget list in PerlPackages.pm and shipped with new
versions of Java::Swing with hearty thanks.

=back

=head2 Adding Listeners

In Java::Swing, events are handled through callbacks to Perl code.  To make
that happen, there are two pieces (1) a Java class which implements the
listener interface and (2) a Perl module which Perl programs use.  These
pieces can be hand coded, but that is a pain (and prone to error).

There are two real possibilities.  Either you have a single listener or
you have several.  In the first case, you can use listener_generator
and listener_mod_generator (the first make the java piece, the second
makes the perl piece).  In the second case, you should use decomp_listeners
followed by all_listeners.  Details follow.

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

The fully qualified name of the listener.

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
and C<listener_mod_generator> with that file as the only command line
argument.  Both of these write to standard out.  Save the resulting files
as C<PerlNameListener.java> and C<NameListener.pm> respectively.  When you
compile the java file, include the Inline classes in the CLASSPATH, these
will be in a directory like 

    /usr/src/Inline-Java-0.47/Java/classes

(During run time, Inline::Java makes sure these are in the CLASSPATH.)

=head3 Families of Listeners

When adding a whole new toolkit (like swt) you need to add all the listeners.
To do this use the following steps (all scripts mentioned are in the
Swing/Generate directory of the distribution):

=over 4

=item 1

Use C<decomp_listeners>, giving it the package name and the directory where
source and class files live.  (If you don't have sources, modify the script.
It doesn't need them, but I'm too lazy to test it in that case.)
The output comes to standard out, store it in a file.

=item 2

Use C<all_listeners>, giving is the name of the file from step one along with
directories for the java and perl pieces.

=item 3

Copy or move the perl pieces into the build or install Swing directory
(unless you gave the proper directory in step 2).

=item 4

Compile the java programs.  Remember to include the Inline::Java classes
in the CLASSPATH for compilation (they are supplied for you at run time).
On my machine these are in /usr/src/Inline-Java-0.47/Java/classes.

=item 5

Make sure that the classes from step 4 are in the CLASSPATH for all
scripts that need them.

=back

=head2 Adding Constant Interfaces

Since C<Java::Swing> is based on C<Inline::Java> it is inherently a remote
procedure call system.  Among other things this means that only methods
can be called from one language to another.  Constants cannot be seen.
Therefore, if you have constants in an interface, or even in a class,
you must provide subs for these, typically in both java and perl.

To see how to do this, consult C<PerlSwingConstants.java> in the java
directory of the distribution and its pair C<SwingConstants.pm> in
the Swing directory.

There is not currently an automated way to build these wrappers.

=head2 EXPORT

None.

=head1 SEE ALSO

The documentation above is, of course, incomplete.  It gives you the
spirit of using the kit.  The real documentation is the Java official
documentation for the version of the jdk you have installed.

Particular Java::Swing:: modules may have additional Perl specific
documentation (though none of mine do, since they were generated).

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
