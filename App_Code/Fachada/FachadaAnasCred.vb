Imports Camadas.Dominio
Imports Camadas.DAO
Imports System.Data
Imports Excecoes
Imports Microsoft.VisualBasic
Imports Fachada
Imports Camadas.Negocio
Imports MySql.Data.MySqlClient

Namespace Fachada

    Public Class FachadaAnasCred
        Implements IFachadaAnasCred

#Region "CLIENTE"
        Public Sub CadastrarCliente(ByVal cl As Cliente) Implements IFachadaAnasCred.CadastrarCliente
            Dim c As IClienteController

            Try
                DaoFactory.BeginTransaction()
                '--------------------------
                c = New ClienteController
                c.CadastrarCliente(cl)
                '--------------------------
                DaoFactory.TransactionCommit()
            Catch ex As BusinessException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As DAOException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As MySqlException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As Exception
                DaoFactory.TransactionRollback()
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Sub

        Public Sub atualizarCliente(ByVal cl As Cliente) Implements IFachadaAnasCred.atualizarCliente
            Dim c As IClienteController

            Try
                DaoFactory.BeginTransaction()
                '--------------------------
                c = New ClienteController
                c.atualizarCliente(cl)
                '--------------------------
                DaoFactory.TransactionCommit()
            Catch ex As BusinessException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As DAOException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As MySqlException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As Exception
                DaoFactory.TransactionRollback()
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Sub

        Public Function ListarCliente(ByVal Cliente As Cliente) As DataTable Implements IFachadaAnasCred.ListarCliente
            Dim c As IClienteController

            Try

                c = New ClienteController
                Return c.ListarCliente(Cliente)

            Catch ex As BusinessException
                Throw ex
            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try

        End Function

        Public Function ListarCliente(ByVal CodCliente As Integer) As Cliente Implements IFachadaAnasCred.ListarCliente
            Dim c As IClienteController

            Try

                c = New ClienteController
                Return c.ListarCliente(CodCliente)

            Catch ex As BusinessException
                Throw ex
            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Function
#End Region

#Region "FATURAMENTO"
        Public Sub cadastrarFaturamento(ByVal f As Faturamento) Implements IFachadaAnasCred.cadastrarFaturamento
            Dim c As IFaturamentoController

            Try
                DaoFactory.BeginTransaction()
                '--------------------------
                c = New FaturamentoCrontroller
                c.cadastrarFaturamento(f)
                '--------------------------
                DaoFactory.TransactionCommit()
            Catch ex As BusinessException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As DAOException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As MySqlException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As Exception
                DaoFactory.TransactionRollback()
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Sub

        Public Sub atualizarFaturamento(ByVal f As Faturamento) Implements IFachadaAnasCred.atualizarFaturamento
            Dim c As IFaturamentoController

            Try
                DaoFactory.BeginTransaction()
                '--------------------------
                c = New FaturamentoCrontroller
                c.atualizarFaturamento(f)
                '--------------------------
                DaoFactory.TransactionCommit()
            Catch ex As BusinessException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As DAOException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As MySqlException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As Exception
                DaoFactory.TransactionRollback()
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Sub

        Public Sub excluirFaturamento(ByVal Faturamento As Faturamento) Implements IFachadaAnasCred.excluirFaturamento
            Dim c As IFaturamentoController

            Try
                DaoFactory.BeginTransaction()
                '--------------------------
                c = New FaturamentoCrontroller
                c.excluirFaturamento(Faturamento)
                '--------------------------
                DaoFactory.TransactionCommit()
            Catch ex As BusinessException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As DAOException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As MySqlException
                DaoFactory.TransactionRollback()
                Throw ex
            Catch ex As Exception
                DaoFactory.TransactionRollback()
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Sub

        Public Function listarFaturamento(ByVal CodFaturamento As Integer) As Faturamento Implements IFachadaAnasCred.listarFaturamento
            Dim c As IFaturamentoController

            Try

                c = New FaturamentoCrontroller
                Return c.listarFaturamento(CodFaturamento)

            Catch ex As BusinessException
                Throw ex
            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Function

        Public Function listarFaturamento(ByVal Faturamento As Faturamento) As DataTable Implements IFachadaAnasCred.listarFaturamento
            Dim c As IFaturamentoController

            Try

                c = New FaturamentoCrontroller
                Return c.listarFaturamento(Faturamento)

            Catch ex As BusinessException
                Throw ex
            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Function

        Public Function listaMarkting(ByVal banco As Integer, ByVal dataIni As String, ByVal dataFin As String) As DataTable Implements IFachadaAnasCred.listaMarkting
            Dim c As IFaturamentoController

            Try

                c = New FaturamentoCrontroller
                Return c.listaMarkting(banco, dataIni, dataFin)

            Catch ex As BusinessException
                Throw ex
            Catch ex As DAOException
                Throw ex
            Catch ex As MySqlException
                Throw ex
            Catch ex As Exception
                Throw ex
            Finally
                DaoFactory.CloseConnection()
            End Try
        End Function
#End Region

    End Class

End Namespace
