import java.awt.event.WindowListener;
import org.perl.inline.java.*;

public class      PerlWindowListener
       extends    InlineJavaPerlCaller
       implements WindowListener
{
    String sender;
    String callbacks;

    public PerlWindowListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void windowOpened(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowOpened", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowClosing(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowClosing", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowClosed(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowClosed", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowIconified(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowIconified", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowDeiconified(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowDeiconified", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowActivated(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowActivated", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void windowDeactivated(java.awt.event.WindowEvent event) {
        try {
            CallPerl(
                "Java::Swing::WindowListener",
                "_WindowListener",
                new Object[] {sender, callbacks, "windowDeactivated", event}
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
