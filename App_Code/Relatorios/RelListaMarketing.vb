Imports DataDynamics.ActiveReports
Imports DataDynamics.ActiveReports.Document

Public Class RelListaMarketing 
    Inherits DataDynamics.ActiveReports.ActiveReport3

    Public Sub New()
        MyBase.New()

        'This call is required by the Windows Form Designer.
        InitializeComponent()

        'Add any initialization after the InitializeComponent() call
    End Sub

    'Form overrides dispose to clean up the component list.
    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing Then
        End If
        MyBase.Dispose(disposing)
    End Sub
    Private WithEvents picture1 As DataDynamics.ActiveReports.Picture

#Region " ActiveReports Designer generated code "
    'NOTE: The following procedure is required by the ActiveReports Designer
    'It can be modified using the ActiveReports Designer.
    'Do not modify it using the code editor.
    Private WithEvents PageHeader1 As DataDynamics.ActiveReports.PageHeader
    Private WithEvents Detail1 As DataDynamics.ActiveReports.Detail
    Private WithEvents label1 As DataDynamics.ActiveReports.Label
    Private WithEvents txtNome As DataDynamics.ActiveReports.TextBox
    Private WithEvents groupHeader1 As DataDynamics.ActiveReports.GroupHeader
    Private WithEvents groupFooter1 As DataDynamics.ActiveReports.GroupFooter
    Private WithEvents label2 As DataDynamics.ActiveReports.Label
    Private WithEvents line1 As DataDynamics.ActiveReports.Line
    Private WithEvents PageFooter1 As DataDynamics.ActiveReports.PageFooter
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resourceFileName As String = "RelListaMarketing.resx"
        Dim resources As System.Resources.ResourceManager = GetResourceManager()
        Me.PageHeader1 = New DataDynamics.ActiveReports.PageHeader
        Me.picture1 = New DataDynamics.ActiveReports.Picture
        Me.Detail1 = New DataDynamics.ActiveReports.Detail
        Me.PageFooter1 = New DataDynamics.ActiveReports.PageFooter
        Me.groupHeader1 = New DataDynamics.ActiveReports.GroupHeader
        Me.groupFooter1 = New DataDynamics.ActiveReports.GroupFooter
        Me.txtNome = New DataDynamics.ActiveReports.TextBox
        Me.label1 = New DataDynamics.ActiveReports.Label
        Me.label2 = New DataDynamics.ActiveReports.Label
        Me.line1 = New DataDynamics.ActiveReports.Line
        CType(Me.picture1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.txtNome, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.label1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.label2, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'PageHeader1
        '
        Me.PageHeader1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.picture1, Me.label1, Me.line1})
        Me.PageHeader1.Height = 1.229167!
        Me.PageHeader1.Name = "PageHeader1"
        '
        'picture1
        '
        Me.picture1.Border.BottomColor = System.Drawing.Color.Black
        Me.picture1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.picture1.Border.LeftColor = System.Drawing.Color.Black
        Me.picture1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.picture1.Border.RightColor = System.Drawing.Color.Black
        Me.picture1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.picture1.Border.TopColor = System.Drawing.Color.Black
        Me.picture1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.picture1.Height = 1.0625!
        Me.picture1.Image = CType(resources.GetObject("picture1.Image"), System.Drawing.Image)
        Me.picture1.ImageData = CType(resources.GetObject("picture1.ImageData"), System.IO.Stream)
        Me.picture1.Left = 0.25!
        Me.picture1.LineWeight = 0.0!
        Me.picture1.Name = "picture1"
        Me.picture1.SizeMode = DataDynamics.ActiveReports.SizeModes.Zoom
        Me.picture1.Top = 0.0625!
        Me.picture1.Width = 1.4375!
        '
        'Detail1
        '
        Me.Detail1.ColumnSpacing = 0.0!
        Me.Detail1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.txtNome})
        Me.Detail1.Height = 0.1979167!
        Me.Detail1.Name = "Detail1"
        '
        'PageFooter1
        '
        Me.PageFooter1.Height = 0.25!
        Me.PageFooter1.Name = "PageFooter1"
        '
        'groupHeader1
        '
        Me.groupHeader1.Controls.AddRange(New DataDynamics.ActiveReports.ARControl() {Me.label2})
        Me.groupHeader1.Height = 0.3229167!
        Me.groupHeader1.Name = "groupHeader1"
        '
        'groupFooter1
        '
        Me.groupFooter1.Height = 0.01041667!
        Me.groupFooter1.Name = "groupFooter1"
        '
        'txtNome
        '
        Me.txtNome.Border.BottomColor = System.Drawing.Color.Black
        Me.txtNome.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtNome.Border.LeftColor = System.Drawing.Color.Black
        Me.txtNome.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtNome.Border.RightColor = System.Drawing.Color.Black
        Me.txtNome.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.Solid
        Me.txtNome.Border.TopColor = System.Drawing.Color.Black
        Me.txtNome.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.txtNome.DataField = "AC01NOME"
        Me.txtNome.Height = 0.1875!
        Me.txtNome.Left = 0.1875!
        Me.txtNome.Name = "txtNome"
        Me.txtNome.Style = "font-weight: normal; "
        Me.txtNome.Text = "NOME"
        Me.txtNome.Top = 0.0!
        Me.txtNome.Width = 4.25!
        '
        'label1
        '
        Me.label1.Border.BottomColor = System.Drawing.Color.Black
        Me.label1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.label1.Border.LeftColor = System.Drawing.Color.Black
        Me.label1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.label1.Border.RightColor = System.Drawing.Color.Black
        Me.label1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.label1.Border.TopColor = System.Drawing.Color.Black
        Me.label1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.label1.Height = 0.3125!
        Me.label1.HyperLink = Nothing
        Me.label1.Left = 2.0625!
        Me.label1.Name = "label1"
        Me.label1.Style = "ddo-char-set: 0; font-weight: bold; font-size: 18pt; "
        Me.label1.Text = "ANASCRED - SEU CRÉDITO FÁCIL"
        Me.label1.Top = 0.125!
        Me.label1.Width = 4.3125!
        '
        'label2
        '
        Me.label2.Border.BottomColor = System.Drawing.Color.Black
        Me.label2.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.ExtraThickSolid
        Me.label2.Border.LeftColor = System.Drawing.Color.Black
        Me.label2.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.ExtraThickSolid
        Me.label2.Border.RightColor = System.Drawing.Color.Black
        Me.label2.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.ExtraThickSolid
        Me.label2.Border.TopColor = System.Drawing.Color.Black
        Me.label2.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.ExtraThickSolid
        Me.label2.Height = 0.25!
        Me.label2.HyperLink = Nothing
        Me.label2.Left = 0.1875!
        Me.label2.Name = "label2"
        Me.label2.Style = "font-weight: bold; background-color: DarkGray; "
        Me.label2.Text = "NOME"
        Me.label2.Top = 0.0625!
        Me.label2.Width = 4.25!
        '
        'line1
        '
        Me.line1.Border.BottomColor = System.Drawing.Color.Black
        Me.line1.Border.BottomStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.line1.Border.LeftColor = System.Drawing.Color.Black
        Me.line1.Border.LeftStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.line1.Border.RightColor = System.Drawing.Color.Black
        Me.line1.Border.RightStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.line1.Border.TopColor = System.Drawing.Color.Black
        Me.line1.Border.TopStyle = DataDynamics.ActiveReports.BorderLineStyle.None
        Me.line1.Height = 0.0!
        Me.line1.Left = 0.0625!
        Me.line1.LineWeight = 1.0!
        Me.line1.Name = "line1"
        Me.line1.Top = 1.1875!
        Me.line1.Width = 8.3125!
        Me.line1.X1 = 0.0625!
        Me.line1.X2 = 8.375!
        Me.line1.Y1 = 1.1875!
        Me.line1.Y2 = 1.1875!
        '
        'RelListaMarketing
        '
        Me.MasterReport = False
        Me.PageSettings.PaperHeight = 11.69!
        Me.PageSettings.PaperWidth = 8.27!
        Me.PrintWidth = 8.4375!
        Me.Sections.Add(Me.PageHeader1)
        Me.Sections.Add(Me.groupHeader1)
        Me.Sections.Add(Me.Detail1)
        Me.Sections.Add(Me.groupFooter1)
        Me.Sections.Add(Me.PageFooter1)
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-family: Arial; font-style: normal; text-decoration: none; font-weight: norma" & _
                    "l; font-size: 10pt; color: Black; ", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-size: 16pt; font-weight: bold; ", "Heading1", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-family: Times New Roman; font-size: 14pt; font-weight: bold; font-style: ita" & _
                    "lic; ", "Heading2", "Normal"))
        Me.StyleSheet.Add(New DDCssLib.StyleSheetRule("font-size: 13pt; font-weight: bold; ", "Heading3", "Normal"))
        CType(Me.picture1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.txtNome, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.label1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.label2, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
#End Region

    Private Function GetResourceManager() As System.Resources.ResourceManager
        Return Resources.RelListaMarketing.ResourceManager

    End Function
End Class
