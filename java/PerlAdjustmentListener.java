import java.awt.event.AdjustmentListener;
import org.perl.inline.java.*;

public class      PerlAdjustmentListener
       extends    InlineJavaPerlCaller
       implements AdjustmentListener
{
    String sender;
    String callbacks;

    public PerlAdjustmentListener() throws InlineJavaException { }

    public PerlAdjustmentListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void adjustmentValueChanged(java.awt.event.AdjustmentEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "adjustmentValueChanged", event}
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
