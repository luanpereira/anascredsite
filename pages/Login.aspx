<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="pages_Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>AnasCred | Login</title>
    
    <script type="text/javascript" src="../recursos/js/jquery-1.4.2.js" ></script>
    <script type="text/javascript" src="../recursos/js/jfuncoes.js" ></script>
    
    <link rel="stylesheet" type="text/css" href="../recursos/css/anascred.css" />
    <link rel="shortcut icon" type="mage/x-icon" href="recursos/img/favicon.ico">
	
</head>
<body style="">    
<form id="form1" runat="server">
  <div id="corpo">
    <div id="login" style="width:274px;">
    <br />
        <h1 class="titulo">Autenticação de Usuário</h1>
        <div class="divLoginCampo" style="width:260px;">
             <div class="divLoginNomeCampo" style="width:65px;">Usuário:</div>   
             <div style="float:left">
             <asp:TextBox ID="txtLogin" runat="server" Width="100px" TabIndex="1" ToolTip="Login"></asp:TextBox></div>                                                                            
        </div>
        <div class="divLoginCampo" style="width:260px;">
             <div class="divLoginNomeCampo" style="width:65px;">Senha:</div>        
             <div style="float:left">
             <asp:TextBox ID="txtSenha" runat="server" TextMode="Password" Width="100px" TabIndex="2" ToolTip="Senha"></asp:TextBox>
             </div>                                                                        
        </div>
        <div class="divLoginCampo" style="text-align:right; width: 170px;">
            &nbsp;<asp:Button ID="btnLogin" runat="server" Text="Entrar" CssClass="botaoForm" />
        </div>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="http://www.anascred.com.br">Ir para o Site</asp:LinkButton></div>    
  </div>
</form>
</body>
</html>
