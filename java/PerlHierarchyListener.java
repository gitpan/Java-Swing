import java.awt.event.HierarchyListener;
import org.perl.inline.java.*;

public class      PerlHierarchyListener
       extends    InlineJavaPerlCaller
       implements HierarchyListener
{
    String sender;
    String callbacks;

    public PerlHierarchyListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void hierarchyChanged(java.awt.event.HierarchyEvent event) {
        try {
            CallPerl(
                "Java::Swing::HierarchyListener",
                "_HierarchyListener",
                new Object[] {sender, callbacks, "hierarchyChanged", event}
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
