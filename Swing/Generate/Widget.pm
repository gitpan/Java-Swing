package Java::Swing::Generate::Widget;
use strict; use warnings;

use Exporter;

our @ISA = ('Exporter');

our @EXPORT = ('generate');

sub generate {
    my $package               = shift;
    my $class                 = shift;
    my $sub_package           = shift;

    my $java_pack_with_dots   = $package;
    my $perl_package          = $class;
    my $java_pack_with_colons = $package;

    if ($sub_package) {
        $java_pack_with_colons .= "\::$sub_package";
        $java_pack_with_dots   .= ".$sub_package";
        $perl_package           = "$sub_package\::$class";
    }

    $java_pack_with_colons    =~ s/\./::/g;

    my $module = << "EOModule";
package $perl_package;
use strict; use warnings;

use Carp;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['$java_pack_with_dots.$class'];

sub new {
    my \$class = shift;

    # if we were passed a hash reference, construct a default object, then
    # call set on each hash key with the value
    if (ref(\$_[0]) =~ /HASH/) {
        my \$attributes = shift;
        my \$retval     = $perl_package\::$java_pack_with_colons\::$class->new();
        foreach my \$attribute (keys %{\$attributes}) {
            my \$setter = "set" . ucfirst(\$attribute);
            eval { \$retval->\$setter(\$attributes->{\$attribute}); };
            if (\$@) {
                croak "Error: '\$attribute' is not an attribute of \$class";
            }
        }
        return \$retval;
    }
    else {
        return $perl_package\::$java_pack_with_colons\::$class->new(\@_);
    }
}

1;
EOModule

    return $module;
}

1;
