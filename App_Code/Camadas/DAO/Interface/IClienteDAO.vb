Imports Camadas.Dominio
Imports System.Collections.Generic
Imports System.Data

Public Interface IClienteDAO

    Sub CadastrarCliente(ByVal c As Cliente)
    Sub atualizarCliente(ByVal c As Cliente)
    Function ListarCliente(ByVal CodCliente As Integer) As Cliente
    Function ListarCliente() As List(Of Cliente)
    Function ListarCliente(ByVal Cliente As Cliente) As DataTable

End Interface