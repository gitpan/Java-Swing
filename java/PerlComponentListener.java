import java.awt.event.ComponentListener;
import org.perl.inline.java.*;

public class      PerlComponentListener
       extends    InlineJavaPerlCaller
       implements ComponentListener
{
    String sender;
    String callbacks;

    public PerlComponentListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void componentResized(java.awt.event.ComponentEvent event) {
        try {
            CallPerl(
                "Java::Swing::ComponentListener",
                "_ComponentListener",
                new Object[] {sender, callbacks, "componentResized", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void componentMoved(java.awt.event.ComponentEvent event) {
        try {
            CallPerl(
                "Java::Swing::ComponentListener",
                "_ComponentListener",
                new Object[] {sender, callbacks, "componentMoved", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void componentShown(java.awt.event.ComponentEvent event) {
        try {
            CallPerl(
                "Java::Swing::ComponentListener",
                "_ComponentListener",
                new Object[] {sender, callbacks, "componentShown", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void componentHidden(java.awt.event.ComponentEvent event) {
        try {
            CallPerl(
                "Java::Swing::ComponentListener",
                "_ComponentListener",
                new Object[] {sender, callbacks, "componentHidden", event}
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
