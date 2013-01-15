Imports Camadas.Dominio
Imports Microsoft.VisualBasic

Namespace Camadas.Dominio

    ''' <summary>
    ''' Classe que representa todos os faturamentos por cliente.
    ''' </summary>
    ''' 

    Public Class Faturamento

        Private _codigo As Integer
        Private _cliente As New Cliente
        Private _dataCredito As String
        Private _valorCredito As Double
        Private _comissao As Double
        Private _quantidadeParcelas As Int16
        Private _valorParcela As Double
        Private _banco As New Banco
        Private _usuario As New Usuario
        Private _dataPrimeiraParcela As String

        Public Property DataPrimeiraParcela() As String
            Get
                Return _dataPrimeiraParcela
            End Get
            Set(ByVal value As String)
                _dataPrimeiraParcela = value
            End Set
        End Property

        Public Property Banco() As Banco
            Get
                Return _banco
            End Get
            Set(ByVal value As Banco)
                _banco = value
            End Set
        End Property

        Public Property Usuario() As Usuario
            Get
                Return _usuario
            End Get
            Set(ByVal value As Usuario)
                _usuario = value
            End Set
        End Property


        Public Property ValorParcela() As Double
            Get
                Return _valorParcela
            End Get
            Set(ByVal value As Double)
                _valorParcela = value
            End Set
        End Property

        Public Property QuantidadeParcelas() As Short
            Get
                Return _quantidadeParcelas
            End Get
            Set(ByVal value As Short)
                _quantidadeParcelas = value
            End Set
        End Property

        Public Property Comissao() As Double
            Get
                Return _comissao
            End Get
            Set(ByVal value As Double)
                _comissao = value
            End Set
        End Property

        Public Property ValorCredito() As Double
            Get
                Return _valorCredito
            End Get
            Set(ByVal value As Double)
                _valorCredito = value
            End Set
        End Property

        Public Property DataCredito() As String
            Get
                Return _dataCredito
            End Get
            Set(ByVal value As String)
                _dataCredito = value
            End Set
        End Property

        Public Property Cliente() As Cliente
            Get
                Return _cliente
            End Get
            Set(ByVal value As Cliente)
                _cliente = value
            End Set
        End Property

        Public Property Codigo() As Integer
            Get
                Return _codigo
            End Get
            Set(ByVal value As Integer)
                _codigo = value
            End Set
        End Property


    End Class

End Namespace
