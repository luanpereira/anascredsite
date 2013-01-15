Imports Camadas.Dominio
Imports Camadas.DAO
Imports System.Data
Imports Excecoes
Imports Microsoft.VisualBasic
Imports Camadas.Negocio.Interface
Imports MySql.Data.MySqlClient

Namespace Camadas.Negocio

    Public Class FaturamentoCrontroller
        Implements IFaturamentoController

        Public Sub cadastrarFaturamento(ByVal f As Faturamento) Implements IFaturamentoController.cadastrarFaturamento
            Dim dao As IFaturamentoDAO

            Try
                f.DataCredito = Format(Date.Parse(f.DataCredito), "yyyy-MM-dd")
                f.DataPrimeiraParcela = Format(Date.Parse(f.DataPrimeiraParcela), "yyyy-MM-dd")

                dao = DaoFactory.GetFaturamentoDAO
                dao.cadastrarFaturamento(f)

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

        Public Sub atualizarFaturamento(ByVal f As Faturamento) Implements IFaturamentoController.atualizarFaturamento
            Dim dao As IFaturamentoDAO

            Try
                f.DataCredito = Format(Date.Parse(f.DataCredito), "yyyy-MM-dd")
                f.DataPrimeiraParcela = Format(Date.Parse(f.DataPrimeiraParcela), "yyyy-MM-dd")

                dao = DaoFactory.GetFaturamentoDAO
                dao.atualizarFaturamento(f)

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

        Public Sub excluirFaturamento(ByVal Faturamento As Faturamento) Implements IFaturamentoController.excluirFaturamento
            Dim dao As IFaturamentoDAO

            Try

                dao = DaoFactory.GetFaturamentoDAO
                dao.excluirFaturamento(Faturamento)

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

        Public Function listarFaturamento(ByVal CodFaturamento As Integer) As Faturamento Implements IFaturamentoController.listarFaturamento
            Dim dao As IFaturamentoDAO

            Try

                dao = DaoFactory.GetFaturamentoDAO
                Return dao.listarFaturamento(CodFaturamento)

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

        Public Function listarFaturamento(ByVal Faturamento As Faturamento) As DataTable Implements IFaturamentoController.listarFaturamento
            Dim dao As IFaturamentoDAO

            Try

                dao = DaoFactory.GetFaturamentoDAO
                Return dao.listarFaturamento(Faturamento)

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

        Public Function listaMarkting(ByVal banco As Integer, ByVal dataIni As String, ByVal dataFin As String) As DataTable Implements IFaturamentoController.listaMarkting
            Dim dao As IFaturamentoDAO

            Try

                dao = DaoFactory.GetFaturamentoDAO
                Return dao.listaMarkting(banco, dataIni, dataFin)

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
