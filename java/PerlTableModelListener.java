import javax.swing.event.TableModelListener;
import org.perl.inline.java.*;

public class      PerlTableModelListener
       extends    InlineJavaPerlCaller
       implements TableModelListener
{
    String sender;
    String callbacks;

    public PerlTableModelListener() throws InlineJavaException { }

    public PerlTableModelListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void setSender   (String sender)    { this.sender    = sender; }
    public void setCallbacks(String callbacks) { this.callbacks = callbacks; }

    public void tableChanged(javax.swing.event.TableModelEvent event)  {
        try {
            CallPerl(
                "Java::Swing",
                "_Listener",
                new Object[] {sender, callbacks, "tableChanged", event}
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
