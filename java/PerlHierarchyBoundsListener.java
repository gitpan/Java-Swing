import java.awt.event.HierarchyBoundsListener;
import org.perl.inline.java.*;

public class      PerlHierarchyBoundsListener
       extends    InlineJavaPerlCaller
       implements HierarchyBoundsListener
{
    String sender;
    String callbacks;

    public PerlHierarchyBoundsListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void ancestorMoved(java.awt.event.HierarchyEvent event) {
        try {
            CallPerl(
                "Java::Swing::HierarchyBoundsListener",
                "_HierarchyBoundsListener",
                new Object[] {sender, callbacks, "ancestorMoved", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void ancestorResized(java.awt.event.HierarchyEvent event) {
        try {
            CallPerl(
                "Java::Swing::HierarchyBoundsListener",
                "_HierarchyBoundsListener",
                new Object[] {sender, callbacks, "ancestorResized", event}
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
