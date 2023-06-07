<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmBooking.aspx.cs" Inherits="FullCalendarT.frmBooking" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Form</title>


    <link href="bootstrap/datetimepicker/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />

    <script src="bootstrap/datetimepicker/jquery-3.6.0.min.js"></script>
    <script src="bootstrap/datetimepicker/bootstrap.min.js"></script>
    <script src="bootstrap/datetimepicker/moment.min.js"></script>
    <script src="bootstrap/datetimepicker/bootstrap-datetimepicker.min.js"></script>

    <script src="fullcalendar/lib/bootstrap-datetimepicker.js"></script>
    <link href="fullcalendar/lib/jquery.datetimepicker.css" rel="stylesheet" />

    <link href="Select/select2.min.css" rel="stylesheet" />
    <script src="Select/select2.min.js"></script>


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

    <script type="text/javascript">
        $(function () {
            $('#txtBookingDateTime').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:00'
            });
            $('#txtReturnDateTime').datetimepicker({
                format: 'YYYY-MM-DD HH:mm:00'
            });
        });
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Booking Form</h2>
                    <hr />
                    <div class="form-group">
                        <label for="DdlLicensePlate">ทะเบียน:</label><br />
                        <asp:DropDownList ID="DdlLicensePlate" runat="server" CssClass="searchable-dropdown" class="form-control" AutoPostBack="True" Width="100%"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="DdlName">ชื่อผู้จอง:</label><br />
                        <asp:DropDownList ID="DdlName" runat="server" class="form-control" CssClass="searchable-dropdown" AutoPostBack="True" Width="100%"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="txtBookingDateTime">เวลาจอง:</label>
                        <div class="input-group date">
                            <asp:TextBox ID="txtBookingDateTime" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtReturnDateTime">เวลาคืน:</label>
                        <div class="input-group date">
                            <asp:TextBox ID="txtReturnDateTime" runat="server" class="form-control"></asp:TextBox>
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPurpose">ใช้เพื่อ:</label>
                        <asp:TextBox ID="txtPurpose" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtPhone">เบอร์โทรแผนก:</label>
                        <asp:TextBox ID="txtPhone" runat="server" class="form-control"></asp:TextBox>                       
                    </div>
                    <br />
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-success" />
                    <asp:Button ID="btnCancle" runat="server" Text="Cancle" OnClick="btnCancle_Click" class="btn btn-danger" />
                    <br />
                    <br />
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
<script>
    $(document).ready(function () {
        $('.searchable-dropdown').select2();
    });
</script>
</html>