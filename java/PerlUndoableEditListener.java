import javax.swing.event.UndoableEditListener;
import org.perl.inline.java.*;

public class      PerlUndoableEditListener
       extends    InlineJavaPerlCaller
       implements UndoableEditListener
{
    String sender;
    String callbacks;

    public PerlUndoableEditListener() throws InlineJavaException { }

    public PerlUndoableEditListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void undoableEditHappened(javax.swing.event.UndoableEditEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "undoableEditHappened", event}
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
