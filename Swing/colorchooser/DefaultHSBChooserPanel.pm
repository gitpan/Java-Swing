package colorchooser.::DefaultHSBChooserPanel;
use strict; use warnings;

use Carp;

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['javax.swing.colorchooser..DefaultHSBChooserPanel'];

sub new {
    my $class = shift;

    # if we were passed a hash reference, construct a default object, then
    # call set on each hash key with the value
    if (ref($_[0]) =~ /HASH/) {
        my $attributes = shift;
        my $retval     = colorchooser.::DefaultHSBChooserPanel::javax::swing::colorchooser::::DefaultHSBChooserPanel->new();
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
        return colorchooser.::DefaultHSBChooserPanel::javax::swing::colorchooser::::DefaultHSBChooserPanel->new(@_);
    }
}

1;
