Imports Camadas.DAO.Interface
Imports Camadas.Dominio
Imports Camadas.DAO
Imports System.Data
Imports Excecoes
Imports Microsoft.VisualBasic
Imports Camadas.Negocio.Interface
Imports Infraestrutura
Imports MySql.Data.MySqlClient

Namespace Camadas.Negocio

    Public Class ClienteController
        Implements IClienteController

        Public Sub CadastrarCliente(ByVal c As Cliente) Implements IClienteController.CadastrarCliente
            Dim dao As IClienteDAO

            Try
                c.DataNascimento = Format(Date.Parse(c.DataNascimento), "yyyy-MM-dd")
                If c.DataEmissao <> "" Then c.DataEmissao = Format(Date.Parse(c.DataEmissao), "yyyy-MM-dd")
                c.Cpf = c.Cpf.Replace(".", "").Replace("-", "")
                If c.Rg.Trim = "" Then c.Rg = "NULL"

                dao = DaoFactory.GetClienteDAO
                dao.CadastrarCliente(c)

            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw New BusinessException(ex.Message)
            Finally
                dao = Nothing
            End Try
        End Sub

        Public Sub atualizarCliente(ByVal c As Cliente) Implements IClienteController.atualizarCliente
            Dim dao As IClienteDAO

            Try
                c.DataNascimento = Format(Date.Parse(c.DataNascimento), "yyyy-MM-dd")
                If c.DataEmissao <> "" Then c.DataEmissao = Format(Date.Parse(c.DataEmissao), "yyyy-MM-dd")
                c.Cpf = c.Cpf.Replace(".", "").Replace("-", "")
                If c.Rg.Trim = "" Then c.Rg = "NULL"

                dao = DaoFactory.GetClienteDAO
                dao.atualizarCliente(c)

            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw New BusinessException(ex.Message)
            Finally
                dao = Nothing
            End Try
        End Sub

        Public Function ListarCliente(ByVal Cliente As Cliente) As DataTable Implements IClienteController.ListarCliente
            Dim dao As IClienteDAO

            Try

                If Cliente.Nome Is Nothing Then Cliente.Nome = ""
                If Cliente.Cpf Is Nothing Then Cliente.Cpf = ""
                If Cliente.Rg Is Nothing Then Cliente.Rg = ""
                'If Cliente.Codigo Is Nothing Then Cliente.Nome = ""

                dao = DaoFactory.GetClienteDAO
                Return dao.ListarCliente(Cliente)

            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw New BusinessException(ex.Message)
            Finally
                dao = Nothing
            End Try

        End Function

        Public Function ListarCliente(ByVal CodCliente As Integer) As Cliente Implements IClienteController.ListarCliente
            Dim dao As IClienteDAO

            Try

                dao = DaoFactory.GetClienteDAO
                Return dao.ListarCliente(CodCliente)

            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw New BusinessException(ex.Message)
            Finally
                dao = Nothing
            End Try
        End Function

    End Class

End Namespace
