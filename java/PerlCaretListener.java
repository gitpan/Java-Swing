import javax.swing.event.CaretListener;
import org.perl.inline.java.*;

public class      PerlCaretListener
       extends    InlineJavaPerlCaller
       implements CaretListener
{
    String sender;
    String callbacks;

    public PerlCaretListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void caretUpdate(javax.swing.event.CaretEvent event)  {
        try {
            CallPerl(
                "Java::Swing::CaretListener",
                "_CaretListener",
                new Object[] {sender, callbacks, "caretUpdate", event}
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
