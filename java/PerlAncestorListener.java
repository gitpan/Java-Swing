import javax.swing.event.AncestorListener;
import org.perl.inline.java.*;

public class      PerlAncestorListener
       extends    InlineJavaPerlCaller
       implements AncestorListener
{
    String sender;
    String callbacks;

    public PerlAncestorListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void ancestorAdded(javax.swing.event.AncestorEvent event)  {
        try {
            CallPerl(
                "Java::Swing::AncestorListener",
                "_AncestorListener",
                new Object[] {sender, callbacks, "ancestorAdded", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void ancestorRemoved(javax.swing.event.AncestorEvent event)  {
        try {
            CallPerl(
                "Java::Swing::AncestorListener",
                "_AncestorListener",
                new Object[] {sender, callbacks, "ancestorRemoved", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void ancestorMoved(javax.swing.event.AncestorEvent event)  {
        try {
            CallPerl(
                "Java::Swing::AncestorListener",
                "_AncestorListener",
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
}
