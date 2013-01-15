Imports Camadas.DAO.Interface
Imports Camadas.Dominio
Imports System.Data

Public Interface IClienteController

    Sub CadastrarCliente(ByVal c As Cliente)
    Sub atualizarCliente(ByVal c As Cliente)
    Function ListarCliente(ByVal Cliente As Cliente) As DataTable
    Function ListarCliente(ByVal CodCliente As Integer) As Cliente

End Interface