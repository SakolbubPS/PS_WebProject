<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAddEmp.aspx.cs" Inherits="FullCalendarT.frmAddEmp" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    

    <link href="bootstrap/datetimepicker/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />

    <script src="bootstrap/datetimepicker/jquery-3.6.0.min.js"></script>
    <script src="bootstrap/datetimepicker/bootstrap.min.js"></script>
    <script src="bootstrap/datetimepicker/moment.min.js"></script>
    <script src="bootstrap/datetimepicker/bootstrap-datetimepicker.min.js"></script>

    <script src="fullcalendar/lib/bootstrap-datetimepicker.js"></script>
    <link href="fullcalendar/lib/jquery.datetimepicker.css" rel="stylesheet" />

        <style>
        /* กำหนดขนาดของช่องกรอกข้อมูล */
        input[type="text"] {
            width: 100%;
            padding: 5px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
           <h1>Employee Manage</h1>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" EmptyDataText="ยังไม่มีการจองรถ" Width="90%" ReadOnly="True">
                        <Columns>
                            <asp:BoundField DataField="e_id" HeaderText="ID" />
                            <asp:BoundField DataField="e_workgroup" HeaderText="ทะเบียน" />
                            <asp:BoundField DataField="e_empid" HeaderText="รหัสพนักงาน" />
                            <asp:BoundField DataField="e_fullname" HeaderText="ชื่อ - สกุล" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="e_position" HeaderText="ตำแหน่ง" />
                            <asp:TemplateField HeaderText="จัดการ">
                                <ItemTemplate>
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-primary" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>