import javax.swing.event.TreeWillExpandListener;
import org.perl.inline.java.*;

public class      PerlTreeWillExpandListener
       extends    InlineJavaPerlCaller
       implements TreeWillExpandListener
{
    String sender;
    String callbacks;

    public PerlTreeWillExpandListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void treeWillExpand(javax.swing.event.TreeExpansionEvent event) throws javax.swing.tree.ExpandVetoException {
        try {
            CallPerl(
                "Java::Swing::TreeWillExpandListener",
                "_TreeWillExpandListener",
                new Object[] {sender, callbacks, "treeWillExpand", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void treeWillCollapse(javax.swing.event.TreeExpansionEvent event) throws javax.swing.tree.ExpandVetoException {
        try {
            CallPerl(
                "Java::Swing::TreeWillExpandListener",
                "_TreeWillExpandListener",
                new Object[] {sender, callbacks, "treeWillCollapse", event}
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
