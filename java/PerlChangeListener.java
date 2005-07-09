import javax.swing.event.ChangeListener;
import org.perl.inline.java.*;

public class      PerlChangeListener
       extends    InlineJavaPerlCaller
       implements ChangeListener
{
    String sender;
    String callbacks;

    public PerlChangeListener() throws InlineJavaException { }

    public PerlChangeListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void stateChanged(javax.swing.event.ChangeEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "stateChanged", event}
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
