Imports System.Data
Imports Camadas.Dominio
Imports Camadas.DAO
Imports Excecoes
Imports Fachada
Imports Infraestrutura
Imports MySql.Data.MySqlClient

Partial Class pages_cliente_CadastrarCliente
    Inherits System.Web.UI.Page

    Private fachada As New FachadaAnasCred
    Private usuario As New Usuario

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
            Me.txtEndereco.Attributes.Add("onkeypress", "return ValidarEntrada(event, '3')")
            Me.txtBairro.Attributes.Add("onkeypress", "return ValidarEntrada(event, '3')")
            Me.txtNome.Attributes.Add("onkeypress", "return ValidarEntrada(event, '3')")
            Me.txtTelCel.Attributes.Add("onKeyPress", "return Mascara(event,this,'## ####-####')")
            Me.txtTelRes.Attributes.Add("onKeyPress", "return Mascara(event,this,'## ####-####')")
            Me.txtTelComercial.Attributes.Add("onKeyPress", "return Mascara(event,this,'## ####-####')")
            Me.txtCEP.Attributes.Add("onKeyPress", "return Mascara(event,this,'#####-###')")
            Me.txtDataNasc.Attributes.Add("onKeyPress", "return Mascara(event,this,'##/##/####')")
            Me.txtDataNasc.Attributes.Add("onBlur", "return ValidarData(this);")
            Me.txtDataEmissao.Attributes.Add("onKeyPress", "return Mascara(event,this,'##/##/####')")
            Me.txtDataEmissao.Attributes.Add("onBlur", "return ValidarData(this);")
            Me.txtCPF.Attributes.Add("onKeyPress", "return Mascara(event,this,'###.###.###-##')")
            Me.txtCPF.Attributes.Add("onBlur", "return ValidaCPF(this);")
            Me.txtRg.Attributes.Add("onkeypress", "return ValidarEntrada(event, '1')")
            Me.txtCargo.Attributes.Add("onkeypress", "return ValidarEntrada(event, '3')")

            listarEstados()
            listarResidencia()
            listarEstadoCivil()
            listarEmpresa()

            If Session("editarcliente") = True Then
                If Not Request.Params("id") Is Nothing And Request.Params("id").Trim <> "" Then
                    Session("idCliente") = Request.Params("id")
                    listarCliente(Session("idCliente"))
                    Me.btnNovo.Visible = True
                Else
                    Me.btnNovo.Visible = False
                End If
            Else
                Me.btnNovo.Visible = False
            End If
        End If

    End Sub

    Private Sub listarResidencia()
        Dim item As ListItem

        Me.drpResidencia.DataSource = Utils.ListarConstante("RESIDENCIA")
        Me.drpResidencia.DataTextField = "ItemDescricao"
        Me.drpResidencia.DataValueField = "Item"
        Me.drpResidencia.DataBind()

        item = New ListItem
        item.Text = "..."
        item.Value = 0
        Me.drpResidencia.Items.Add(item)
        Me.drpResidencia.SelectedValue = 0

    End Sub

    Private Sub listarEstadoCivil()
        Dim item As ListItem

        Me.drpEstCiv.DataSource = Utils.ListarConstante("ESTADO_CIVIL")
        Me.drpEstCiv.DataTextField = "ItemDescricao"
        Me.drpEstCiv.DataValueField = "Item"
        Me.drpEstCiv.DataBind()

        item = New ListItem
        item.Text = "..."
        item.Value = 0
        Me.drpEstCiv.Items.Add(item)
        Me.drpEstCiv.SelectedValue = 0

    End Sub

    Private Sub listarEmpresa()
        Dim item As ListItem

        Me.drpEmpCli.DataSource = Utils.ListarConstante("EMPRESA")
        Me.drpEmpCli.DataTextField = "ItemDescricao"
        Me.drpEmpCli.DataValueField = "Item"
        Me.drpEmpCli.DataBind()

        item = New ListItem
        item.Text = "..."
        item.Value = 0
        Me.drpEmpCli.Items.Add(item)
        Me.drpEmpCli.SelectedValue = 0

    End Sub

    Private Sub listarEstados()
        Dim item As ListItem

        Me.drpUF.DataSource = Utils.ListarEstados()
        Me.drpUF.DataTextField = "AC98SIGLA"
        Me.drpUF.DataValueField = "AC98CODIGO"
        Me.drpUF.DataBind()

        item = New ListItem
        item.Text = "..."
        item.Value = 0
        Me.drpUF.Items.Add(item)
        Me.drpUF.SelectedValue = 0
    End Sub

    Private Sub listarCliente(ByVal id As Integer)
        Dim cli As New Cliente

        Try
            cli = fachada.ListarCliente(id)

            Me.txtNome.Text = cli.Nome
            Me.drpSexo.SelectedValue = cli.Sexo
            Me.txtDataNasc.Text = Format(Date.Parse(cli.DataNascimento), "dd/MM/yyyy")
            Me.drpUF.SelectedValue = cli.Endereco.Uf

            Me.drpCidade.DataSource = Utils.ListarCidades(Me.drpUF.SelectedValue)
            Me.drpCidade.DataTextField = "AC97NOME"
            Me.drpCidade.DataValueField = "AC97CODIGO"
            Me.drpCidade.DataBind()

            Me.drpCidade.SelectedValue = cli.Endereco.Cidade

            Me.txtEndereco.Text = cli.Endereco.Logradouro
            Me.txtBairro.Text = cli.Endereco.Bairro
            Me.txtCEP.Text = cli.Endereco.Cep
            Me.drpResidencia.SelectedValue = cli.Residencia
            Me.txtTelRes.Text = cli.Contato.FoneResidencial
            Me.txtTelCel.Text = cli.Contato.FoneCelular
            Me.txtTelComercial.Text = cli.Contato.FoneComercial
            Me.txtRg.Text = cli.Rg
            Me.txtCPF.Text = cli.Cpf
            Me.drpEstCiv.SelectedValue = cli.EstadoCivil
            Me.drpEmpCli.SelectedValue = cli.EmpresaPagadora
            Me.txtCargo.Text = cli.Cargo
            Me.txtOrgEmissor.Text = cli.OrgaoEmissor
            Me.txtDataEmissao.Text = Format(Date.Parse(cli.DataEmissao), "dd/MM/yyyy")
            Me.txtNIT.Text = cli.NIT
            Me.txtNomeRef1.Text = cli.NomeReferencia1
            Me.txtFoneRef1.Text = cli.FoneReferencia1
            Me.txtNomeRef2.Text = cli.NomeReferencia2
            Me.txtFoneRef2.Text = cli.FoneReferencia2

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

    Protected Sub drpUF_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)

        Me.drpCidade.DataSource = Utils.ListarCidades(Me.drpUF.SelectedValue)
        Me.drpCidade.DataTextField = "AC97NOME"
        Me.drpCidade.DataValueField = "AC97CODIGO"
        Me.drpCidade.DataBind()

    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim c As Cliente

        Try
            Utils.CampoObrigatorio(Me.txtNome, Me.drpSexo, Me.txtDataNasc, Me.txtCPF)

            c = New Cliente
            c.Nome = Me.txtNome.Text
            c.Sexo = Me.drpSexo.SelectedValue
            c.DataNascimento = Me.txtDataNasc.Text
            c.Endereco.Uf = Me.drpUF.SelectedValue
            c.Endereco.Cidade = Me.drpCidade.SelectedValue
            c.Endereco.Logradouro = Me.txtEndereco.Text
            c.Endereco.Bairro = Me.txtBairro.Text
            c.Endereco.Cep = Me.txtCEP.Text
            c.Residencia = Me.drpResidencia.SelectedValue
            c.Contato.FoneResidencial = Me.txtTelRes.Text
            c.Contato.FoneCelular = Me.txtTelCel.Text
            c.Contato.FoneComercial = Me.txtTelComercial.Text
            c.Rg = Me.txtRg.Text
            c.Cpf = Me.txtCPF.Text
            c.EstadoCivil = Me.drpEstCiv.SelectedValue
            c.EmpresaPagadora = Me.drpEmpCli.SelectedValue
            c.Cargo = Me.txtCargo.Text
            c.DataEmissao = Me.txtDataEmissao.Text
            c.OrgaoEmissor = Me.txtOrgEmissor.Text
            c.NIT = Me.txtNIT.Text
            c.NomeReferencia1 = Me.txtNomeRef1.Text
            c.FoneReferencia1 = Me.txtFoneRef1.Text
            c.NomeReferencia2 = Me.txtNomeRef2.Text
            c.FoneReferencia2 = Me.txtFoneRef2.Text

            If Session("editarcliente") = True Then
                c.Codigo = Session("idCliente")
                fachada.atualizarCliente(c)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('CLIENTE ATUALIZADO COM SUCESSO!');", True)
            Else
                fachada.CadastrarCliente(c)
                ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('CLIENTE CADASTRADO COM SUCESSO!');", True)
                Me.btnNovo.Visible = True
            End If

            Session("editarcliente") = True
        Catch ex As BusinessException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO CADASTRAR >>> " & ex.Message & """);", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO CADASTRAR >>> " & ex.Message & """);", True)
        Catch ex As MySqlException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO CADASTRAR >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO CADASTRAR >>> " & ex.Message & """);", True)
        End Try

    End Sub

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("editarcliente") = False
        Response.Redirect("~/pages/cliente/CadastrarCliente.aspx")
    End Sub
End Class
