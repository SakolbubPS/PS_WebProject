<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmAdmin.aspx.cs" Inherits="FullCalendarT.frmAdmin" %>

<%@ Register Assembly="DevExpress.Web.v17.1, Version=17.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html>
<head runat="server">
    <title>Car Booking System - Admin Panel</title>

    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap/jquery-3.6.0.min.js"></script>
    <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>
    <link href="fontawesome/css/all.css" rel="stylesheet" />
    <link href="fontawesome/css/fontawesome.css" rel="stylesheet" />
    <style>
        /* กำหนดขนาดของช่องกรอกข้อมูล */
        .input[type="text"] {
            width: 100%;
            padding: 5px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .nav-pills li a:hover {
            background-color: blue;
        }

        #btnBook {
            margin-left: 1100px;
        }

        #btnAddCar {
            margin-left: 1100px;
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

    <script type="text/javascript">
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("ยืนยันการทำรายการ?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
            return confirm_value.value == "Yes";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Manage</h1>
            <br />
            <div class="row">
                <div class="col-md-12">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" EmptyDataText="ยังไม่มีการจองรถ" Width="90%">
                        <Columns>
                            <asp:BoundField DataField="r_id" HeaderText="ID">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="c_id" HeaderText="ทะเบียน">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="e_id" HeaderText="ชื่อผู้จอง">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="r_booking" HeaderText="วันที่จอง" DataFormatString="{0:d}">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="r_return" HeaderText="วันที่คืน" DataFormatString="{0:d}">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="r_porpose" HeaderText="ใช้เพื่อ">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="r_phone" HeaderText="ติดต่อ">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:BoundField DataField="r_approve" HeaderText="อนุมัติ">
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="จัดการ">
                                <ItemTemplate>
                                    <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="Approve" CssClass="btn btn-success" OnClick="btnApprove_Click" CommandArgument='<%# Eval("r_id") %>' />
                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="btn btn-primary" OnClick="btnEdit_Click" CommandArgument='<%# Eval("r_id") %>' />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" CommandArgument='<%# Eval("r_id") %>' />
                                </ItemTemplate>
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:Button runat="server" ID="btnPrint" Text="Print" CommandName="Print" CssClass="btn btn-info" OnClick="btnPrint_Click" CommandArgument='<%# Eval("r_id") %>' />
                                </ItemTemplate>
                                <HeaderStyle BackColor="#663300" ForeColor="White" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:HiddenField ID="hdnRId" runat="server" />
                    <div style="margin-top: 20px;"></div>
                    <asp:Button ID="btnBook" runat="server" Text="จองรถ" CssClass="btn btn-primary" OnClientClick="return openBookingPopup();" />
                    <script type="text/javascript">
                        function openBookingPopup() {
                            var url = "frmBooking.aspx"; // URL ของหน้าต่าง popup
                            var name = "myPopup"; // ชื่อของหน้าต่าง popup
                            var features = "height=720,width=1080"; // ตั้งค่าขนาดของหน้าต่าง popup

                            window.open(url, name, features);
                            return false; // ยกเลิกการ submit ข้อมูล
                        }
                    </script>
                </div>
            </div>
            <hr />
            <br />
            <div class="col-md-12">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" Width="90%" DataKeyNames="c_id" OnRowDataBound="GridView2_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="c_id" HeaderText="ID">
                            <HeaderStyle BackColor="#663300" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_license" HeaderText="ทะเบียน">
                            <HeaderStyle BackColor="#663300" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_brand" HeaderText="ยี่ห้อ">
                            <HeaderStyle BackColor="#663300" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_des" HeaderText="รายะเอียด">
                            <HeaderStyle BackColor="#663300" ForeColor="White" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="สถานะ">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkStatus" runat="server" AutoPostBack="true" OnCheckedChanged="chkStatus_CheckedChanged" />
                            </ItemTemplate>
                            <HeaderStyle BackColor="#663300" ForeColor="White" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="จัดการ">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit2" runat="server" Text="แก้ไข" CommandArgument='<%# Eval("c_id") %>' CommandName="edit" CssClass="btn btn-warning" OnClick="btnEdit2_Click" />
                                <asp:Button ID="btnDelete2" runat="server" Text="ลบ" CommandName="Delete" CssClass="btn btn-danger" OnClick="btnDelete2_Click" CommandArgument='<%# Eval("c_id") %>' />
                            </ItemTemplate>
                            <HeaderStyle BackColor="#663300" ForeColor="White" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:HiddenField ID="hdnCId" runat="server" />
                <div style="margin-top: 20px;"></div>
                <asp:Button ID="btnAddCar" runat="server" Text="เพิ่มรถ" CssClass="btn btn-primary" OnClientClick="return openAddCarPopup();" />
                <script type="text/javascript">
                    function openAddCarPopup() {
                        var url = "frmAddCar.aspx"; // URL ของหน้าต่าง popup
                        var name = "myPopup"; // ชื่อของหน้าต่าง popup
                        var features = "height=720,width=1080"; // ตั้งค่าขนาดของหน้าต่าง popup

                        window.open(url, name, features);
                        return false; // ยกเลิกการ submit ข้อมูล
                    }
                </script>
            </div>
            <hr />
            <br />
        </div>
    </form>
</body>
</html>
