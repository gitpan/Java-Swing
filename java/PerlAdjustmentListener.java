import java.awt.event.AdjustmentListener;
import org.perl.inline.java.*;

public class      PerlAdjustmentListener
       extends    InlineJavaPerlCaller
       implements AdjustmentListener
{
    String sender;
    String callbacks;

    public PerlAdjustmentListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void adjustmentValueChanged(java.awt.event.AdjustmentEvent event) {
        try {
            CallPerl(
                "Java::Swing::AdjustmentListener",
                "_AdjustmentListener",
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
