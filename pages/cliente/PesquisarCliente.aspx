<%@ Page Language="VB" MasterPageFile="~/ANASCRED.master" AutoEventWireup="false" CodeFile="PesquisarCliente.aspx.vb" Inherits="pages_cliente_PesquisarCliente" %>

<%@ Register Assembly="System.Web.Extensions" Namespace="System.Web.UI" TagPrefix="asp" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
// <!CDATA[

function btnPrint_onclick() {
    
  /*var prtContent = document.getElementById('<%= gvCliente.ClientID %>'); 
  var WinPrint = window.open('','','letf=0,top=0,width=1,height=1,toolbar=0,scrollbars=0,status=0'); 
  WinPrint.document.write('<link rel="stylesheet" type="text/css" href="recursos/css/anascred.css" media="print" />'+prtContent.innerHTML); 
  WinPrint.document.close();
  WinPrint.focus(); 
  WinPrint.print(); 
  WinPrint.close();     */
}

// ]]>
</script>

    <div id="div_corpo_form">
        <div id="div_titulo_form">
            Pesquisa de Clientes
        </div>
        <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </cc1:ToolkitScriptManager>
        <div class="tabelaResultado">
            <asp:UpdatePanel id="UpdatePanel1" runat="server">
                <contenttemplate>
<DIV style="WIDTH: 711px" id="div_form"><DIV style="FLOAT: left; WIDTH: 579px; HEIGHT: 40px"><asp:Label id="Label6" runat="server" CssClass="tituloCampoForm" Text="Nome"></asp:Label><BR /><asp:TextBox id="txtNome" runat="server" CssClass="txt" Width="387px"></asp:TextBox> </DIV><DIV style="FLOAT: left; WIDTH: 156px; HEIGHT: 40px"><asp:Label id="Label1" runat="server" CssClass="tituloCampoForm" Text="CPF"></asp:Label><BR /><asp:TextBox id="txtCpf" runat="server" CssClass="txt" Width="139px" MaxLength="14"></asp:TextBox> </DIV><DIV style="FLOAT: left; WIDTH: 151px; HEIGHT: 40px"><asp:Label id="Label2" runat="server" CssClass="tituloCampoForm" Text="RG"></asp:Label><BR /><asp:TextBox id="txtRG" runat="server" CssClass="txt" Width="139px"></asp:TextBox> </DIV><DIV style="FLOAT: left; WIDTH: 325px; PADDING-TOP: 15px; HEIGHT: 12px"><asp:Button id="btnPesquisar" onclick="btnPesquisar_Click" runat="server" CssClass="botaoForm pesquisar" Text="Pesquisar"></asp:Button> <asp:Button id="btnNovoPaciente" onclick="btnNovoPaciente_Click" runat="server" CssClass="botaoForm" Text="Novo Cliente"></asp:Button> <asp:Button id="btnContrato" onclick="btnContrato_Click" runat="server" CssClass="botaoForm" Text="Cadastrar Novo Contrato" Visible="False"></asp:Button>&nbsp;&nbsp; </DIV><asp:Label id="lblNaoDados" runat="server" Text="A PESQUISA NÃO RETORNOU DADOS" Width="562px" Visible="False" ForeColor="#C00000" Font-Bold="True"></asp:Label> <DIV style="FLOAT: left; WIDTH: 800px"><asp:GridView id="gvCliente" runat="server" CssClass="tituloCampoForm" Width="800px" ForeColor="#333333" DataKeyNames="AC01CODIGO" PageSize="20" GridLines="Horizontal" CaptionAlign="Top" Caption="Resultado da Pesquisa" AutoGenerateColumns="False" AllowPaging="True">
<RowStyle BackColor="#E3EAEB"></RowStyle>
<Columns>
<asp:TemplateField><ItemTemplate>
<asp:ImageButton id="btnPesquisar" runat="server" CommandArgument='<%# eval("AC01CODIGO") %>' CommandName="Edit" ImageUrl="~/recursos/img/search.png" ToolTip="EDITAR CLIENTE"></asp:ImageButton> 
</ItemTemplate>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:TemplateField>
<asp:TemplateField><ItemTemplate>
<asp:ImageButton id="btnSeleciona" runat="server" CommandArgument='<%# eval("AC01CODIGO") %>' CommandName="Select" ImageUrl="~/recursos/img/ok.png" ToolTip="SELECIONAR CLIENTE"></asp:ImageButton>
</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="AC01NOME" HeaderText="Nome">
<HeaderStyle Height="10px"></HeaderStyle>
</asp:BoundField>
<asp:BoundField DataField="AC01CPF" DataFormatString="{0:###.###.###-##}" HeaderText="CPF">
<HeaderStyle HorizontalAlign="Center" Height="10px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="AC01DATANASC" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Nascimento">
<HeaderStyle HorizontalAlign="Center" Height="10px"></HeaderStyle>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
</asp:BoundField>
</Columns>

<FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></FooterStyle>

<PagerStyle HorizontalAlign="Center" BackColor="#666666" ForeColor="White"></PagerStyle>

<SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

<HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White"></HeaderStyle>

<EditRowStyle BackColor="#7C6F57"></EditRowStyle>

<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>
</asp:GridView>
    &nbsp;
</DIV></DIV>
</contenttemplate>
            </asp:UpdatePanel>
         </div>  
    </div>
</asp:Content>