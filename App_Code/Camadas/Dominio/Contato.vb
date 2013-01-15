Namespace Camadas.Dominio

    ''' <summary>
    ''' Classe que representa os contatos do ator (cliente).
    ''' </summary>
    ''' 
    Public Class Contato

        Private _foneResidencial As String
        Private _foneCelular As String
        Private _foneComercial As String
        Private _email As String

        Public Property FoneResidencial() As String
            Get
                Return _foneResidencial
            End Get
            Set(ByVal value As String)
                _foneResidencial = value
            End Set
        End Property

        Public Property FoneCelular() As String
            Get
                Return _foneCelular
            End Get
            Set(ByVal value As String)
                _foneCelular = value
            End Set
        End Property

        Public Property FoneComercial() As String
            Get
                Return _foneComercial
            End Get
            Set(ByVal value As String)
                _foneComercial = value
            End Set
        End Property

        Public Property Email() As String
            Get
                Return _email
            End Get
            Set(ByVal value As String)
                _email = value
            End Set
        End Property
    End Class

End Namespace