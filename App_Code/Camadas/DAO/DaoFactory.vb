Imports Camadas.DAO
Imports Camadas.DAO.Interface
Imports MySql.Data.MySqlClient
Imports System.Data.OleDb
Imports System.Data
Imports Excecoes

Friend Enum Conexao
    PRODUCAO = 1
    HOMOLOGACAO = 2
    TESTE = 3
End Enum

Namespace Camadas.DAO

    Public Class DaoFactory

        'AMBIENTE DE EXECU��O
        Private Shared AMBIENTE As String = System.Configuration.ConfigurationManager.AppSettings.Item("AMBIENTE").ToString
        'CONEXAO
        Private Shared cnn As IDbConnection
        'TRANSA��O
        Private Shared transaction As MySqlTransaction
        'STRING DE CONEXAO
        Private Shared stringConexao As String

        'CRIA A CONEX�O COM O BANCO DE DADOS ENGCOMP
        Public Shared Function GetConnection() As MySqlConnection ' IDbConnection

            Dim strConn As String = ""

            Select Case AMBIENTE

                Case "T"
                    strConn = System.Configuration.ConfigurationManager.ConnectionStrings("ANASCRED_TESTE").ConnectionString.ToString
                Case "H"
                    strConn = System.Configuration.ConfigurationManager.ConnectionStrings("ANASCRED_HOMOLOGACAO").ConnectionString.ToString
                Case "P"
                    strConn = System.Configuration.ConfigurationManager.ConnectionStrings("ANASCRED_PRODUCAO").ConnectionString.ToString

            End Select

            Try

                If cnn Is Nothing Then
                    cnn = New MySqlConnection(strConn)
                    cnn.Open()
                End If

                Return cnn

            Catch ex As MySqlException
                Throw New DAOException("BANCO DE DADOS FORA DO AR. RETORNE MAIS TARDE! PERSISTINDO O PROBLEMA ENTRE EM CONTATO COM O SUPORTE.", ex)
            Catch ex As OleDbException
                Throw New DAOException("BANCO DE DADOS FORA DO AR. RETORNE MAIS TARDE! PERSISTINDO O PROBLEMA ENTRE EM CONTATO COM O SUPORTE.", ex)
            End Try

        End Function

        Public Shared Function GetDataAdapter() As MySqlDataAdapter
            Return New MySqlDataAdapter
        End Function

        'FECHAR CONEXAO
        Public Shared Sub CloseConnection()
            If Not cnn Is Nothing Then
                cnn.Close()
            End If
            cnn = Nothing
        End Sub

        'INICIAR TRANSACAO
        Public Shared Sub BeginTransaction()
            transaction = GetConnection.BeginTransaction()
        End Sub

        'OBTER A TRANSA��O CORRENTE
        Public Shared Function GetCurrentTransaction() As MySqlTransaction
            Return transaction
        End Function

        'COMMIT
        Public Shared Sub TransactionCommit()
            transaction.Commit()
            transaction = Nothing
        End Sub

        'ROLLBACK
        Public Shared Sub TransactionRollback()
            transaction.Rollback()
        End Sub

        Public Shared Function GetClienteDAO() As IClienteDAO
            Return New ClienteDAO(GetConnection)
        End Function

        Public Shared Function GetFaturamentoDAO() As IFaturamentoDAO
            Return New FaturamentoDAO(GetConnection)
        End Function

    End Class

End Namespace
