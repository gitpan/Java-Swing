package Java::Swing::Generate::Listener;
use strict; use warnings;

use Exporter;
our @ISA    = ('Exporter');
our @EXPORT = qw(generate_listener generate_module);

# This package makes Java programs which implement listeners.  Call generate
# with a hash like this:
#{
#    'listener' => 'TreeWillExpandListener',
#    'methods' => [
#        {
#            'name' => 'treeWillExpand',
#            'type' => 'javax.swing.event.TreeExpansionEvent',
#            'throws' => 'javax.swing.tree.ExpandVetoException'
#        },
#        {
#            'name' => 'treeWillCollapse',
#            'type' => 'javax.swing.event.TreeExpansionEvent',
#            'throws' => 'javax.swing.tree.ExpandVetoException'
#        }
#    ],
#    'full_name' => 'javax.swing.event.TreeWillExpandListener'
#}
#
# Alternatively, you can generate a batch of listeners using decomp_listeners
# and all_listeners in this directory.

sub generate_listener {
    my $hash = shift;
    my $retval = generate_imports($hash);
    $retval   .= generate_header($hash);
    foreach my $event (@{$hash->{events}}) {
        $retval .= generate_method($hash, $event);
    }
    $retval .= generate_footer();

    return $retval;
}

sub generate_footer {
    return "}\n";
}

sub generate_imports {
    my $hash = shift;
    my %extras;

    # The first section here was abandoned after I recalled that importing
    # is not necessary when fully qualified names will be used.

    # This will not handle event methods which throw multiple exception types.
    # foreach my $event (@{$hash->{events}}) {
    #     $extras{$event->{type}}++   if defined ($event->{type});
    #     $extras{$event->{throws}}++ if defined ($event->{throws});
    # }
    # my $extra_imports = "";
    # foreach my $extra (keys %extras) {
    #     $extra_imports .= "import $extra;\n";
    # }

    return << "EOIMPORT";
import $hash->{package}.$hash->{name};
import org.perl.inline.java.*;

EOIMPORT
}

sub generate_header {
    my $hash = shift;
    my $name = $hash->{name};

    return << "EODECL";
public class      Perl${name}
       extends    InlineJavaPerlCaller
       implements ${name}
{
    String sender;
    String callbacks;

    public Perl${name}() throws InlineJavaException { }

    public Perl${name}(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

EODECL
}

sub generate_method {
    my $hash          = shift;
    my $event         = shift;
    my $type          = $event->{type};
    my $sub_name      = $hash->{'sub'};
    my $listener      = $hash->{name};
    my $method_name   = $event->{name};
    my $throws_clause = $event->{throws} ? "throws $event->{throws}" : "";

    return << "EOMETHOD";
    public void $method_name($type event) $throws_clause {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "$method_name", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
EOMETHOD
}

sub generate_module {
    my $hash      = shift;
    my $perl_pack = "Java::Swing::$hash->{name}";
    my $listener  = "Perl$hash->{name}";
    my $perl_pack_plus_listener
                  = "$perl_pack\::$listener";
    my $sub_name  = $hash->{'sub'};

    my $retval = << "EOModule";
package $perl_pack;
use strict; use warnings;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['$listener'];

my \%callbacks;
my \%listeners;

sub connect {
    my \$invocant       = shift;  # not used
    my \$sender         = shift;
    my \$callbacks      = shift;
    my \$object_name    = ref \$sender;
    my \$callbacks_name = ref \$callbacks;
    my \$listener       =
        $perl_pack_plus_listener->new(
            \$object_name,
            \$callbacks_name
        );

    \$callbacks{\$object_name}{\$callbacks_name} = \$callbacks;
    \$listeners{\$object_name}{\$callbacks_name} = \$listener;

    no strict;
    \$sender->add$hash->{name}(\$listener);
}

sub disconnect {
    my \$invocant       = shift;  # not used
    my \$sender         = shift;
    my \$callbacks      = shift;
    my \$object_name    = ref \$sender;
    my \$callbacks_name = ref \$callbacks;

    undef \$callbacks{\$object_name}{\$callbacks_name};
    \$sender->remove$hash->{name}(
        \$listeners{\$object_name}{\$callbacks_name}
    );
}

sub $sub_name {
    my \$sender_name      = shift;
    my \$callbacks_name   = shift;
    my \$triggered_method = shift;
    my \$event            = shift;

    my \$methods = \$callbacks{\$sender_name}{\$callbacks_name}
        or die "No registered $sub_name callback for \$sender_name\\n";
    my \$method = \$methods->{\$triggered_method} || sub {};

    no strict;
    \$method->(\$sender, \$event);
}

1;
EOModule
}

1;
