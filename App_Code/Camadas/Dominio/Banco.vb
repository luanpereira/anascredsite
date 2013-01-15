Imports Microsoft.VisualBasic

Namespace Camadas.Dominio
    Public Class Banco

        Private _codigo As Integer
        Private _nome As String
        Private _codigoBanco As String

        Public Property Codigo() As Integer
            Get
                Return _codigo
            End Get
            Set(ByVal value As Integer)
                _codigo = value
            End Set
        End Property

        Public Property Nome() As String
            Get
                Return _codigo
            End Get
            Set(ByVal value As String)
                _codigo = value
            End Set
        End Property

        Public Property CodigoBanco() As String
            Get
                Return _codigo
            End Get
            Set(ByVal value As String)
                _codigo = value
            End Set
        End Property
    End Class
End Namespace
