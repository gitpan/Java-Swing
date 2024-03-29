package Java::Swing::PerlRealLocalPackages;
use strict; use warnings;

# This is the place to list packages that are not in PerlRealPackages.pm.
# Real packages actually have a .pm file on the disk.  If you don't
# need anything special, you can probably use PerlFakeLocalPackages.pm,
# then Swing.pm will manufacture a module for you.
# The same ideas apply, namely:

# Note that package names are not prefaced by Java::Swing.  This
# it for user convenience.  Do store them in Java/Swing/Name.pm,
# but list the package as Name.  All names should be Swing class names.
# In the rare event of name conflicts, resolve them for your users
# here.  For example, suppose there were two classes named
# javax.swing.Phil and java.awt.Phil, in the list below call one
# swing::Phil and the other awt::Phil.  Then store them in
# Java/Swing/swing/Phil.pm and Java/Swing/awt/Phil.pm.

our @local_packages = qw(
);

1;
