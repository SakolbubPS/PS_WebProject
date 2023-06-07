<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TReport.aspx.cs" Inherits="FullCalendarT.TReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="DevExpress.XtraReports.v17.1.Web, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server">
                <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" ReportSourceId="FullCalendarT.XtraReport1">
                </dx:ASPxWebDocumentViewer>
            </asp:Panel>
            <br />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
    </form>
</body>
</html>
