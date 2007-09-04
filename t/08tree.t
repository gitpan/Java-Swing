use strict;

use Test::More tests => 1;
BEGIN { $ENV{CLASSPATH} .= 'java'; }
use Java::Swing;

my $top      = tree::DefaultMutableTreeNode->new( "A Series" );
createNodes( $top );
my $tree     = JTree->new( $top );

my $treeView = JScrollPane->new( $tree );

my $frame    = JFrame->new();

my $root     = $frame->getContentPane();

$root->add( $treeView );

$frame->setSize( 200, 300 );
$frame->show();

my $swinger = Java::Swing->new();
$swinger->connect(
    "TreeWillExpandListener", $tree, { treeWillExpand => \&expanded }
);
$swinger->start();

sub createNodes {
    my $top = shift;

    my $category = tree::DefaultMutableTreeNode->new( "Expand Me" );
    $top->add( $category );

    my $book = tree::DefaultMutableTreeNode->new( "A Book" );
    $category->add( $book );

    $book = tree::DefaultMutableTreeNode->new( "Another Book" );
    $category->add( $book );
}

sub expanded {
    pass( 'tree expanded' );
    $swinger->stop();
}
