Imports Camadas.Dominio
Imports Microsoft.VisualBasic

Namespace Camadas.Dominio

    ''' <summary>
    ''' Classe que representa o cliente.
    ''' </summary>
    ''' 
    Public Class Cliente

        Private _codigo As Integer
        Private _nome As String
        Private _cpf As String
        Private _rg As String
        Private _orgaoEmissor As String
        Private _dataEmissao As String
        Private _dataNascimento As String
        Private _sexo As Int16
        Private _estadoCivil As Int16
        Private _residencia As Int16
        Private _endereco As New Endereco
        Private _contato As New Contato
        Private _empresaPagadora As Int32
        Private _cargo As String
        Private _nit As String
        Private _nomeReferencia1 As String
        Private _foneReferencia1 As String
        Private _nomeReferencia2 As String
        Private _foneReferencia2 As String

        ''' <summary>
        ''' Código do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Codigo() As Integer
            Get
                Return _codigo
            End Get
            Set(ByVal value As Integer)
                _codigo = value
            End Set
        End Property

        ''' <summary>
        ''' Representa o nome do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Nome() As String
            Get
                Return _nome
            End Get
            Set(ByVal value As String)
                _nome = value.ToUpper
            End Set
        End Property

        ''' <summary>
        ''' Representa o cpf do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Cpf() As String
            Get
                Return _cpf
            End Get
            Set(ByVal value As String)
                _cpf = value.ToUpper
            End Set
        End Property

        ''' <summary>
        ''' Representa o RG do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Rg() As String
            Get
                Return _rg
            End Get
            Set(ByVal value As String)
                _rg = value.ToUpper
            End Set
        End Property

        ''' <summary>
        ''' Representa a data de nascimento do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property DataNascimento() As String
            Get
                Return _dataNascimento
            End Get
            Set(ByVal value As String)
                _dataNascimento = value
            End Set
        End Property

        ''' <summary>
        ''' Representa o sexo masculino ou feminino do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Sexo() As Short
            Get
                Return _sexo
            End Get
            Set(ByVal value As Short)
                _sexo = value
            End Set
        End Property

        ''' <summary>
        ''' Representa o estado civil o cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property EstadoCivil() As Short
            Get
                Return _estadoCivil
            End Get
            Set(ByVal value As Short)
                _estadoCivil = value
            End Set
        End Property

        ''' <summary>
        ''' Representa o tipo e residencia do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Residencia() As Short
            Get
                Return _residencia
            End Get
            Set(ByVal value As Short)
                _residencia = value
            End Set
        End Property

        ''' <summary>
        ''' Objeto Endereco que representa o endereco do clinte bem como logradouro, bairro...
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Endereco() As Endereco
            Get
                Return _endereco
            End Get
            Set(ByVal value As Endereco)
                _endereco = value
            End Set
        End Property

        ''' <summary>
        ''' Objeto contato que representa os dados de contato do cliente.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Contato() As Contato
            Get
                Return _contato
            End Get
            Set(ByVal value As Contato)
                _contato = value
            End Set
        End Property

        ''' <summary>
        ''' Representa a empresa em que o cliente trabalha.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property EmpresaPagadora() As Integer
            Get
                Return _empresaPagadora
            End Get
            Set(ByVal value As Integer)
                _empresaPagadora = value
            End Set
        End Property

        ''' <summary>
        ''' Representa o cargo em que o cliente exerce na empresa.
        ''' </summary>
        ''' <remarks></remarks>
        Public Property Cargo() As String
            Get
                Return _cargo
            End Get
            Set(ByVal value As String)
                _cargo = value.ToUpper
            End Set
        End Property

        Public Property OrgaoEmissor() As String
            Get
                Return _orgaoEmissor
            End Get
            Set(ByVal value As String)
                _orgaoEmissor = value
            End Set
        End Property

        Public Property DataEmissao() As String
            Get
                Return _dataEmissao
            End Get
            Set(ByVal value As String)
                _dataEmissao = value
            End Set
        End Property

        Public Property NIT() As String
            Get
                Return _nit
            End Get
            Set(ByVal value As String)
                _nit = value
            End Set
        End Property

        Public Property NomeReferencia1() As String
            Get
                Return _nomeReferencia1
            End Get
            Set(ByVal value As String)
                _nomeReferencia1 = value
            End Set
        End Property

        Public Property FoneReferencia1() As String
            Get
                Return _foneReferencia1
            End Get
            Set(ByVal value As String)
                _foneReferencia1 = value
            End Set
        End Property

        Public Property NomeReferencia2() As String
            Get
                Return _nomeReferencia2
            End Get
            Set(ByVal value As String)
                _nomeReferencia2 = value
            End Set
        End Property

        Public Property FoneReferencia2() As String
            Get
                Return _foneReferencia2
            End Get
            Set(ByVal value As String)
                _foneReferencia2 = value
            End Set
        End Property
    End Class

End Namespace