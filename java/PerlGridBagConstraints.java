import java.awt.GridBagConstraints;
import java.awt.Insets;

public class PerlGridBagConstraints extends GridBagConstraints {

    /* Constants */

    public static int RELATIVE()         { return RELATIVE;         }
    public static int REMAINDER()        { return REMAINDER;        }
    public static int NONE()             { return NONE;             }
    public static int BOTH()             { return BOTH;             }
    public static int HORIZONTAL()       { return HORIZONTAL;       }
    public static int VERTICAL()         { return VERTICAL;         }
    public static int CENTER()           { return CENTER;           }
    public static int NORTH()            { return NORTH;            }
    public static int NORTHEAST()        { return NORTHEAST;        }
    public static int EAST()             { return EAST;             }
    public static int SOUTHEAST()        { return SOUTHEAST;        }
    public static int SOUTH()            { return SOUTH;            }
    public static int SOUTHWEST()        { return SOUTHWEST;        }
    public static int WEST()             { return WEST;             }
    public static int NORTHWEST()        { return NORTHWEST;        }
    public static int PAGE_START()       { return PAGE_START;       }
    public static int PAGE_END()         { return PAGE_END;         }
    public static int LINE_START()       { return LINE_START;       }
    public static int LINE_END()         { return LINE_END;         }
    public static int FIRST_LINE_START() { return FIRST_LINE_START; }
    public static int FIRST_LINE_END()   { return FIRST_LINE_END;   }
    public static int LAST_LINE_START()  { return LAST_LINE_START;  }
    public static int LAST_LINE_END()    { return LAST_LINE_END;    }

    /* attributes */
    public void setGridx     (int    newValue) { gridx      = newValue; }
    public void setGridy     (int    newValue) { gridy      = newValue; }
    public void setGridwidth (int    newValue) { gridwidth  = newValue; }
    public void setGridheight(int    newValue) { gridheight = newValue; }
    public void setWeightx   (double newValue) { weightx    = newValue; }
    public void setWeighty   (double newValue) { weighty    = newValue; }
    public void setAnchor    (int    newValue) { anchor     = newValue; }
    public void setFill      (int    newValue) { fill       = newValue; }
    public void setInsets    (Insets newValue) { insets     = newValue; }
    public void setIpadx     (int    newValue) { ipadx      = newValue; }
    public void setIpady     (int    newValue) { ipady      = newValue; }

    public int    getGridx()      { return gridx;      }
    public int    getGridy()      { return gridy;      }
    public int    getGridwidth()  { return gridwidth;  }
    public int    getGridheight() { return gridheight; }
    public double getWeightx()    { return weightx;    }
    public double getWeighty()    { return weighty;    }
    public int    getAnchor()     { return anchor;     }
    public int    getFill()       { return fill;       }
    public Insets getInsets()     { return insets;     }
    public int    getIpadx()      { return ipadx;      }
    public int    getIpady()      { return ipady;      }

}
