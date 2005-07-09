import java.awt.event.AWTEventListener;
import org.perl.inline.java.*;

public class      PerlAWTEventListener
       extends    InlineJavaPerlCaller
       implements AWTEventListener
{
    String sender;
    String callbacks;

    public PerlAWTEventListener() throws InlineJavaException { }

    public PerlAWTEventListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void eventDispatched(java.awt.AWTEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "eventDispatched", event}
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
