import javax.swing.event.MenuKeyListener;
import org.perl.inline.java.*;

public class      PerlMenuKeyListener
       extends    InlineJavaPerlCaller
       implements MenuKeyListener
{
    String sender;
    String callbacks;

    public PerlMenuKeyListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void menuKeyTyped(javax.swing.event.MenuKeyEvent event)  {
        try {
            CallPerl(
                "Java::Swing::MenuKeyListener",
                "_MenuKeyListener",
                new Object[] {sender, callbacks, "menuKeyTyped", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void menuKeyPressed(javax.swing.event.MenuKeyEvent event)  {
        try {
            CallPerl(
                "Java::Swing::MenuKeyListener",
                "_MenuKeyListener",
                new Object[] {sender, callbacks, "menuKeyPressed", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void menuKeyReleased(javax.swing.event.MenuKeyEvent event)  {
        try {
            CallPerl(
                "Java::Swing::MenuKeyListener",
                "_MenuKeyListener",
                new Object[] {sender, callbacks, "menuKeyReleased", event}
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
