package Java::Swing::PerlRealPackages;
use strict; use warnings;

# Generally, only standard packages which need special treatment should be
# listed in this file (for some definition of standard).
# For local packages (the ones you can't or won't share), use
# PerlRealLocalPackages.pm.  The later ships empty, while this file could
# change with any release.  If you add something to your local package
# list, please send it in.

# Note that most packages are not really .pm files on the disk, instead
# they are manufactured by Swing.pm.  If you want Swing to manufacture
# something for you, list it in PerlFakeLocalPackages.pm.

# Note that package names are not prefaced by Java::Swing.  This
# it for user convenience.  Do store them in Java/Swing/Name.pm,
# but list the package as Name.  All names should be Swing class names.
# In the rare event of name conflicts, resolve them for your users
# here.  For example, suppose there were two classes named
# javax.swing.Phil and java.awt.Phil, in the list below call one
# swing::Phil and the other awt::Phil.  Then store them in
# Java/Swing/swing/Phil.pm and Java/Swing/awt/Phil.pm.

our @packages = qw(
    Timer
    SwingConstants
    GridBagConstraints
);

1;
