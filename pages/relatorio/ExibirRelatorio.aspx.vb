
Imports System
Imports Camadas.DAO
Imports Camadas.Dominio
Imports Infraestrutura
Imports Microsoft.Reporting.WebForms

Partial Class pages_relatorio_ExibirRelatorio
    Inherits System.Web.UI.Page

    Private usuario As New Usuario

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dao As IClienteDAO

        '=============================================
        'VERIFICAÇÃO DE SESSÃO DE USUÁRIO
        '=============================================
        If Session("usuario") Is Nothing Then
            Response.Redirect(Utils.UrlPaginaLoginComErro)
        Else
            usuario = CType(Session("usuario"), Usuario)
        End If
        '=============================================

        If Not Request.Params("r") Is Nothing And Request.Params("r") <> "" Then

            Select Case Request.Params("r")
                Case 1
                    '------------------------------------------------------
                    '----   RELATÓRIO DE CLIENTES PARA MARKETING
                    '-----------------------------------------------------
                    Dim rel As New RelListaMarketing
                    Dim c As New Cliente

                    Try
                        dao = DaoFactory.GetClienteDAO
                        c.Nome = ""
                        c.Cpf = ""
                        c.Rg = ""
                        rel.DataSource = dao.ListarCliente(c)

                        WebViewer1.Report = rel
                    Catch ex As Exception
                        Throw ex
                    Finally
                        Session.Remove("Cliente")
                    End Try
            End Select

        End If
    End Sub
End Class
