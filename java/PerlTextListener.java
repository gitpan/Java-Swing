import java.awt.event.TextListener;
import org.perl.inline.java.*;

public class      PerlTextListener
       extends    InlineJavaPerlCaller
       implements TextListener
{
    String sender;
    String callbacks;

    public PerlTextListener() throws InlineJavaException { }

    public PerlTextListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void textValueChanged(java.awt.event.TextEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "textValueChanged", event}
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
