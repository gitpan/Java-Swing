import javax.swing.event.HyperlinkListener;
import org.perl.inline.java.*;

public class      PerlHyperlinkListener
       extends    InlineJavaPerlCaller
       implements HyperlinkListener
{
    String sender;
    String callbacks;

    public PerlHyperlinkListener() throws InlineJavaException { }

    public PerlHyperlinkListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void hyperlinkUpdate(javax.swing.event.HyperlinkEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "hyperlinkUpdate", event}
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
