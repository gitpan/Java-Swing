import java.awt.event.ContainerListener;
import org.perl.inline.java.*;

public class      PerlContainerListener
       extends    InlineJavaPerlCaller
       implements ContainerListener
{
    String sender;
    String callbacks;

    public PerlContainerListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void componentAdded(java.awt.event.ContainerEvent event) {
        try {
            CallPerl(
                "Java::Swing::ContainerListener",
                "_ContainerListener",
                new Object[] {sender, callbacks, "componentAdded", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void componentRemoved(java.awt.event.ContainerEvent event) {
        try {
            CallPerl(
                "Java::Swing::ContainerListener",
                "_ContainerListener",
                new Object[] {sender, callbacks, "componentRemoved", event}
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
