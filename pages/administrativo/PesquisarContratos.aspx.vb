
Imports Camadas.Dominio
Imports Excecoes
Imports Fachada
Imports Infraestrutura
Imports MySql.Data.MySqlClient

Partial Class pages_administrativo_PesquisarContratos
    Inherits System.Web.UI.Page

    Private fachada As New FachadaAnasCred
    Private usuario As New Usuario

    Protected Sub btnPesquisar_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim f As New Faturamento

        Try
            f.Cliente.Nome = Me.txtNome.Text
            f.Cliente.Cpf = Me.txtCpf.Text
            f.Cliente.Rg = Me.txtRG.Text

            Me.gvCliente.DataSource = fachada.listarFaturamento(f)
            Me.gvCliente.DataBind()

            If Me.gvCliente.Rows.Count > 0 Then
                lblNaoDados.Visible = False
            Else
                lblNaoDados.Visible = True
            End If

        Catch ex As BusinessException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As MySqlException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        End Try

    End Sub

    Protected Sub btnNovoPaciente_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovoPaciente.Click
        Response.Redirect("~/pages/administrativo/CadastrarContrato.aspx")
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

            Me.txtNome.Attributes.Add("onkeypress", "return ValidarEntrada(event, '3')")
            Me.txtCpf.Attributes.Add("onKeyPress", "return Mascara(event,this,'###.###.###-##')")
            Me.txtRG.Attributes.Add("onkeypress", "return ValidarEntrada(event, '1')")

        End If

    End Sub

    Protected Sub gvCliente_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvCliente.PageIndexChanging
        gvCliente.PageIndex = e.NewPageIndex
        btnPesquisar_Click(Nothing, Nothing)
    End Sub

    Protected Sub gvCliente_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCliente.RowCommand
        If e.CommandName = "Edit" Then
            Session("editarcontrato") = True
            Session("idContrato") = e.CommandArgument.ToString
            Response.Redirect("~/pages/administrativo/CadastrarContrato.aspx?id=" & e.CommandArgument.ToString)
        ElseIf e.CommandName = "Delete" Then
            'ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('DESEJA REALMENTE EXCLUIR O CONTRATO?');", True)
        End If
    End Sub

    Protected Sub gvCliente_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles gvCliente.RowDeleting
        Dim f As Faturamento

        Try
            f = New Faturamento
            f.Codigo = gvCliente.DataKeys(e.RowIndex).Value
            f.Cliente.Nome = gvCliente.Rows(e.RowIndex).Cells(1).Text
            f.ValorCredito = gvCliente.Rows(e.RowIndex).Cells(4).Text
            fachada.excluirFaturamento(f)
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('CONTRATO EXCLUÍDO COM SUCESSO!');", True)

            btnPesquisar_Click(Nothing, Nothing)
        Catch ex As BusinessException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As MySqlException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO BUSCAR OS DADOS >>> " & ex.Message & """);", True)
        End Try

    End Sub
End Class
