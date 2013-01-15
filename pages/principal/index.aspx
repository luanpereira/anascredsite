<%@ Page Language="VB" MasterPageFile="~/ANASCRED.master" AutoEventWireup="false" CodeFile="index.aspx.vb" Inherits="pages_principal_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="div_corpo_form">
        <div id="div_titulo_form">
            Seja Bem-Vindo, <% Response.Write(DateTime.Now)%>
        </div>
    </div>
</asp:Content>