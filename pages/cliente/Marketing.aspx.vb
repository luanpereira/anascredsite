
Imports System.Data
Imports Camadas.Dominio
Imports Infraestrutura

Partial Class pages_cliente_Marketing
    Inherits System.Web.UI.Page

    Private fachada As New Fachada.FachadaAnasCred
    Private usuario As New Usuario

    Protected Sub btnImprimir_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim dataIni, dataFin As String
        Dim dtb As DataTable

        Try
            Utils.CampoObrigatorio(Me.txtInicial, Me.txtFinal)

            dataIni = Format(Date.Parse(Me.txtInicial.Text), "yyyy-MM-dd")
            dataFin = Format(Date.Parse(Me.txtFinal.Text), "yyyy-MM-dd")
            dtb = fachada.listaMarkting(Me.drpBanco.SelectedValue, dataIni, dataFin)
            Session("listMarkting") = dtb

            If CType(Session("listMarkting"), DataTable).Rows.Count > 0 Then
                Session("BancoMarkting") = Me.drpBanco.SelectedItem.Text
                Session("PeriodoMarkting") = Me.txtInicial.Text & " - " & Me.txtFinal.Text
                Session("TotalMarkting") = CType(Session("listMarkting"), DataTable).Rows.Count
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "", "IsPopupBlocker(); CriarJanela('" & Me.Page.Request.ApplicationPath & "/pages/relatorio/RelGeral.aspx', '800', '800')", True)
            Else
                Session.Remove("listMarkting")
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('A PESQUISA NÃO RETORNOU DADOS.');", True)
            End If
        Catch ex As CampoObrigatorioException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO >>> " & ex.Message & """);", True)
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '=============================================
        'VERIFICAÇÃO DE SESSÃO DE USUÁRIO
        '=============================================
        If Session("usuario") Is Nothing Then
            Response.Redirect(Utils.UrlPaginaLoginComErro())
        Else
            usuario = CType(Session("usuario"), Usuario)
        End If
        '=============================================

        If Not IsPostBack Then

            Me.txtInicial.Attributes.Add("onKeyPress", "return Mascara(event,this,'##/##/####')")
            Me.txtInicial.Attributes.Add("onBlur", "return ValidarData(this);")
            Me.txtFinal.Attributes.Add("onKeyPress", "return Mascara(event,this,'##/##/####')")
            Me.txtFinal.Attributes.Add("onBlur", "return ValidarData(this);")

            listarBancos()
        End If

    End Sub

    Private Sub listarBancos()
        Dim item As ListItem

        Me.drpBanco.DataSource = Utils.listarBancos()
        Me.drpBanco.DataTextField = "COMPLETO"
        Me.drpBanco.DataValueField = "AC04CODIGO"
        Me.drpBanco.DataBind()

        item = New ListItem
        item.Text = "... Todos os Bancos"
        item.Value = 0
        Me.drpBanco.Items.Add(item)
        Me.drpBanco.SelectedValue = 0

    End Sub

End Class
