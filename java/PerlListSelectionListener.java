import javax.swing.event.ListSelectionListener;
import org.perl.inline.java.*;

public class      PerlListSelectionListener
       extends    InlineJavaPerlCaller
       implements ListSelectionListener
{
    String sender;
    String callbacks;

    public PerlListSelectionListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void valueChanged(javax.swing.event.ListSelectionEvent event)  {
        try {
            CallPerl(
                "Java::Swing::ListSelectionListener",
                "_ListSelectionListener",
                new Object[] {sender, callbacks, "valueChanged", event}
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
