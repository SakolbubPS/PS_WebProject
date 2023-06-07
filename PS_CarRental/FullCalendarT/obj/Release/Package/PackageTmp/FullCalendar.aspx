<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FullCalendar.aspx.cs" Inherits="FullCalendarT.FullCalendar" %>

<html>
<head>
    <title>FullCalendar</title>

    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap/jquery-3.6.0.min.js"></script>
    <script src="./bootstrap/js/bootstrap.bundle.min.js"></script>

    <link href="fullcalendar/lib/main.css" rel="stylesheet" />
    <script src="fullcalendar/lib/moment.min.js"></script>
    <script src="fullcalendar/lib/jquery-3.6.4.min.js"></script>
    <script src="fullcalendar/lib/jquery.min.js"></script>
    <script src="fullcalendar/lib/main.min.js"></script>
    <script src="fullcalendar/examples/js/theme-chooser.js"></script>
    <script src="fullcalendar/lib/locales/th.js"></script>

    <style type="text/css">
        #loading {
            display: none;
            position: absolute;
            top: 50%;
            left: 50%;
            width: 100px;
            height: 100px;
            margin-left: -50px;
            margin-top: -50px;
            text-align: center;
            font-size: 20px;
            z-index: 100;
        }

        #calendar {
            max-width: 100vh;
            height: 100%;
            margin: 40px auto;
            padding: 0 10px;
        }

        .auto-style1 {
            width: 100%;
            height: 100%
        }

        .auto-style2 {
            width: 381px;
        }

        .event-title {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>

</head>
<body>
    <form id="formFullCalendar" runat="server">

        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="c_no" HeaderText="ลำดับ" />
                            <asp:BoundField DataField="c_id" HeaderText="#" />
                            <asp:BoundField DataField="c_license" HeaderText="ทะเบียน" />
                            <asp:BoundField DataField="detail" HeaderText="ลายละเอียด" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="btnBooking" runat="server" Text="จอง" CommandName="Booking" class="btn btn-link" OnClick="btnBooking_Click" CommandArgument='<%# Eval("c_license") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    <div id="loading">Loading..</div>
                    <div id='calendar'></div>
                </td>
            </tr>
        </table>
        <div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="eventModalLabel">รายละเอียดการจอง</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="eventModalBody">
                        <!-- ข้อมูลการจองจะถูกแทรกที่นี่ -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">ปิด</button>
                    </div>
                </div>
            </div>
        </div>

        <%--        <div id="loading">Loading..</div>
        <div id='calendar'></div>--%>

        <asp:HiddenField ID="hdnCId" runat="server" />

    </form>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var calendarEl = document.getElementById('calendar');
            var calendar = new FullCalendar.Calendar(calendarEl, {
                locale: 'th',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                height: '80%',
                initialDate: new Date(),
                navLinks: true,
                editable: false,
                events: function (fetchInfo, successCallback, failureCallback) {
                    $.ajax({
                        url: "FullCalendar.aspx/GetBookingEvents",
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (data) {
                            var events = [];
                            $(data.d).each(function () {
                                events.push({
                                    title: $(this).attr('title'),
                                    start: moment.utc($(this).attr('start')).local().format('YYYY-MM-DDTHH:mm:ss'),
                                    end: moment.utc($(this).attr('end')).local().format('YYYY-MM-DDTHH:mm:ss'),
                                    color: $(this).attr('color'),
                                    purpose: $(this).attr('purpose')
                                });
                            });
                            successCallback(events);
                        },
                        error: function () {
                            alert("ติดต่อห้องคอม");
                        }
                    });
                },
                //eventContent: function (arg) {
                //    return {
                //        html: '<b>(' + moment(arg.event.start).format('DD-MM-YYYY HH:mm') + ' - ' + moment(arg.event.end).format('DD-MM-YYYY HH:mm') + ')</b><br>' + arg.event.title + '<br>' + arg.event.extendedProps.purpose
                //    };
                //},
                eventClick: function (info) {
                    var fullText ='ทะเบียน: <b> ' + info.event.title + '  </b> <br>';
                    fullText += 'วันที่จอง: <b>' + moment(info.event.start).format('DD-MM-YYYY HH:mm') + ' </b> <br>';
                    fullText += 'วันที่คืน: <b>' + moment(info.event.end).format('DD-MM-YYYY HH:mm') + ' </b> <br>';
                    fullText += 'ใช้เพื่อ: <b>' + info.event.extendedProps.purpose +'</b>';

                    $('#eventModalBody').html(fullText);
                    $('#eventModal').modal('show');
                },
                eventMouseEnter: function (info) {
                    info.el.style.transform = 'scale(1.1)';
                    info.el.style.zIndex = 9999;
                },
                eventMouseLeave: function (info) {
                    info.el.style.transform = '';
                    info.el.style.zIndex = '';
                }
            });

            calendar.render();
        });
    </script>
</body>
</html>
