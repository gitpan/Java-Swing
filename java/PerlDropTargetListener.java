import java.awt.dnd.DropTargetListener;
import org.perl.inline.java.*;

public class      PerlDropTargetListener
       extends    InlineJavaPerlCaller
       implements DropTargetListener
{
    String sender;
    String callbacks;

    public PerlDropTargetListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void dragEnter(java.awt.dnd.DropTargetDragEvent event) {
        try {
            CallPerl(
                "Java::Swing::DropTargetListener",
                "_DropTargetListener",
                new Object[] {sender, callbacks, "dragEnter", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void dragOver(java.awt.dnd.DropTargetDragEvent event) {
        try {
            CallPerl(
                "Java::Swing::DropTargetListener",
                "_DropTargetListener",
                new Object[] {sender, callbacks, "dragOver", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void dropActionChanged(java.awt.dnd.DropTargetDragEvent event) {
        try {
            CallPerl(
                "Java::Swing::DropTargetListener",
                "_DropTargetListener",
                new Object[] {sender, callbacks, "dropActionChanged", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void dragExit(java.awt.dnd.DropTargetEvent event) {
        try {
            CallPerl(
                "Java::Swing::DropTargetListener",
                "_DropTargetListener",
                new Object[] {sender, callbacks, "dragExit", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void drop(java.awt.dnd.DropTargetDropEvent event) {
        try {
            CallPerl(
                "Java::Swing::DropTargetListener",
                "_DropTargetListener",
                new Object[] {sender, callbacks, "drop", event}
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
