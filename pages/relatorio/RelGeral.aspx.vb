
Imports Camadas.Dominio
Imports Infraestrutura

Partial Class pages_relatorio_RelGeral
    Inherits System.Web.UI.Page

    Private fachada As New Fachada.FachadaAnasCred
    Private usuario As New Usuario

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

        Try

            Me.lblData.Text = DateTime.Now
            Me.lblBanco.Text = Session("BancoMarkting")
            Me.lblPeriodo.Text = Session("PeriodoMarkting")
            Me.lblTotReg.Text = Session("TotalMarkting")

            gvCliente.DataSource = Session("listMarkting")
            gvCliente.DataBind()

        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO >>> " & ex.Message & """);", True)
        Finally
            Session.Remove("BancoMarkting")
            Session.Remove("PeriodoMarkting")
            Session.Remove("TotalMarkting")
            Session.Remove("listMarkting")
        End Try

    End Sub
End Class
