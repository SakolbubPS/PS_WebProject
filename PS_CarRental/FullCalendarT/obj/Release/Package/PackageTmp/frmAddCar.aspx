<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAddCar.aspx.cs" Inherits="FullCalendarT.frmAddCar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking Form</title>

    <link href="bootstrap/datetimepicker/bootstrap.min.css" rel="stylesheet" />
    <link href="bootstrap/datetimepicker/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />

    <script src="bootstrap/datetimepicker/jquery-3.6.0.min.js"></script>
    <script src="bootstrap/datetimepicker/bootstrap.min.js"></script>
    <script src="bootstrap/datetimepicker/moment.min.js"></script>
    <script src="bootstrap/datetimepicker/bootstrap-datetimepicker.min.js"></script>

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
            <div class="row">
                <div class="col-md-12">
                    <h2>AddCar</h2>
                    <hr />
                    <div class="form-group">
                        <label for="txtLicensePlate">เลขทะเบียน:</label>
                        <asp:TextBox ID="txtLicensePlate" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtBrand">ยี่ห้อ:</label>
                        <asp:TextBox ID="txtBrand" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtTypeGear">ประเภทเกียร์:</label>
                        <asp:TextBox ID="txtTypeGear" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtTypeDoor">ประเภทประตู:</label>
                        <asp:TextBox ID="txtTypeDoor" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="txtTypeWheelDrive">ประเภทการขับเคลื่อน:</label>
                        <asp:TextBox ID="txtTypeWheelDrive" runat="server" class="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="ddlDepartment">รถของแผนก:</label>
                        <asp:DropDownList ID="ddlDepartment" runat="server" class="form-control">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" class="btn btn-primary"/>
                    <asp:Button ID="btnCan" runat="server" Text="Cancel" class="btn btn-danger" OnClick="btnCan_Click" PostBackUrl="~/FullCalendar.aspx"/>
                    <br /><br />
                    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>