<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ExibirRelatorio.aspx.vb" Inherits="pages_relatorio_ExibirRelatorio" %>

<%@ Register Assembly="ActiveReports.Web, Version=5.2.2.595, Culture=neutral, PublicKeyToken=cc4967777c49a3ff"
    Namespace="DataDynamics.ActiveReports.Web" TagPrefix="ActiveReportsWeb" %>
<%--
<%@ Register Assembly="ActiveReports.Web, Version=5.2.0.397, Culture=neutral, PublicKeyToken=cc4967777c49a3ff"
    Namespace="DataDynamics.ActiveReports.Web" TagPrefix="ActiveReportsWeb" %>--%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Relatórios AnasCred</title>
</head>
<body>
    <form id="form1" runat="server">
        <ActiveReportsWeb:WebViewer ID="WebViewer1" runat="server" height="650px" width="750px" ViewerType="HtmlViewer" BorderStyle="Solid" BorderWidth="2px" SlidingExpirationInterval="00:00:00">
            <PdfExportOptions Author="AnasCred" DisplayTitle="True" Title="Relat&#243;rios AnasCred" />
        </ActiveReportsWeb:WebViewer>
<%--        <activereportsweb:webviewer id="WebViewer" runat="server" height="650px" width="750px" ViewerType="AcrobatReader" BorderStyle="Solid" BorderWidth="2px" SlidingExpirationInterval="00:00:00">
            <PdfExportOptions Author="Cl&#237;nicas - UniCEUMA" DisplayTitle="True" Title="Relat&#243;rios Cl&#237;nicas - UniCEUMA" />
        </activereportsweb:webviewer>   --%>     
    </form>
</body>
</html>
