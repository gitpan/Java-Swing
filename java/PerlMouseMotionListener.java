import java.awt.event.MouseMotionListener;
import org.perl.inline.java.*;

public class      PerlMouseMotionListener
       extends    InlineJavaPerlCaller
       implements MouseMotionListener
{
    String sender;
    String callbacks;

    public PerlMouseMotionListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void mouseDragged(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseMotionListener",
                "_MouseMotionListener",
                new Object[] {sender, callbacks, "mouseDragged", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void mouseMoved(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseMotionListener",
                "_MouseMotionListener",
                new Object[] {sender, callbacks, "mouseMoved", event}
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
