use strict;
use Test::More tests => 3;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $label = JLabel->new(
    { text => "Drag Here", horizontalAlignment => SwingConstants->RIGHT }
);

isa_ok(
    $label,
    "JLabel::javax::swing::JLabel",
    "named attributes in constructor"
);

is($label->getHorizontalAlignment(), SwingConstants->RIGHT, "atribute set");

#-----------------------------------------------------------------

eval {
    $label = JLabel->new(
        { text => 'label', 8 }
    );
};

is(
    $@,
    "Error: '8' is not an attribute of JLabel at $0 line 23\n",
    "bad arguments in constructor"
);
