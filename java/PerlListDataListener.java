import javax.swing.event.ListDataListener;
import org.perl.inline.java.*;

public class      PerlListDataListener
       extends    InlineJavaPerlCaller
       implements ListDataListener
{
    String sender;
    String callbacks;

    public PerlListDataListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void intervalAdded(javax.swing.event.ListDataEvent event)  {
        try {
            CallPerl(
                "Java::Swing::ListDataListener",
                "_ListDataListener",
                new Object[] {sender, callbacks, "intervalAdded", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void intervalRemoved(javax.swing.event.ListDataEvent event)  {
        try {
            CallPerl(
                "Java::Swing::ListDataListener",
                "_ListDataListener",
                new Object[] {sender, callbacks, "intervalRemoved", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void contentsChanged(javax.swing.event.ListDataEvent event)  {
        try {
            CallPerl(
                "Java::Swing::ListDataListener",
                "_ListDataListener",
                new Object[] {sender, callbacks, "contentsChanged", event}
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
