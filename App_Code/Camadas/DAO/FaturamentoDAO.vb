
Imports System.Data
Imports Excecoes
Imports Microsoft.VisualBasic
Imports Camadas.DAO.Interface
Imports Camadas.Dominio
Imports MySql.Data.MySqlClient
Imports System.Data.OleDb

Namespace Camadas.DAO

    Public Class FaturamentoDAO
        Implements IFaturamentoDAO

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

        Public Sub cadastrarFaturamento(ByVal f As Faturamento) Implements IFaturamentoDAO.cadastrarFaturamento

            strSql = "INSERT INTO ac02faturamento VALUES(NULL,"
            strSql += f.Cliente.Codigo & "," & usuario.Codigo & ",'" & f.DataCredito & "'," & Replace(f.ValorCredito, ",", ".") & "," & f.Comissao & ","
            strSql += f.QuantidadeParcelas & "," & Replace(f.ValorParcela, ",", ".") & "," & f.Banco.Codigo & ",'" & f.DataPrimeiraParcela & "')"

            Try
                cmd = conn.CreateCommand
                cmd.Transaction = DaoFactory.GetCurrentTransaction
                cmd.CommandText = strSql
                cmd.ExecuteNonQuery()

                '===========LOG===========
                Seguranca.GravarLog(usuario, "I", "ac02", strSql)
                '=========================
            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try

        End Sub

        Public Sub atualizarFaturamento(ByVal f As Faturamento) Implements IFaturamentoDAO.atualizarFaturamento

            strSql = "UPDATE ac02faturamento SET "
            strSql += "AC02DATACRD='" & f.DataCredito & "', AC02VALORCRD=" & Replace(f.ValorCredito, ",", ".") & ", AC02COMISSAO=" & f.Comissao & ","
            strSql += "AC02QTDPARCELA=" & f.QuantidadeParcelas & ", AC02VLRPARCELA=" & Replace(f.ValorParcela, ",", ".") & ", FK0204BANCO=" & f.Banco.Codigo & ", AC02DATAPRIPARCELA='" & f.DataPrimeiraParcela & "' "
            strSql += " WHERE AC02CODIGO=" & f.Codigo

            Try
                cmd = conn.CreateCommand
                cmd.Transaction = DaoFactory.GetCurrentTransaction
                cmd.CommandText = strSql
                cmd.ExecuteNonQuery()

                '===========LOG===========
                Seguranca.GravarLog(usuario, "U", "ac02", strSql)
                '=========================
            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try

        End Sub

        Public Sub excluirFaturamento(ByVal Faturamento As Faturamento) Implements IFaturamentoDAO.excluirFaturamento

            strSql = "  DELETE FROM ac02faturamento "
            strSql += "  WHERE AC02CODIGO = " & Faturamento.Codigo

            Try
                cmd = conn.CreateCommand
                cmd.Transaction = DaoFactory.GetCurrentTransaction
                cmd.CommandText = strSql
                cmd.ExecuteNonQuery()

                '===========LOG===========
                Seguranca.GravarLog(usuario, "D", "ac02", strSql & " CLIENTE: " & Faturamento.Cliente.Nome & " VALOR CRÉDITO: " & Faturamento.ValorCredito)
                '=========================
            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try

        End Sub

        Public Function listarFaturamento(ByVal CodFaturamento As Integer) As Faturamento Implements IFaturamentoDAO.listarFaturamento
            Dim ds As New DataSet
            Dim f As Faturamento = Nothing

            strSql = " SELECT *, "
            strSql += "       (SELECT AC03NOMECOMPLETO FROM ac03usuario WHERE AC03CODIGO=FK0203USUARIO) USUARIO "
            strSql += "  FROM ac02faturamento,ac01cliente,ac04banco"
            strSql += " WHERE 0 = 0"
            strSql += "   AND FK0201CLIENTE = AC01CODIGO"
            strSql += "   AND AC04CODIGO    = FK0204BANCO"
            strSql += "   AND AC02CODIGO    = " & CodFaturamento

            strSql += "  ORDER BY AC01NOME,AC02DATACRD"

            Try

                adpt = DaoFactory.GetDataAdapter
                cmd = conn.CreateCommand
                cmd.CommandText = strSql
                adpt.SelectCommand = cmd
                adpt.Fill(ds)

                If ds.Tables(0).Rows.Count > 0 Then
                    f = New Faturamento
                    f.Codigo = ds.Tables(0).Rows(0).Item("AC02CODIGO").ToString
                    f.Cliente.Codigo = ds.Tables(0).Rows(0).Item("AC01CODIGO").ToString
                    f.Cliente.Nome = ds.Tables(0).Rows(0).Item("AC01NOME").ToString
                    f.Cliente.Cpf = ds.Tables(0).Rows(0).Item("AC01CPF").ToString
                    f.DataCredito = Format(Date.Parse(ds.Tables(0).Rows(0).Item("AC02DATACRD").ToString), "dd/MM/yyyy")
                    f.ValorCredito = String.Format("{0:c2}", Convert.ToDouble(ds.Tables(0).Rows(0).Item("AC02VALORCRD").ToString)) 'String.Format("0:C2", Convert.ToDouble(txtValorPromocional.Text))
                    f.Comissao = ds.Tables(0).Rows(0).Item("AC02COMISSAO").ToString
                    f.QuantidadeParcelas = ds.Tables(0).Rows(0).Item("AC02QTDPARCELA").ToString
                    f.ValorParcela = String.Format("{0:c2}", Convert.ToDouble(ds.Tables(0).Rows(0).Item("AC02VLRPARCELA").ToString))
                    f.Banco.Codigo = ds.Tables(0).Rows(0).Item("FK0204BANCO").ToString
                    f.DataPrimeiraParcela = ds.Tables(0).Rows(0).Item("AC02DATAPRIPARCELA").ToString
                    f.Usuario.Nome = ds.Tables(0).Rows(0).Item("USUARIO").ToString

                End If

                Return f

            Catch ex As OleDbException
                Throw New DAOException(ex.Message)
            Catch ex As MySqlException
                Throw New DAOException(ex.Message)
            Catch ex As Exception
                Throw New DAOException(ex.Message)
            End Try
        End Function

        Public Function listarFaturamento(ByVal Faturamento As Faturamento) As DataTable Implements IFaturamentoDAO.listarFaturamento
            Dim ds As New DataSet

            strSql = " SELECT * "
            strSql += "  FROM ac02faturamento,ac01cliente,ac04banco "
            strSql += " WHERE 0 = 0"
            strSql += "   AND AC04CODIGO    = FK0204BANCO"
            strSql += "   AND FK0201CLIENTE = AC01CODIGO"

            If Faturamento.Cliente.Nome.Trim <> "" Then strSql += "   AND AC01NOME LIKE '%" & Faturamento.Cliente.Nome & "%' "

            If Faturamento.Cliente.Cpf.Trim <> "" Then strSql += "   AND AC01CPF LIKE '%" & Faturamento.Cliente.Cpf.Replace(".", "").Replace("-", "") & "%' "

            If Faturamento.Cliente.Rg.Trim <> "" Then strSql += "   AND AC01RG = " & Faturamento.Cliente.Rg

            If Faturamento.Cliente.Codigo <> 0 Then strSql += "   AND AC01CODIGO = " & Faturamento.Cliente.Codigo

            strSql += "  ORDER BY AC01NOME,AC02DATACRD DESC,FK0204BANCO"

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

        Public Function listaMarkting(ByVal banco As Integer, ByVal dataIni As String, ByVal dataFin As String) As DataTable Implements IFaturamentoDAO.listaMarkting
            Dim ds As New DataSet

            strSql = "  SELECT AC01NOME,AC01CPF,AC01FONERES,AC01FONECOM,AC01FONECEL "
            strSql += "   FROM ac01cliente "
            strSql += "  WHERE 1=1 "
            strSql += "    AND EXISTS (SELECT * FROM ac02faturamento WHERE 1=1 "
            strSql += "    AND FK0201CLIENTE=AC01CODIGO "

            If banco <> 0 Then strSql += "    AND FK0204BANCO=" & banco

            strSql += "    AND AC02DATACRD BETWEEN '" & dataIni & "' AND '" & dataFin & "') "
            strSql += "        ORDER BY AC01NOME "

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

    End Class

End Namespace
