import java.awt.dnd.DragGestureListener;
import org.perl.inline.java.*;

public class      PerlDragGestureListener
       extends    InlineJavaPerlCaller
       implements DragGestureListener
{
    String sender;
    String callbacks;

    public PerlDragGestureListener() throws InlineJavaException { }

    public PerlDragGestureListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void dragGestureRecognized(java.awt.dnd.DragGestureEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "dragGestureRecognized", event}
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
