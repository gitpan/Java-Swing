import javax.swing.event.CellEditorListener;
import org.perl.inline.java.*;

public class      PerlCellEditorListener
       extends    InlineJavaPerlCaller
       implements CellEditorListener
{
    String sender;
    String callbacks;

    public PerlCellEditorListener(String sender, String callbacks)
        throws InlineJavaException
    {
        this.sender    = sender;
        this.callbacks = callbacks;
    }

    public void editingStopped(javax.swing.event.ChangeEvent event)  {
        try {
            CallPerl(
                "Java::Swing::CellEditorListener",
                "_CellEditorListener",
                new Object[] {sender, callbacks, "editingStopped", event}
            );
        }
        catch (InlineJavaPerlException ijpe) {
            System.err.println("couldn't call perl ijpe: " + ijpe);
        }
        catch (InlineJavaException ije) {
            System.err.println("couldn't call perl ije: " + ije);
        }
    }
    public void editingCanceled(javax.swing.event.ChangeEvent event)  {
        try {
            CallPerl(
                "Java::Swing::CellEditorListener",
                "_CellEditorListener",
                new Object[] {sender, callbacks, "editingCanceled", event}
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
