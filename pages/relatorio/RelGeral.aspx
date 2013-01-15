<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RelGeral.aspx.vb" Inherits="pages_relatorio_RelGeral" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Relatórios AnasCred</title>
    <link rel="stylesheet" type="text/css" href="../../recursos/css/anascred.css" />
    <link rel="shortcut icon" type="mage/x-icon" href="../../recursos/img/favicon.ico">
        
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Panel ID="Panel2" runat="server" Width="785px">
                <asp:Panel ID="Panel3" runat="server" Width="779px">
                    <div id="Div1" style="float: left; width: 195px"><asp:Image ID="Image1" runat="server" ImageUrl="~/recursos/img/anascredMini.png" /></div>
                    <div id="Div2" style="width: 294px; font-weight: bold; float: left;">
                        <br />
                        ANASCRED - SEU CRÉDITO FÁCIL</div><div id="Div4" style="width: 293px; font-weight: bold; float: left;">
                        <br />
                        RELATÓRIO DE CLIENTES RENOVAÇÃO</div>
                        <DIV style="FLOAT: right; WIDTH: 194px" id="Div3">Data: <asp:Label id="lblData" runat="server" Text="Label" CssClass="tituloCampoForm"></asp:Label></DIV>
                </asp:Panel> 
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                <asp:Panel ID="Panel1" runat="server" Width="776px">
                    <br />
                    <asp:Label ID="Label1" runat="server" CssClass="tituloCampoForm" Text="Banco:"></asp:Label>
                    <asp:Label ID="lblBanco" runat="server" Text="Label"></asp:Label><br />
                    <asp:Label ID="Label2" runat="server" CssClass="tituloCampoForm" Text="Período:"></asp:Label>
                    <asp:Label ID="lblPeriodo" runat="server" Text="Label"></asp:Label><br />
                    <asp:Label ID="Label3" runat="server" CssClass="tituloCampoForm" Text="Total de Registros:"></asp:Label>
                    <asp:Label ID="lblTotReg" runat="server" Text="Label"></asp:Label>
                    <input id="Button1" class="botaoForm" style="float: right; width: 116px" type="button"
                        value="Imprimir" onclick="window.print();" /></asp:Panel>
                    <br />
                <asp:GridView ID="gvCliente" runat="server" AutoGenerateColumns="False" CssClass="tituloCampoForm"  ForeColor="#333333"
                    GridLines="Horizontal" Width="780px">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:BoundField DataField="AC01NOME" HeaderText="Nome">
                            <HeaderStyle Height="10px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC01CPF" DataFormatString="{0:###.###.###-##}" HeaderText="CPF">
                            <HeaderStyle Height="10px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC01FONERES" HeaderText="Tel. Residencial">
                            <HeaderStyle Height="10px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC01FONECOM" HeaderText="Tel. Comercial">
                            <HeaderStyle Height="10px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC01FONECEL" HeaderText="Tel. Celular" />
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                </asp:Panel>
                &nbsp; &nbsp;<br />
            </ContentTemplate>
        </asp:UpdatePanel>
    
    </div>
    </form>
</body>
</html>
