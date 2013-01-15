<%@ Page Language="VB" MasterPageFile="~/ANASCRED.master" AutoEventWireup="false" CodeFile="CadastrarContrato.aspx.vb" Inherits="pages_administrativo_CadastrarContrato" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="div_corpo_form">
        <div id="div_titulo_form">
            Cadastrar Contrato
        </div>
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <asp:UpdatePanel id="UpdatePanel1" runat="server">
            <contenttemplate>
<DIV style="WIDTH: 715px" id="div_form"><cc1:CalendarExtender id="datCredito" runat="server" CssClass="calendario" TargetControlID="txtDataCred" Format="dd/MM/yyyy"></cc1:CalendarExtender> <cc1:CalendarExtender id="datPriParcela" runat="server" CssClass="calendario" TargetControlID="txtDataPriParcela" Format="dd/MM/yyyy">
</cc1:CalendarExtender>
    <DIV style="FLOAT: left; WIDTH: 195px; HEIGHT: 45px"><asp:Label id="Label1" runat="server" CssClass="tituloCampoForm" Text="CPF" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtCPF" onkeypress="txtCPF_TextChanged" runat="server" CssClass="txt" AutoPostBack="True" Width="139px" OnTextChanged="txtCPF_TextChanged" ToolTip="CPF"></asp:TextBox> <asp:Button id="btnPesqCli" onclick="btnPesqCli_Click" runat="server" CssClass="botaoForm pesquisar" Text="."></asp:Button> </DIV><DIV style="FLOAT: left; WIDTH: 422px; HEIGHT: 45px" id="DIV1"><asp:Label id="Label4" runat="server" CssClass="tituloCampoForm" Text="Cliente"></asp:Label><BR />&nbsp;<asp:LinkButton id="lblCliente" runat="server" ForeColor="#C00000" Font-Bold="True"></asp:LinkButton></DIV><DIV style="FLOAT: left; WIDTH: 116px; HEIGHT: 40px"><asp:Label id="Label13" runat="server" CssClass="tituloCampoForm" Text="Data do Crédito" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtDataCred" runat="server" CssClass="txt" Width="99px" ToolTip="Data do Crédito"></asp:TextBox> </DIV><DIV style="FLOAT: left; WIDTH: 128px; HEIGHT: 40px"><asp:Label id="Label2" runat="server" CssClass="tituloCampoForm" Text="Valor de Crédito (R$)" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtVlrCred" runat="server" CssClass="txt" Width="119px" ToolTip="Valor de Crédito"></asp:TextBox></DIV><DIV style="FLOAT: left; WIDTH: 46px; HEIGHT: 40px"><asp:Label id="Label8" runat="server" CssClass="tituloCampoForm" Text="Parcelas" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtParcelas" runat="server" CssClass="txt" Width="34px" ToolTip="Parcelas"></asp:TextBox></DIV><DIV style="FLOAT: left; WIDTH: 102px; HEIGHT: 40px"><asp:Label id="Label3" runat="server" CssClass="tituloCampoForm" Text="Valor Parcela (R$)" ForeColor="#C00000" Width="98px"></asp:Label><BR /><asp:TextBox id="txtVlrParcela" runat="server" CssClass="txt" Width="88px" ToolTip="Valor da Parcela"></asp:TextBox></DIV><DIV style="FLOAT: left; WIDTH: 116px; HEIGHT: 40px">
    <asp:Label ID="Label6" runat="server" CssClass="tituloCampoForm" ForeColor="#C00000"
        Text="Data 1ª Parcela"></asp:Label><BR />
    <asp:TextBox ID="txtDataPriParcela" runat="server" CssClass="txt" ToolTip="Data do Crédito"
        Width="99px"></asp:TextBox>
</div>
    <DIV style="FLOAT: left; WIDTH: 72px; HEIGHT: 40px"><asp:Label id="Label10" runat="server" CssClass="tituloCampoForm" Text="Comissão (%)" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtComissao" runat="server" CssClass="txt" Width="56px" ToolTip="Comissão"></asp:TextBox></DIV>&nbsp; <DIV style="FLOAT: left; WIDTH: 334px; HEIGHT: 40px"><asp:Label id="Label9" runat="server" CssClass="tituloCampoForm" Text="Banco" ForeColor="#C00000"></asp:Label><asp:DropDownList id="drpBanco" runat="server" AutoPostBack="True" Width="318px" ToolTip="Banco"></asp:DropDownList></DIV>

<asp:Panel ID="pnlUsu" runat="server" Visible="False">
<DIV style="FLOAT: left; WIDTH: 334px; HEIGHT: 40px; border-left-color: gray; border-bottom-color: gray; border-top-style: solid; border-top-color: gray; border-right-style: solid; border-left-style: solid; border-right-color: gray; border-bottom-style: solid;">
    <asp:Label ID="Label5" runat="server" CssClass="tituloCampoForm" ForeColor="#C00000"
        Text="Usuário que Cadastrou o Empréstimo"></asp:Label>
    <asp:LinkButton ID="lnkUsuario" runat="server" Font-Bold="True" ForeColor="#C00000"
        Width="366px"></asp:LinkButton></div></asp:Panel>
        
    <BR /><BR /><DIV style="WIDTH: 103%" id="div_botao"><DIV style="FLOAT: right; WIDTH: 261px; HEIGHT: 8px; TEXT-ALIGN: right"><asp:Button id="btnSalvar" onclick="btnSalvar_Click" runat="server" CssClass="botaoForm salvar" Text="Salvar" Width="95px"></asp:Button> <asp:Button id="btnNovo" runat="server" CssClass="botaoForm" Text="NOVO Contrato" OnClick="btnNovo_Click"></asp:Button> </DIV><DIV style="FLOAT: left; WIDTH: 126px; HEIGHT: 8px; TEXT-ALIGN: left">&nbsp;<asp:Button id="btnVoltar" runat="server" CssClass="botaoForm" Text="Voltar" Width="107px" OnClientClick="javascript:history.go(-1);"></asp:Button></DIV></DIV></DIV>
</contenttemplate>
        </asp:UpdatePanel>

        
    </div>
</asp:Content>