<%@ Page Language="VB" MasterPageFile="~/ANASCRED.master" AutoEventWireup="false" CodeFile="PesquisarContratos.aspx.vb" Inherits="pages_administrativo_PesquisarContratos" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <cc1:ToolkitScriptManager id="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>

      <div id="div_corpo_form">
        <div id="div_titulo_form">
        Pesquisar Contratos
        </div>
        <div style="WIDTH: 715px" id="div_form">
        <DIV style="FLOAT: left; WIDTH: 689px; HEIGHT: 40px"><asp:Label id="Label6" runat="server" CssClass="tituloCampoForm" Text="Nome"></asp:Label><BR 
/><asp:TextBox id="txtNome" runat="server" CssClass="txt" Width="387px"></asp:TextBox> 
</DIV><DIV style="FLOAT: left; WIDTH: 156px; HEIGHT: 40px"><asp:Label id="Label1" runat="server" CssClass="tituloCampoForm" Text="CPF"></asp:Label><BR 
/><asp:TextBox id="txtCpf" runat="server" Width="139px" CssClass="txt"></asp:TextBox> </DIV><DIV style="FLOAT: left; WIDTH: 155px; HEIGHT: 40px"><asp:Label id="Label2" runat="server" CssClass="tituloCampoForm" Text="RG"></asp:Label><BR 
/><asp:TextBox id="txtRG" runat="server" Width="139px" CssClass="txt"></asp:TextBox> </DIV><DIV style="FLOAT: left; WIDTH: 360px; PADDING-TOP: 15px; HEIGHT: 12px"><asp:Button id="btnPesquisar" onclick="btnPesquisar_Click" runat="server" CssClass="botaoForm pesquisar" Text="Pesquisar"></asp:Button> 
<asp:Button id="btnNovoPaciente" onclick="btnNovoPaciente_Click" runat="server" CssClass="botaoForm" Text="Novo Contrato"></asp:Button> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
  </DIV>
            <asp:Label ID="lblNaoDados" runat="server" Font-Bold="True" ForeColor="#C00000" Text="A PESQUISA NÃO RETORNOU DADOS"
                Visible="False" Width="562px"></asp:Label>
              <DIV style="FLOAT: left; WIDTH: 800px">
                <asp:GridView ID="gvCliente" runat="server"
                    AllowPaging="True" AutoGenerateColumns="False" Caption="Resultado da Pesquisa"
                    CaptionAlign="Top" CssClass="tituloCampoForm" DataKeyNames="AC02CODIGO" ForeColor="#333333"
                    GridLines="Horizontal" PageSize="20" Width="800px">
                    <RowStyle BackColor="#E3EAEB" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="btnPesquisar" runat="server" CommandArgument='<%# eval("AC02CODIGO") %>'
                                    CommandName="Edit" ImageUrl="~/recursos/img/search.png" ToolTip="EDITAR CONTRATO" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="AC01NOME" HeaderText="Nome">
                            <HeaderStyle Height="10px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC01CPF" DataFormatString="{0:###.###.###-##}" HeaderText="CPF">
                            <HeaderStyle Height="10px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC02DATACRD" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Data do Cr&#233;dito">
                            <HeaderStyle Height="10px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC02VALORCRD" DataFormatString="{0:c}" HeaderText="Cr&#233;dito">
                            <HeaderStyle Height="10px" HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="AC04NOME" HeaderText="Banco" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="btnExcluir" runat="server" CommandArgument='<%# eval("AC02CODIGO") %>'
                                    CommandName="Delete" ImageUrl="~/recursos/img/cancel.png" ToolTip="Excluir Contrato" OnClientClick="return confirm('DESEJA REALEMTE EXCLUIR O CONTRATO? NÃO SERÁ MAIS POSSÍVEL RECUPERÁ-LO.');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                
            </div> 
        </div>
      </div>    

</asp:Content>