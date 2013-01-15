Imports Camadas.Dominio
Imports System.Data

Public Interface IFaturamentoController

    Sub cadastrarFaturamento(ByVal f As Faturamento)
    Sub atualizarFaturamento(ByVal f As Faturamento)
    Sub excluirFaturamento(ByVal Faturamento As Faturamento)
    Function listarFaturamento(ByVal CodFaturamento As Integer) As Faturamento
    Function listarFaturamento(ByVal Faturamento As Faturamento) As DataTable
    Function listaMarkting(ByVal banco As Integer, ByVal dataIni As String, ByVal dataFin As String) As DataTable

End Interface