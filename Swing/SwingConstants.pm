package SwingConstants;
use strict; use warnings;

# Unlike most of the files in this directory, this one was hand coded.

use Inline Java      => 'STUDY',
           AUTOSTUDY => 1,
           STUDY     => ['PerlSwingConstants'];

sub CENTER     { return SwingConstants::PerlSwingConstants->CENTER;     }
sub TOP        { return SwingConstants::PerlSwingConstants->TOP;        }
sub LEFT       { return SwingConstants::PerlSwingConstants->LEFT;       }
sub BOTTOM     { return SwingConstants::PerlSwingConstants->BOTTOM;     }
sub RIGHT      { return SwingConstants::PerlSwingConstants->RIGHT;      }
sub NORTH      { return SwingConstants::PerlSwingConstants->NORTH;      }
sub NORTH_EAST { return SwingConstants::PerlSwingConstants->NORTH_EAST; }
sub EAST       { return SwingConstants::PerlSwingConstants->EAST;       }
sub SOUTH_EAST { return SwingConstants::PerlSwingConstants->SOUTH_EAST; }
sub SOUTH      { return SwingConstants::PerlSwingConstants->SOUTH;      }
sub SOUTH_WEST { return SwingConstants::PerlSwingConstants->SOUTH_WEST; }
sub WEST       { return SwingConstants::PerlSwingConstants->WEST;       }
sub NORTH_WEST { return SwingConstants::PerlSwingConstants->NORTH_WEST; }
sub HORIZONTAL { return SwingConstants::PerlSwingConstants->HORIZONTAL; }
sub VERTICAL   { return SwingConstants::PerlSwingConstants->VERTICAL;   }
sub LEADING    { return SwingConstants::PerlSwingConstants->LEADING;    }
sub TRAILING   { return SwingConstants::PerlSwingConstants->TRAILING;   }
sub NEXT       { return SwingConstants::PerlSwingConstants->NEXT;       }
sub PREVIOUS   { return SwingConstants::PerlSwingConstants->PREVIOUS;   }

1;
