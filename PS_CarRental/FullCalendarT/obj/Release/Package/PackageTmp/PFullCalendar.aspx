<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PFullCalendar.aspx.cs" Inherits="FullCalendarT.PFullCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="~/img/CarRental.ico" />
    <style>
        html, body {
            overflow: hidden;
        }
        .bg-dark {
            background: #5d3519 !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row flex-nowrap">
            <div class="bg-dark col-auto col-sm col-md col-lg d-flex flex-column justify-content-between">
                <div class="bg-dark p-2">
                    <ul class=" nav nav-pills flex-column mt-4">
                        <li class="nav-item py-2 py-sm-0">
                            <a href="PFullCalendar.aspx" class="nav-link text-white">
                                <i class="fs-5 fa-solid fa-house"></i><span class="fs-4 ms-2 d-none d-sm-inline">Home</span>
                            </a>
                        </li>
                        <li class="nav-item py-2 py-sm-0">
                            <a href="PBooking.aspx" class="nav-link text-white">
                                <i class="fs-5 fa-sharp fa-solid fa-bookmark"></i><span class="fs-4 ms-2 d-none d-sm-inline">Booking</span>
                            </a>
                        </li>
                        <li class="nav-item py-2 py-sm-0">
                            <a href="PAddCar.aspx" class="nav-link text-white">
                                <i class="fs-5 fa-solid fa-car"></i><span class="fs-4 ms-2 d-none d-sm-inline">Car</span>
                            </a>
                        </li>
                        <li class="nav-item py-2 py-sm-0">
                            <a href="PAdmin.aspx" class="nav-link text-white">
                                <i class="fs-5 fa-solid fa-person"></i><span class="fs-4 ms-2 d-none d-sm-inline">Admin</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <iframe id="calendar-iframe" class="flex-grow-1" src="FullCalendar.aspx" height="100%" width="100%"></iframe>
        </div>
    </div>
    <script>
        // เมื่อหน้าจอโหลดเสร็จ กำหนดความสูงและความกว้างของ iframe ให้เท่ากับความสูงและความกว้างของหน้าจอ
        window.onload = function () {
            var iframe = document.getElementById("calendar-iframe");
            iframe.style.width = window.innerWidth + "px";
            iframe.style.height = window.innerHeight + "px";
        };
        // เมื่อหน้าจอถูกขยายหรือย่อ กำหนดความสูงและความกว้างของ iframe ให้เท่ากับความสูงและความกว้างของหน้าจอใหม่
        window.onresize = function () {
            var iframe = document.getElementById("calendar-iframe");
            iframe.style.width = window.innerWidth + "px";
            iframe.style.height = window.innerHeight + "px";
        };
    </script>
</asp:Content>
