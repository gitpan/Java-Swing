import javax.swing.event.TreeExpansionListener;
import org.perl.inline.java.*;

public class      PerlTreeExpansionListener
       extends    InlineJavaPerlCaller
       implements TreeExpansionListener
{
    String sender;
    String callbacks;

    public PerlTreeExpansionListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void treeExpanded(javax.swing.event.TreeExpansionEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeExpansionListener",
                "_TreeExpansionListener",
                new Object[] {sender, callbacks, "treeExpanded", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void treeCollapsed(javax.swing.event.TreeExpansionEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeExpansionListener",
                "_TreeExpansionListener",
                new Object[] {sender, callbacks, "treeCollapsed", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
}
