import javax.swing.event.TreeSelectionListener;
import org.perl.inline.java.*;

public class      PerlTreeSelectionListener
       extends    InlineJavaPerlCaller
       implements TreeSelectionListener
{
    String sender;
    String callbacks;

    public PerlTreeSelectionListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void valueChanged(javax.swing.event.TreeSelectionEvent event)  {
        try {
            CallPerl(
                "Java::Swing::TreeSelectionListener",
                "_TreeSelectionListener",
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
