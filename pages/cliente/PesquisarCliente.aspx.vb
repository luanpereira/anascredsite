Imports Camadas.Dominio
Imports System.Data
Imports Excecoes
Imports Fachada
Imports Infraestrutura
Imports MySql.Data.MySqlClient

Partial Class pages_cliente_PesquisarCliente
    Inherits System.Web.UI.Page

    Private fachada As New FachadaAnasCred

    Private usuario As New Usuario

    Protected Sub btnNovoPaciente_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("editarcliente") = False
        Response.Redirect("~/pages/cliente/CadastrarCliente.aspx")
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        '=============================================
        'VERIFICAÇÃO DE SESSÃO DE USUÁRIO
        '=============================================
        If Session("usuario") Is Nothing Then
            Response.Redirect(Utils.UrlPaginaLoginComErro())
        Else
            Usuario = CType(Session("usuario"), Usuario)
        End If
        '=============================================

        If Not IsPostBack Then

            Me.txtNome.Attributes.Add("onkeypress", "return ValidarEntrada(event, '3')")
            Me.txtCpf.Attributes.Add("onKeyPress", "return Mascara(event,this,'###.###.###-##')")
            Me.txtRG.Attributes.Add("onkeypress", "return ValidarEntrada(event, '1')")

            If Session("pesqContrato") = True Then
                Me.btnNovoPaciente.Visible = False
            End If

        End If

    End Sub

    Protected Sub btnPesquisar_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim cliente As Cliente

        Try
            cliente = New Cliente
            cliente.Nome = Me.txtNome.Text
            cliente.Cpf = Me.txtCpf.Text
            cliente.Rg = Me.txtRG.Text

            gvCliente.DataSource = fachada.ListarCliente(cliente)
            gvCliente.DataBind()

            If gvCliente.Rows.Count > 0 Then
                lblNaoDados.Visible = False
            Else
                lblNaoDados.Visible = True
            End If

        Catch ex As BusinessException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('ERRO AO BUSCAR OS DADOS >>> " & ex.Message & "');", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('ERRO AO BUSCAR OS DADOS >>> " & ex.Message & "');", True)
        Catch ex As MySqlException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('ERRO AO BUSCAR OS DADOS >>> " & ex.Message & "');", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('ERRO AO BUSCAR OS DADOS >>> " & ex.Message & "');", True)
        End Try
    End Sub

    Protected Sub gvCliente_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles gvCliente.PageIndexChanging
        gvCliente.PageIndex = e.NewPageIndex
        btnPesquisar_Click(Nothing, Nothing)
    End Sub

    Protected Sub gvCliente_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvCliente.RowCommand

        If e.CommandName = "Edit" Then
            If Session("pesqContrato") Is Nothing Or Session("pesqContrato") = False Then
                Session("editarcliente") = True
                Session("idCliente") = e.CommandArgument.ToString
                Response.Redirect("~/pages/cliente/CadastrarCliente.aspx?id=" & e.CommandArgument.ToString)
            End If
        ElseIf e.CommandName = "Select" Then
            If Session("pesqContrato") = True Then
                Me.btnNovoPaciente.Visible = False
                Me.btnContrato.Visible = True
            End If
        End If

    End Sub

    Protected Sub btnContrato_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("CPFCliente") = gvCliente.Rows(gvCliente.SelectedIndex).Cells(3).Text
        Response.Redirect("~/pages/administrativo/CadastrarContrato.aspx")
    End Sub
End Class
