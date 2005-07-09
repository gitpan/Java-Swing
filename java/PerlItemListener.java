import java.awt.event.ItemListener;
import org.perl.inline.java.*;

public class      PerlItemListener
       extends    InlineJavaPerlCaller
       implements ItemListener
{
    String sender;
    String callbacks;

    public PerlItemListener() throws InlineJavaException { }

    public PerlItemListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void itemStateChanged(java.awt.event.ItemEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "itemStateChanged", event}
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
