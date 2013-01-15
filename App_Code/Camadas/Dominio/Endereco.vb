Namespace Camadas.Dominio

    ''' <summary>
    ''' Classe que representa o endereco do ator (cliente).
    ''' </summary>
    ''' 

    Public Class Endereco

        Private _logradouro As String
        Private _bairro As String
        Private _uf As Int16
        Private _cidade As Integer
        Private _cep As String

        Public Property Cep() As String
            Get
                Return _cep
            End Get
            Set(ByVal value As String)
                _cep = value.Trim.Replace("-", "")
            End Set
        End Property

        Public Property Logradouro() As String
            Get
                Return _logradouro
            End Get
            Set (ByVal value As String)
                _logradouro = value.ToUpper
            End Set
        End Property

        Public Property Bairro() As String
            Get
                Return _bairro
            End Get
            Set (ByVal value As String)
                _bairro = value.ToUpper
            End Set
        End Property

        Public Property Uf() As Short
            Get
                Return _uf
            End Get
            Set (ByVal value As Short)
                _uf = value
            End Set
        End Property

        Public Property Cidade() As Integer
            Get
                Return _cidade
            End Get
            Set(ByVal value As Integer)
                _cidade = value
            End Set
        End Property

        Public ReadOnly Property Completo() As String
            Get
                Return _logradouro & ", " & _bairro & " " & _cidade & " " & _cidade & ", CEP:" & _cep
            End Get
        End Property


    End Class

End Namespace