import java.awt.event.WindowFocusListener;
import org.perl.inline.java.*;

public class      PerlWindowFocusListener
       extends    InlineJavaPerlCaller
       implements WindowFocusListener
{
    String sender;
    String callbacks;

    public PerlWindowFocusListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void windowGainedFocus(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowFocusListener",
                "_WindowFocusListener",
                new Object[] {sender, callbacks, "windowGainedFocus", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowLostFocus(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowFocusListener",
                "_WindowFocusListener",
                new Object[] {sender, callbacks, "windowLostFocus", event}
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
