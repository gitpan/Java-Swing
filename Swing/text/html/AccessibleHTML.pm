package text.html.::AccessibleHTML;
use strict; use warnings;

use Carp;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['javax.swing.text.html..AccessibleHTML'];

sub new {
    my $class = shift;

    # if we were passed a hash reference, construct a default object, then
    # call set on each hash key with the value
    if (ref($_[0]) =~ /HASH/) {
        my $attributes = shift;
        my $retval     = text.html.::AccessibleHTML::javax::swing::text::html::::AccessibleHTML->new();
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
        return text.html.::AccessibleHTML::javax::swing::text::html::::AccessibleHTML->new(@_);
    }
}

1;