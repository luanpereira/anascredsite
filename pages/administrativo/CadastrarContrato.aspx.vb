Imports System.Data
Imports Excecoes
Imports Infraestrutura
Imports Camadas.Dominio
Imports MySql.Data.MySqlClient

Partial Class pages_administrativo_CadastrarContrato
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

        If Not IsPostBack Then

            Me.txtCPF.Attributes.Add("onKeyPress", "return Mascara(event,this,'###.###.###-##')")
            Me.txtCPF.Attributes.Add("onBlur", "return ValidaCPF(this);")
            Me.txtDataCred.Attributes.Add("onKeyPress", "return Mascara(event,this,'##/##/####')")
            Me.txtDataCred.Attributes.Add("onBlur", "return ValidarData(this);")
            Me.txtParcelas.Attributes.Add("onkeypress", "return ValidarEntrada(event, '1')")
            Me.txtComissao.Attributes.Add("onkeypress", "return ValidarEntrada(event, '4')")
            Me.txtVlrCred.Attributes.Add("onkeypress", "return ValidarEntrada(event, '4')")
            Me.txtVlrParcela.Attributes.Add("onkeypress", "return ValidarEntrada(event, '4')")

            '------- LISTAR BANCOS ------------------------
            listarBancos()
            '----------------------------------------------

            '--- LISTAR CLIENTE POR CPF -------------------
            If Not Session("CPFCliente") Is Nothing Then
                listarCliente(Session("CPFCliente"))
                Me.txtCPF.Text = Session("CPFCliente")
                Session.Remove("CPFCliente")
            End If
            '----------------------------------------------

            '--- LISTAR CONTRATO POR CÓDIGO ---------------
            If Not Session("editarcontrato") Is Nothing Then
                If Not Request.Params("id") Is Nothing And Request.Params("id").Trim <> "" Then
                    Me.txtCPF.ReadOnly = True
                    Me.btnPesqCli.Enabled = False
                    Session("idContrato") = Request.Params("id")
                    listarContrato(Session("idContrato"))
                    Me.btnNovo.Visible = True
                Else
                    Me.btnNovo.Visible = False
                End If
            Else
                Me.btnNovo.Visible = False
            End If
            '----------------------------------------------

        End If

    End Sub

    Private Sub listarContrato(ByVal id As Integer)
        Dim f As Faturamento

        Try
            f = New Faturamento
            f = fachada.listarFaturamento(id)
            Me.txtCPF.Text = f.Cliente.Cpf
            Me.lblCliente.Text = f.Cliente.Nome
            Session("idcliente") = f.Cliente.Codigo
            Me.lblCliente.PostBackUrl = "~/pages/cliente/CadastrarCliente.aspx?id=" & f.Cliente.Codigo
            Me.txtDataCred.Text = f.DataCredito
            Me.txtVlrCred.Text = String.Format("{0:c2}", Convert.ToDouble(f.ValorCredito))
            Me.txtParcelas.Text = f.QuantidadeParcelas
            Me.txtVlrParcela.Text = String.Format("{0:c2}", Convert.ToDouble(f.ValorParcela))
            Me.txtComissao.Text = f.Comissao
            Me.drpBanco.SelectedValue = f.Banco.Codigo
            Me.txtDataPriParcela.Text = f.DataPrimeiraParcela

            pnlUsu.Visible = True
            lnkUsuario.Text = f.Usuario.Nome

        Catch ex As BusinessException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As MySqlException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        End Try

    End Sub

    Private Sub listarBancos()
        Dim item As ListItem

        Me.drpBanco.DataSource = Utils.listarBancos()
        Me.drpBanco.DataTextField = "COMPLETO"
        Me.drpBanco.DataValueField = "AC04CODIGO"
        Me.drpBanco.DataBind()

        item = New ListItem
        item.Text = "... Selecione o Banco"
        item.Value = 0
        Me.drpBanco.Items.Add(item)
        Me.drpBanco.SelectedValue = 0

    End Sub

    Protected Sub txtCPF_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtCPF.TextChanged

        If Me.txtCPF.Text.Length = "14" Then

            listarCliente(Me.txtCPF.Text)

        End If

    End Sub

    Private Sub listarCliente(ByVal CPF As String)
        Dim dtb As New DataTable
        Dim cliente As Cliente

        Try
            cliente = New Cliente
            cliente.Cpf = CPF

            dtb = fachada.ListarCliente(cliente)

            If dtb.Rows.Count > 0 Then
                Me.lblCliente.Text = dtb.Rows(0).Item("AC01NOME").ToString
                Session("editarcliente") = True
                Session("idcliente") = dtb.Rows(0).Item("AC01CODIGO").ToString
                Me.lblCliente.PostBackUrl = "~/pages/cliente/CadastrarCliente.aspx?id=" & dtb.Rows(0).Item("AC01CODIGO").ToString
            Else
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('CLIENTE NÃO ENCONTRADO.');", True)
                Me.lblCliente.Text = ""
                Me.lblCliente.PostBackUrl = ""
                Session.Remove("editarcliente")
                Session.Remove("idcliente")
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

    Protected Sub btnPesqCli_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("pesqContrato") = True
        Response.Redirect("~/pages/cliente/PesquisarCliente.aspx")
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim c As Faturamento

        Try
            If Session("idcliente") Is Nothing Or Session("idcliente") = 0 Then Throw New BusinessException("CLIENTE NÃO ESPECIFICADO. VERIFIQUE...")

            Utils.CampoObrigatorio(Me.txtCPF, Me.txtDataCred, Me.txtVlrCred, Me.txtParcelas, Me.txtVlrParcela, Me.txtDataPriParcela, Me.txtComissao, Me.drpBanco)

            c = New Faturamento
            c.Cliente.Codigo = Session("idcliente")
            c.DataCredito = Me.txtDataCred.Text
            c.ValorCredito = Me.txtVlrCred.Text
            c.QuantidadeParcelas = Me.txtParcelas.Text
            c.ValorParcela = Me.txtVlrParcela.Text
            c.Comissao = Me.txtComissao.Text
            c.Banco.Codigo = Me.drpBanco.SelectedValue
            c.DataPrimeiraParcela = Me.txtDataPriParcela.Text

            If Session("editarcontrato") = True Then
                c.Codigo = Session("idContrato")
                fachada.atualizarFaturamento(c)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('CONTRATO ATUALIZADO COM SUCESSO!');", True)
            Else
                fachada.cadastrarFaturamento(c)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('CONTRATO CADASTRADO COM SUCESSO!');", True)
                Session.Remove("idcliente")
                Session.Remove("editarcliente")
            End If

        Catch ex As BusinessException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO GRAVAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO GRAVAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As MySqlException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO GRAVAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO GRAVAR OS DADOS >>> " & ex.Message & """);", True)
        End Try

    End Sub

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session.Remove("editarcliente")
        Session.Remove("CPFCliente")
        Session.Remove("idcliente")
        Session.Remove("editarcontrato")
        Response.Redirect("~/pages/administrativo/CadastrarContrato.aspx")
    End Sub
End Class
