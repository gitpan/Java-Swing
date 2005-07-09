import java.awt.dnd.DragSourceMotionListener;
import org.perl.inline.java.*;

public class      PerlDragSourceMotionListener
       extends    InlineJavaPerlCaller
       implements DragSourceMotionListener
{
    String sender;
    String callbacks;

    public PerlDragSourceMotionListener() throws InlineJavaException { }

    public PerlDragSourceMotionListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void dragMouseMoved(java.awt.dnd.DragSourceDragEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "dragMouseMoved", event}
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
