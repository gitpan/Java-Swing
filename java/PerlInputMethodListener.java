import java.awt.event.InputMethodListener;
import org.perl.inline.java.*;

public class      PerlInputMethodListener
       extends    InlineJavaPerlCaller
       implements InputMethodListener
{
    String sender;
    String callbacks;

    public PerlInputMethodListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void inputMethodTextChanged(java.awt.event.InputMethodEvent event) {
        try {
            CallPerl(
                "Java::Swing::InputMethodListener",
                "_InputMethodListener",
                new Object[] {sender, callbacks, "inputMethodTextChanged", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void caretPositionChanged(java.awt.event.InputMethodEvent event) {
        try {
            CallPerl(
                "Java::Swing::InputMethodListener",
                "_InputMethodListener",
                new Object[] {sender, callbacks, "caretPositionChanged", event}
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
