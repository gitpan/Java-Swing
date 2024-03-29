package GridBagConstraints;
use strict; use warnings;

# This is not a standard module, it was hand modified to directly access
# PerlGridBagConstraints methods without reference to a java package name.

use Carp;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['PerlGridBagConstraints'];

sub new {
    my $class = shift;

    # if we were passed a hash reference, construct a default object, then
    # call set on each hash key with the value
    if (ref($_[0]) =~ /HASH/) {
        my $attributes = shift;
        my $retval     = GridBagConstraints::PerlGridBagConstraints->new();
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
        return GridBagConstraints::PerlGridBagConstraints->new(@_);
    }
}

1;
