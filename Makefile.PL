use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'		=> 'Java::Swing',
    'VERSION_FROM'	=> 'lib/Java/Swing.pm',
    'PREREQ_PM'		=> {
        'Test::More'   => 0,
        'Inline'       => 0.44,
        'Inline::Java' => 0.47,
    },
    ($] >= 5.005
        ?
      (ABSTRACT_FROM => 'lib/Java/Swing.pm',
       AUTHOR        => 'Phil Crow <philcrow2000@localdomain>')
        :
      ()
    ),
);
