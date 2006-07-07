use strict;
use Test::More tests => 5;

BEGIN { $ENV{CLASSPATH} .= 'java'; }

use Java::Swing;

my $label = JLabel->new(
    { text => "Drag Here", horizontalAlignment => SwingConstants->RIGHT }
);

isa_ok(
    $label,
    "Java::Swing::javax::swing::JLabel",
    "named attributes in constructor"
);

is($label->getHorizontalAlignment(), SwingConstants->RIGHT, "attribute set");

#-----------------------------------------------------------------

eval {
    $label = JLabel->new(
        { text => 'label', 8 => 2 }
    );
};

is(
    $@,
    "Error: '8' is not an attribute of JLabel at $0 line 23\n",
    "bad arguments in constructor"
);

#-----------------------------------------------------------------

my $pic = ImageIcon->new();
my $label2 = JLabel->new( { Object => $pic, text => 'caption' } );

isa_ok(
    $label2,
    "Java::Swing::javax::swing::JLabel",
    "object attribute to constructor"
);

is($label2->getText(), 'caption', "non-object attribute set");

