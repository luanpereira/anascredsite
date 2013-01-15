
Imports Infraestrutura

Partial Class pages_principal_index
    Inherits System.Web.UI.Page

    Private usuario As New Usuario

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '=============================================
        'VERIFICA��O DE SESS�O DE USU�RIO
        '=============================================
        If Session("usuario") Is Nothing Then
            Response.Redirect(Utils.UrlPaginaLoginComErro())
        Else
            usuario = CType(Session("usuario"), Usuario)
        End If
        '=============================================
    End Sub
End Class
