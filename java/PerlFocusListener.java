import java.awt.event.FocusListener;
import org.perl.inline.java.*;

public class      PerlFocusListener
       extends    InlineJavaPerlCaller
       implements FocusListener
{
    String sender;
    String callbacks;

    public PerlFocusListener() throws InlineJavaException { }

    public PerlFocusListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void focusGained(java.awt.event.FocusEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "focusGained", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void focusLost(java.awt.event.FocusEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "focusLost", event}
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
