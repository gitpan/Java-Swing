package BorderLayout;
use strict; use warnings;

use Carp;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['java.awt.BorderLayout'];

sub new {
    my $class = shift;

    # if we were passed a hash reference, construct a default object, then
    # call set on each hash key with the value
    if (ref($_[0]) =~ /HASH/) {
        my $attributes = shift;
        my $retval     = BorderLayout::java::awt::BorderLayout->new();
        foreach my $attribute (keys %{$attributes}) {
            my $setter = "set" . ucfirst($attribute);
            eval { $retval->$setter($attributes->{$attribute}); };
            if ($@) {
                croak "Error: '$attribute' is not an attribute of $class";
            }
        }
        return $retval;
    }
    else {
        return BorderLayout::java::awt::BorderLayout->new(@_);
    }
}

1;
