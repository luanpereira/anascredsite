
Imports Excecoes
Imports Infraestrutura

Partial Class pages_Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Dim Usuario As New Usuario

        Try

            Utils.CampoObrigatorio(txtLogin, txtSenha)

            Usuario = New Usuario

            'PREENCHE O OBJETO USU�RIO COM OS DADOS DO FORMUL�RIO
            With Usuario
                .Usuario = txtLogin.Text
                .Senha = txtSenha.Text
            End With

            Select Case Usuario.Usuario
                'Case ""
                '    'FAZ NADA
                '    Usuario.Nome = "USU�RIO DE TESTE"
                Case Else
                    If System.Configuration.ConfigurationManager.AppSettings("AMBIENTE").ToString = "P" Then
                        'USU�RIO E SENHA DIGITADOS PELO USU�RIO
                        Seguranca.EfetuarLogin(Usuario)
                    Else
                        Usuario.Codigo = 123
                        Usuario.Nome = "USUARIO DE TESTE"
                    End If
            End Select

            Session("usuario") = Usuario
            Response.Redirect("principal/Index.aspx")

        Catch ex As CampoObrigatorioException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As UsuarioInvalidoException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As DAOException
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        Catch ex As Exception
            ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem(""ERRO AO LISTAR OS DADOS >>> " & ex.Message & """);", True)
        End Try

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then
            If Not Request.Params("e") Is Nothing Then
                If CBool(Request.Params("e")) Then
                    ScriptManager.RegisterStartupScript(Me.Page, Me.GetType, "Mensagem", "Mensagem('VOC� N�O EST� LOGADO OU SUA SESS�O EXPIROU.');", True)
                End If
            End If
        End If

    End Sub
End Class
