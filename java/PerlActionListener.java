import java.awt.event.ActionListener;
import org.perl.inline.java.*;

public class      PerlActionListener
       extends    InlineJavaPerlCaller
       implements ActionListener
{
    String sender;
    String callbacks;

    public PerlActionListener() throws InlineJavaException { }

    public PerlActionListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void actionPerformed(java.awt.event.ActionEvent event) {
        try {
            CallPerl(
                "Java::Swing::ActionListener",
                "_ActionListener",
                new Object[] {sender, callbacks, "actionPerformed", event}
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
