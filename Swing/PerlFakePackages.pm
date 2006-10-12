package Java::Swing::PerlFakePackages;
use strict; use warnings;
    
# See PerlRealPackages for instructions on this file.
# Summary: list java classes in your normal class path that Swing will
# fabricate a wrapper around.  Normally, you should do that in
# PerlFakeLocalPackages, then you don't have to worry about changes
# being overwritten.

our %names = (
    ActionListener           => 'java.awt.event',
    AdjustmentListener       => 'java.awt.event',
    AncestorListener         => 'javax.swing.event',
    AWTEventListener         => 'java.awt.event',
    BorderLayout             => 'java.awt',
    CardLayout               => 'java.awt',
    CaretListener            => 'javax.swing.event',
    CellEditorListener       => 'javax.swing.event',
    ChangeListener           => 'javax.swing.event',
    ComponentListener        => 'java.awt.event',
    ContainerListener        => 'java.awt.event',
    DocumentListener         => 'javax.swing.event',
    DragGestureListener      => 'java.awt.dnd',
    DragSourceListener       => 'java.awt.dnd',
    DragSourceMotionListener => 'java.awt.dnd',
    DropTargetListener       => 'java.awt.dnd',
    FlowLayout               => 'java.awt',
    FocusListener            => 'java.awt.event',
    GridBagLayout            => 'java.awt',
    GridLayout               => 'java.awt',
    HierarchyBoundsListener  => 'javax.swing.event',
    HierarchyListener        => 'javax.swing.event',
    HyperlinkListener        => 'javax.swing.event',
    InputMethodListener      => 'javax.swing.event',
    InternalFrameListener    => 'javax.swing.event',
    ItemListener             => 'java.awt.event',
    KeyListener              => 'java.awt.event',
    ListDataListener         => 'javax.swing.event',
    ListSelectionListener    => 'javax.swing.event',
    MenuDragMouseListener    => 'javax.swing.event',
    MenuKeyListener          => 'javax.swing.event',
    MenuListener             => 'javax.swing.event',
    MouseListener            => 'java.awt.event',
    MouseMotionListener      => 'java.awt.event',
    PopupMenuListener        => 'java.awt.event',
    TableColumnModelListener => 'javax.swing.event',
    TableModelListener       => 'javax.swing.event',
    TextListener             => 'java.awt.event',
    TreeExpansionListener    => 'javax.swing.event',
    TreeModelListener        => 'javax.swing.event',
    TreeSelectionListener    => 'javax.swing.event',
    WindowFocusListener      => 'javax.swing.event',
    WindowListener           => 'java.awt.event',
    WindowStateListener      => 'javax.swing.event',
);
    
