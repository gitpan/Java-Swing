import javax.swing.event.TreeModelListener;
import org.perl.inline.java.*;

public class      PerlTreeModelListener
       extends    InlineJavaPerlCaller
       implements TreeModelListener
{
    String sender;
    String callbacks;

    public PerlTreeModelListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void treeNodesChanged(javax.swing.event.TreeModelEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeModelListener",
                "_TreeModelListener",
                new Object[] {sender, callbacks, "treeNodesChanged", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void treeNodesInserted(javax.swing.event.TreeModelEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeModelListener",
                "_TreeModelListener",
                new Object[] {sender, callbacks, "treeNodesInserted", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void treeNodesRemoved(javax.swing.event.TreeModelEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeModelListener",
                "_TreeModelListener",
                new Object[] {sender, callbacks, "treeNodesRemoved", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void treeStructureChanged(javax.swing.event.TreeModelEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeModelListener",
                "_TreeModelListener",
                new Object[] {sender, callbacks, "treeStructureChanged", event}
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
