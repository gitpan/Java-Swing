import java.awt.event.WindowStateListener;
import org.perl.inline.java.*;

public class      PerlWindowStateListener
       extends    InlineJavaPerlCaller
       implements WindowStateListener
{
    String sender;
    String callbacks;

    public PerlWindowStateListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void windowStateChanged(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowStateListener",
                "_WindowStateListener",
                new Object[] {sender, callbacks, "windowStateChanged", event}
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