our @packages = qw(
    ActionListener
    ActionMap
    Action
    AdjustmentListener
    AncestorListener
    AncestorNotifier
    Autoscroller
    AWTEventListener
    BorderFactory
    BorderLayout
    BoxLayout
    Box
    ButtonGroup
    CardLayout
    CaretListener
    CellEditorListener
    CellEditor
    CellRendererPane
    ChangeListener
    ComboBoxEditor
    ComponentInputMap
    ComponentListener
    ContainerListener
    DebugGraphicsFilter
    DebugGraphicsInfo
    DebugGraphicsObserver
    DebugGraphics
    DefaultCellEditor
    DefaultDesktopManager
    DefaultFocusManager
    DefaultListCellRenderer
    DelegatingDefaultFocusManager
    DesktopManager
    DocumentListener
    DragGestureListener
    DragSourceListener
    DragSourceMotionListener
    DropTargetListener
    FlowLayout
    FocusListener
    FocusManager
    GraphicsWrapper
    GrayFilter
    GridBagLayout
    GridLayout
    HierarchyBoundsListener
    HierarchyListener
    HyperlinkListener
    Icon
    ImageIcon
    InputMap
    InputMethodListener
    InputVerifier
    InternalFrameListener
    ItemListener
    JButton
    JCheckBoxMenuItem
    JCheckBox
    JColorChooser
    JComboBox
    JComponent
    JDesktopPane
    JDialog
    JEditorPane
    JFileChooser
    JFormattedTextField
    JFrame
    JInternalFrame
    JLabel
    JLayeredPane
    JList
    JMenuBar
    JMenuItem
    JMenu
    JOptionPane
    JPanel
    JPasswordField
    JPopupMenu
    JProgressBar
    JRadioButtonMenuItem
    JRadioButton
    JRootPane
    JScrollBar
    JScrollPane
    JSeparator
    JSlider
    JSpinner
    JSplitPane
    JTabbedPane
    JTable
    JTextArea
    JTextField
    JTextPane
    JToggleButton
    JToolBar
    JToolTip
    JTree
    JViewport
    JWindow
    KeyboardManager
    KeyListener
    KeyStroke
    LayoutComparator
    ListCellRenderer
    ListDataListener
    ListSelectionListener
    LookAndFeel
    MenuDragMouseListener
    MenuElement
    MenuKeyListener
    MenuListener
    MenuSelectionManager
    MouseListener
    MouseMotionListener
    MouseWheelListener
    MultiUIDefaults
    OverlayLayout
    PopupFactory
    PopupMenuListener
    Popup
    ProgressMonitorInputStream
    ProgressMonitor
    Renderer
    RepaintManager
    RootPaneContainer
    Scrollable
    ScrollPaneLayout
    SizeRequirements
    SizeSequence
    SpringLayout
    Spring
    SwingGraphics
    SwingUtilities
    SystemEventQueueUtilities
    TableColumnModelListener
    TableModelListener
    TextListener
    TimerQueue
    ToolTipManager
    TransferHandler
    TreeExpansionListener
    TreeModelListener
    TreeSelectionListener
    UIDefaults
    UIManager
    UndoableEditListener
    ViewportLayout
    WindowFocusListener
    WindowListener
    WindowStateListener
    
    border::BevelBorder
    border::Border
    border::CompoundBorder
    border::EmptyBorder
    border::EtchedBorder
    border::LineBorder
    border::MatteBorder
    border::SoftBevelBorder
    border::TitledBorder
    
    colorchooser::CenterLayout
    colorchooser::ColorChooserComponentFactory
    colorchooser::DefaultHSBChooserPanel
    colorchooser::DefaultPreviewPanel
    colorchooser::DefaultRGBChooserPanel
    colorchooser::DefaultSwatchChooserPanel
    colorchooser::SmartGridLayout
    colorchooser::SyntheticImage
    
    filechooser::FileFilter
    filechooser::FileSystemView
    filechooser::FileView
    
    table::DefaultTableCellRenderer
    table::JTableHeader
    table::TableCellEditor
    table::TableCellRenderer
    table::TableColumn

    text::AsyncBoxView
    text::AttributeSet
    text::BoxView
    text::Caret
    text::ComponentView
    text::CompositeView
    text::DateFormatter
    text::DefaultCaret
    text::DefaultEditorKit
    text::DefaultFormatterFactory
    text::DefaultFormatter
    text::DefaultHighlighter
    text::DefaultStyledDocument
    text::DefaultTextUI
    text::DocumentFilter
    text::Document
    text::EditorKit
    text::ElementIterator
    text::Element
    text::FieldView
    text::FlowView
    text::GapContent
    text::GapVector
    text::GlyphPainter1
    text::GlyphPainter2
    text::GlyphView
    text::Highlighter
    text::html
    text::IconView
    text::InternationalFormatter
    text::JTextComponent
    text::Keymap
    text::LabelView
    text::LayeredHighlighter
    text::LayoutQueue
    text::MaskFormatter
    text::MutableAttributeSet
    text::NavigationFilter
    text::NumberFormatter
    text::ParagraphView
    text::PasswordView
    text::PlainDocument
    text::PlainView
    text::Position
    text::SegmentCache
    text::Segment
    text::SimpleAttributeSet
    text::StateInvariantError
    text::StringContent
    text::StyleContext
    text::StyledDocument
    text::StyledEditorKit
    text::Style
    text::TabableView
    text::TabExpander
    text::TableView
    text::TabSet
    text::TabStop
    text::TextAction
    text::TextLayoutStrategy
    text::Utilities
    text::ViewFactory
    text::View
    text::WrappedPlainView
    text::ZoneView
    
    tree::DefaultMutableTreeNode
    tree::DefaultTreeCellEditor
    tree::DefaultTreeCellRenderer
    tree::FixedHeightLayoutCache
    tree::MutableTreeNode
    tree::RowMapper
    tree::TreeCellEditor
    tree::TreeCellRenderer
    tree::TreeNode
    tree::TreePath
    tree::VariableHeightLayoutCache
    
    undo::CompoundEdit
    undo::StateEditable
    undo::StateEdit
    undo::UndoableEdit
    undo::UndoableEditSupport
    undo::UndoManager

    text::html::AccessibleHTML
    text::html::BlockView
    text::html::BRView
    text::html::CommentView
    text::html::CSSParser
    text::html::CSS
    text::html::EditableView
    text::html::FormView
    text::html::FrameSetView
    text::html::FrameView
    text::html::HiddenTagView
    text::html::HRuleView
    text::html::HTMLDocument
    text::html::HTMLEditorKit
    text::html::HTML
    text::html::HTMLWriter
    text::html::ImageView
    text::html::InlineView
    text::html::IsindexView
    text::html::LineView
    text::html::ListView
    text::html::Map
    text::html::MinimalHTMLWriter
    text::html::MuxingAttributeSet
    text::html::NoFramesView
    text::html::ObjectView
    text::html::Option
    text::html::ParagraphView
    text::html::ResourceLoader
    text::html::StyleSheet
    text::html::TableView
    text::html::TextAreaDocument

    text::html::parser::AttributeList
    text::html::parser::DocumentParser
    text::html::parser::DTD
    text::html::parser::Element
    text::html::parser::Entity
    text::html::parser::ParserDelegator
    text::html::parser::Parser
    text::html::parser::ResourceLoader
    text::html::parser::TagElement
    text::html::parser::TagStack

    text::rtf::MockAttributeSet
    text::rtf::RTFAttribute
    text::rtf::RTFAttributes
    text::rtf::RTFEditorKit
    text::rtf::RTFGenerator
    text::rtf::RTFParser
    text::rtf::RTFReader
);

1;
