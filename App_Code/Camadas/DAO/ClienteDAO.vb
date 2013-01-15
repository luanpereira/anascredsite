Imports Camadas.Dominio
Imports System.Collections.Generic
Imports System.Data
Imports Excecoes
Imports MySql.Data.MySqlClient
Imports Microsoft.VisualBasic
Imports Infraestrutura
Imports Camadas.DAO.Interface
Imports System.Data.OleDb

Namespace Camadas.DAO

    Public Class ClienteDAO
        Implements IClienteDAO

        Private conn As IDbConnection
        Private cmd As IDbCommand
        Private dr As IDataReader
        Private strSql As String
        Private adpt As IDbDataAdapter

        'OBTÉM O USUÁRIO QUE ESTÁ NA SESSÃO
        Private session As HttpSessionState = HttpContext.Current.Session
        Private usuario As Usuario = CType(session("usuario"), Usuario)

        Public Sub New(ByVal _conn As IDbConnection)
            conn = _conn
        End Sub

        Public Sub CadastrarCliente(ByVal c As Cliente) Implements IClienteDAO.CadastrarCliente

            strSql = "  INSERT INTO ac01cliente VALUES(NULL,'"
            strSql += c.Nome & "','" & c.Cpf & "'," & c.Rg & ",'" & c.OrgaoEmissor & "','" & c.DataEmissao & "','"
            strSql += c.DataNascimento & "','" & c.Endereco.Logradouro & "','" & c.Endereco.Bairro & "',"
            strSql += c.Endereco.Cidade & "," & c.Sexo & "," & c.EstadoCivil & "," & c.Residencia & ",'" & c.Endereco.Cep & "','"
            strSql += c.Contato.FoneResidencial & "','" & c.Contato.FoneCelular & "','" & c.Contato.FoneComercial & "','"
            strSql += c.Cargo & "'," & c.EmpresaPagadora & ",'" & c.NIT & "','" & c.NomeReferencia1 & "','"
            strSql += c.FoneReferencia1 & "','" & c.NomeReferencia2 & "','" & c.FoneReferencia2 & "')"

            Try
                cmd = conn.CreateCommand
                cmd.Transaction = DaoFactory.GetCurrentTransaction
                cmd.CommandText = strSql
                cmd.ExecuteNonQuery()

                '===========LOG===========
                Seguranca.GravarLog(usuario, "I", "ac01", strSql)
                '=========================
            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                If ex.Number = 1062 Then
                    Throw New DAOException("CLIENTE COM O CPF JÁ CADASTRADO NO SISTEMA!")
                Else
                    Throw New DAOException(ex.Message)
                End If
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try

        End Sub

        Public Sub atualizarCliente(ByVal c As Cliente) Implements IClienteDAO.atualizarCliente

            strSql = "  UPDATE ac01cliente SET "
            strSql += " AC01NOME='" & c.Nome & "', AC01CPF='" & c.Cpf & "'," & " AC01RG=" & c.Rg & ", AC01ORGEMISSOR='" & c.OrgaoEmissor & "', AC01DATAEMISSAO='" & c.DataEmissao & "',"
            strSql += "AC01DATANASC='" & c.DataNascimento & "', AC01LOGRADOURO='" & c.Endereco.Logradouro & "', AC01BAIRRO='" & c.Endereco.Bairro & "',"
            strSql += "FK0197UFCIDADE=" & c.Endereco.Cidade & ", FK0199SEXO=" & c.Sexo & ", FK0199ESTADOCIVIL=" & c.EstadoCivil & ", FK0199RESIDENCIA=" & c.Residencia & ",AC01CEP='" & c.Endereco.Cep & "',"
            strSql += "AC01FONERES='" & c.Contato.FoneResidencial & "',AC01FONECEL='" & c.Contato.FoneCelular & "',AC01FONECOM='" & c.Contato.FoneComercial & "',"
            strSql += "FK0199PROFISSAO='" & c.Cargo & "',FK0199EMPRESAFONTE=" & c.EmpresaPagadora & ", AC01NIT='" & c.NIT & "', "
            strSql += "AC01NOMEREF1='" & c.NomeReferencia1 & "', AC01FONEREF1='" & c.FoneReferencia1 & "', "
            strSql += "AC01NOMEREF2='" & c.NomeReferencia2 & "', AC01FONEREF2='" & c.FoneReferencia2 & "' "
            strSql += " WHERE AC01CODIGO=" & c.Codigo

            Try
                cmd = conn.CreateCommand
                cmd.Transaction = DaoFactory.GetCurrentTransaction
                cmd.CommandText = strSql
                cmd.ExecuteNonQuery()

                '===========LOG===========
                Seguranca.GravarLog(usuario, "U", "ac01", strSql)
                '=========================
            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try
        End Sub

        Public Function ListarCliente(ByVal Cliente As Cliente) As DataTable Implements IClienteDAO.ListarCliente

            Dim ds As New DataSet

            strSql = " SELECT *, "
            strSql += "       CASE WHEN (SELECT FK9798ESTADO FROM ac97cidade WHERE AC97CODIGO = c.FK0197UFCIDADE ) IS NULL THEN "
            strSql += "                  0 "
            strSql += "         ELSE "
            strSql += "                  (SELECT FK9798ESTADO FROM ac97cidade WHERE AC97CODIGO = c.FK0197UFCIDADE ) "
            strSql += "         END UF "
            strSql += "  FROM ac01cliente AS c"
            strSql += " WHERE 0 = 0"

            If Cliente.Nome.Trim <> "" Then strSql += "   AND c.AC01NOME LIKE '%" & Cliente.Nome & "%' "

            If Cliente.Cpf.Trim <> "" Then strSql += "   AND c.AC01CPF LIKE '%" & Cliente.Cpf.Replace(".", "").Replace("-", "") & "%' "

            If Cliente.Rg.Trim <> "" Then strSql += "   AND c.AC01RG = " & Cliente.Rg

            If Cliente.Codigo <> 0 Then strSql += "   AND c.AC01CODIGO = " & Cliente.Codigo

            strSql += "  ORDER BY c.AC01NOME"

            Try

                adpt = DaoFactory.GetDataAdapter
                cmd = conn.CreateCommand
                cmd.CommandText = strSql
                adpt.SelectCommand = cmd
                adpt.Fill(ds)

                Return ds.Tables(0)

            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try

        End Function

        Public Function ListarCliente(ByVal CodCliente As Integer) As Cliente Implements IClienteDAO.ListarCliente
            Dim ds As New DataSet
            Dim cli As Cliente = Nothing

            strSql = " SELECT *, "
            strSql += "       CASE WHEN (SELECT FK9798ESTADO FROM ac97cidade WHERE AC97CODIGO = c.FK0197UFCIDADE ) IS NULL THEN "
            strSql += "                  0 "
            strSql += "         ELSE "
            strSql += "                  (SELECT FK9798ESTADO FROM ac97cidade WHERE AC97CODIGO = c.FK0197UFCIDADE ) "
            strSql += "         END UF "
            strSql += "  FROM ac01cliente AS c"
            strSql += " WHERE 0 = 0"

            strSql += "   AND c.AC01CODIGO = " & CodCliente

            strSql += "  ORDER BY c.AC01NOME"

            Try

                adpt = DaoFactory.GetDataAdapter
                cmd = conn.CreateCommand
                cmd.CommandText = strSql
                adpt.SelectCommand = cmd
                adpt.Fill(ds)

                If ds.Tables(0).Rows.Count > 0 Then
                    cli = New Cliente
                    cli.Codigo = ds.Tables(0).Rows(0).Item("AC01CODIGO").ToString
                    cli.Nome = ds.Tables(0).Rows(0).Item("AC01NOME").ToString
                    cli.Cpf = ds.Tables(0).Rows(0).Item("AC01CPF").ToString
                    cli.Rg = ds.Tables(0).Rows(0).Item("AC01RG").ToString
                    cli.DataNascimento = ds.Tables(0).Rows(0).Item("AC01DATANASC").ToString
                    cli.Endereco.Logradouro = ds.Tables(0).Rows(0).Item("AC01LOGRADOURO").ToString
                    cli.Endereco.Bairro = ds.Tables(0).Rows(0).Item("AC01BAIRRO").ToString
                    cli.Endereco.Cidade = ds.Tables(0).Rows(0).Item("FK0197UFCIDADE").ToString
                    cli.Endereco.Uf = CInt(ds.Tables(0).Rows(0).Item("UF").ToString)
                    cli.Sexo = ds.Tables(0).Rows(0).Item("FK0199SEXO").ToString
                    cli.EstadoCivil = ds.Tables(0).Rows(0).Item("FK0199ESTADOCIVIL").ToString
                    cli.Residencia = ds.Tables(0).Rows(0).Item("FK0199RESIDENCIA").ToString
                    cli.Endereco.Cep = ds.Tables(0).Rows(0).Item("AC01CEP").ToString
                    cli.Contato.FoneResidencial = ds.Tables(0).Rows(0).Item("AC01FONERES").ToString
                    cli.Contato.FoneCelular = ds.Tables(0).Rows(0).Item("AC01FONECEL").ToString
                    cli.Contato.FoneComercial = ds.Tables(0).Rows(0).Item("AC01FONECOM").ToString
                    cli.Cargo = ds.Tables(0).Rows(0).Item("FK0199PROFISSAO").ToString
                    cli.EmpresaPagadora = ds.Tables(0).Rows(0).Item("FK0199EMPRESAFONTE").ToString
                    cli.OrgaoEmissor = ds.Tables(0).Rows(0).Item("AC01ORGEMISSOR").ToString
                    cli.DataEmissao = ds.Tables(0).Rows(0).Item("AC01DATAEMISSAO").ToString
                    cli.NIT = ds.Tables(0).Rows(0).Item("AC01NIT").ToString
                    cli.NomeReferencia1 = ds.Tables(0).Rows(0).Item("AC01NOMEREF1").ToString
                    cli.FoneReferencia1 = ds.Tables(0).Rows(0).Item("AC01FONEREF1").ToString
                    cli.NomeReferencia2 = ds.Tables(0).Rows(0).Item("AC01NOMEREF2").ToString
                    cli.FoneReferencia2 = ds.Tables(0).Rows(0).Item("AC01FONEREF2").ToString

                End If

                Return cli

            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try
        End Function

        Public Function ListarCliente() As List(Of Cliente) Implements IClienteDAO.ListarCliente

        End Function

    End Class

End Namespace
