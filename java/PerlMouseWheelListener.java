import java.awt.event.MouseWheelListener;
import org.perl.inline.java.*;

public class      PerlMouseWheelListener
       extends    InlineJavaPerlCaller
       implements MouseWheelListener
{
    String sender;
    String callbacks;

    public PerlMouseWheelListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void mouseWheelMoved(java.awt.event.MouseWheelEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseWheelListener",
                "_MouseWheelListener",
                new Object[] {sender, callbacks, "mouseWheelMoved", event}
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
