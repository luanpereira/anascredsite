<%@ Page Language="VB" MasterPageFile="~/ANASCRED.master" AutoEventWireup="false" CodeFile="Marketing.aspx.vb" Inherits="pages_cliente_Marketing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>


<asp:Content ID="contente" runat ="server" ContentPlaceHolderID="ContentPlaceHolder1">
<div id="div_corpo_form">
    <div id="div_titulo_form">
        Lista de Clientes para Marketing
    </div>
    <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
<DIV style="WIDTH: 449px" id="div_form"><DIV style="FLOAT: left; WIDTH: 446px; HEIGHT: 40px"><asp:Label id="Label9" runat="server" CssClass="tituloCampoForm" Text="Banco" ForeColor="#C00000"></asp:Label><asp:DropDownList id="drpBanco" runat="server" AutoPostBack="True" Width="441px" ToolTip="Banco"></asp:DropDownList></DIV><cc1:CalendarExtender id="datCredito" runat="server" CssClass="calendario" TargetControlID="txtInicial" Format="dd/MM/yyyy"></cc1:CalendarExtender> <cc1:CalendarExtender id="CalendarExtender1" runat="server" CssClass="calendario" TargetControlID="txtFinal" Format="dd/MM/yyyy"></cc1:CalendarExtender> <DIV style="FLOAT: left; WIDTH: 116px; HEIGHT: 40px"><asp:Label id="Label13" runat="server" CssClass="tituloCampoForm" Text="Data Inicial" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtInicial" runat="server" CssClass="txt" Width="99px" ToolTip="Data Inicial"></asp:TextBox> </DIV> <DIV style="FLOAT: left; WIDTH: 116px; HEIGHT: 40px"><asp:Label id="Label1" runat="server" CssClass="tituloCampoForm" Text="Data Final" ForeColor="#C00000"></asp:Label><BR /><asp:TextBox id="txtFinal" runat="server" CssClass="txt" Width="99px" ToolTip="Data Final"></asp:TextBox> </DIV> <BR /><BR /><BR /><asp:Button id="btnImprimir" onclick="btnImprimir_Click" runat="server" CssClass="botaoForm" Text="Gerar Lista" Width="147px"></asp:Button></DIV>
</ContentTemplate>
    </asp:UpdatePanel>
</div> 
</asp:Content>