import java.awt.event.MouseListener;
import org.perl.inline.java.*;

public class      PerlMouseListener
       extends    InlineJavaPerlCaller
       implements MouseListener
{
    String sender;
    String callbacks;

    public PerlMouseListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void mouseClicked(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseListener",
                "_MouseListener",
                new Object[] {sender, callbacks, "mouseClicked", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void mousePressed(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseListener",
                "_MouseListener",
                new Object[] {sender, callbacks, "mousePressed", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void mouseReleased(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseListener",
                "_MouseListener",
                new Object[] {sender, callbacks, "mouseReleased", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void mouseEntered(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseListener",
                "_MouseListener",
                new Object[] {sender, callbacks, "mouseEntered", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void mouseExited(java.awt.event.MouseEvent event) {
        try {
            CallPerl(
                "Java::Swing::MouseListener",
                "_MouseListener",
                new Object[] {sender, callbacks, "mouseExited", event}
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
