package Java::Swing::PerlPackages;
use strict; use warnings;

# Generally, only standard packages should be listed in this file (for
# some definition of standard).  For local packages (the ones you can't
# or won't share), use PerlLocalPackages.pm.  The later ships empty,
# while this file could change with any release.

# Note that package names are not prefaced by Java::Swing.  This
# it for user convenience.  Do store them in Java/Swing/Name.pm,
# but list the package as Name.  All names should be Swing class names.
# In the rare event of name conflicts, resolve them for your users
# here.  For example, suppose there were two classes named
# javax.swing.Phil and java.awt.Phil, in the list below call one
# swing::Phil and the other awt::Phil.  Then store them in
# Java/Swing/swing/Phil.pm and Java/Swing/awt/Phil.pm.

our @packages = qw(
    undo::CompoundEdit
    undo::StateEdit
    undo::StateEditable
    undo::UndoableEdit
    undo::UndoableEditSupport
    undo::UndoManager
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
    text::rtf::MockAttributeSet
    text::rtf::RTFAttribute
    text::rtf::RTFAttributes
    text::rtf::RTFEditorKit
    text::rtf::RTFGenerator
    text::rtf::RTFParser
    text::rtf::RTFReader
    text::html::parser::AttributeList
    text::html::parser::DocumentParser
    text::html::parser::DTD
    text::html::parser::Element
    text::html::parser::Entity
    text::html::parser::Parser
    text::html::parser::ParserDelegator
    text::html::parser::ResourceLoader
    text::html::parser::TagElement
    text::html::parser::TagStack
    text::html::AccessibleHTML
    text::html::BlockView
    text::html::BRView
    text::html::CommentView
    text::html::CSS
    text::html::CSSParser
    text::html::EditableView
    text::html::FormView
    text::html::FrameSetView
    text::html::FrameView
    text::html::HiddenTagView
    text::html::HRuleView
    text::html::HTML
    text::html::HTMLDocument
    text::html::HTMLEditorKit
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
    text::AsyncBoxView
    text::AttributeSet
    text::BoxView
    text::Caret
    text::ComponentView
    text::CompositeView
    text::DateFormatter
    text::DefaultCaret
    text::DefaultEditorKit
    text::DefaultFormatter
    text::DefaultFormatterFactory
    text::DefaultHighlighter
    text::DefaultStyledDocument
    text::DefaultTextUI
    text::Document
    text::DocumentFilter
    text::EditorKit
    text::Element
    text::ElementIterator
    text::FieldView
    text::FlowView
    text::GapContent
    text::GapVector
    text::GlyphPainter1
    text::GlyphPainter2
    text::GlyphView
    text::Highlighter
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
    text::Segment
    text::SegmentCache
    text::SimpleAttributeSet
    text::StateInvariantError
    text::StringContent
    text::Style
    text::StyleContext
    text::StyledDocument
    text::StyledEditorKit
    text::TabableView
    text::TabExpander
    text::TableView
    text::TabSet
    text::TabStop
    text::TextAction
    text::TextLayoutStrategy
    text::Utilities
    text::View
    text::ViewFactory
    text::WrappedPlainView
    text::ZoneView
    table::DefaultTableCellRenderer
    table::JTableHeader
    table::TableCellEditor
    table::TableCellRenderer
    table::TableColumn
    filechooser::FileFilter
    filechooser::FileSystemView
    filechooser::FileView
    colorchooser::CenterLayout
    colorchooser::ColorChooserComponentFactory
    colorchooser::DefaultHSBChooserPanel
    colorchooser::DefaultPreviewPanel
    colorchooser::DefaultRGBChooserPanel
    colorchooser::DefaultSwatchChooserPanel
    colorchooser::SmartGridLayout
    colorchooser::SyntheticImage
    border::BevelBorder
    border::Border
    border::CompoundBorder
    border::EmptyBorder
    border::EtchedBorder
    border::LineBorder
    border::MatteBorder
    border::SoftBevelBorder
    border::TitledBorder
    Action
    ActionMap
    AncestorNotifier
    Autoscroller
    BorderFactory
    Box
    BoxLayout
    ButtonGroup
    CellEditor
    CellRendererPane
    ComboBoxEditor
    ComponentInputMap
    DebugGraphics
    DebugGraphicsFilter
    DebugGraphicsInfo
    DebugGraphicsObserver
    DefaultCellEditor
    DefaultDesktopManager
    DefaultFocusManager
    DefaultListCellRenderer
    DelegatingDefaultFocusManager
    DesktopManager
    FocusManager
    GraphicsWrapper
    GrayFilter
    Icon
    ImageIcon
    InputMap
    InputVerifier
    JButton
    JCheckBox
    JCheckBoxMenuItem
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
    JMenu
    JMenuBar
    JMenuItem
    JOptionPane
    JPanel
    JPasswordField
    JPopupMenu
    JProgressBar
    JRadioButton
    JRadioButtonMenuItem
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
    KeyStroke
    LayoutComparator
    ListCellRenderer
    LookAndFeel
    MenuElement
    MenuSelectionManager
    MultiUIDefaults
    OverlayLayout
    Popup
    PopupFactory
    ProgressMonitor
    ProgressMonitorInputStream
    Renderer
    RepaintManager
    RootPaneContainer
    Scrollable
    ScrollPaneLayout
    SizeRequirements
    SizeSequence
    Spring
    SpringLayout
    SwingGraphics
    SwingUtilities
    SystemEventQueueUtilities
    Timer
    TimerQueue
    ToolTipManager
    TransferHandler
    UIDefaults
    UIManager
    ViewportLayout
    SwingConstants
    Generate::Widget
    PerlLocalPackages
    PerlPackages
    BorderLayout
    CardLayout
    FlowLayout
    GridBagLayout
    GridLayout
    GridBagConstraints
);

1;