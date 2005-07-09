import javax.swing.event.CaretListener;
import org.perl.inline.java.*;

public class      PerlCaretListener
       extends    InlineJavaPerlCaller
       implements CaretListener
{
    String sender;
    String callbacks;

    public PerlCaretListener() throws InlineJavaException { }

    public PerlCaretListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void caretUpdate(javax.swing.event.CaretEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "caretUpdate", event}
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
