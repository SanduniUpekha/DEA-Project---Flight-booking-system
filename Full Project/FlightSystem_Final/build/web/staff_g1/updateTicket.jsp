<%-- 
    Document   : updateTicket
    Created on : Oct 8, 2022, 5:01:05 PM
    Author     : dhanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>SpaceLand</title>
        <!-- base:css -->
        <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="css/style.css">
        <link href="table.css" rel="stylesheet">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
                var actions = $("table td:last-child").jsp();
                // Append table with add row form on add new button click
                $(".add-new").click(function () {
                    $(this).attr("disabled", "disabled");
                    var index = $("table tbody tr:last-child").index();
                    var row = '<tr>' +
                            '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                            '<td><input type="text" class="form-control" name="department" id="department"></td>' +
                            '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
                            '<td>' + actions + '</td>' +
                            '</tr>';
                    $("table").append(row);
                    $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
                    $('[data-toggle="tooltip"]').tooltip();
                });
                // Add row on add button click
                $(document).on("click", ".add", function () {
                    var empty = false;
                    var input = $(this).parents("tr").find('input[type="text"]');
                    input.each(function () {
                        if (!$(this).val()) {
                            $(this).addClass("error");
                            empty = true;
                        } else {
                            $(this).removeClass("error");
                        }
                    });
                    $(this).parents("tr").find(".error").first().focus();
                    if (!empty) {
                        input.each(function () {
                            $(this).parent("td").jsp($(this).val());
                        });
                        $(this).parents("tr").find(".add, .edit").toggle();
                        $(".add-new").removeAttr("disabled");
                    }
                });
                // Edit row on edit button click
                $(document).on("click", ".edit", function () {
                    $(this).parents("tr").find("td:not(:last-child)").each(function () {
                        $(this).jsp('<input type="text" class="form-control" value="' + $(this).text() + '">');
                    });
                    $(this).parents("tr").find(".add, .edit").toggle();
                    $(".add-new").attr("disabled", "disabled");
                });
                // Delete row on delete button click
                $(document).on("click", ".delete", function () {
                    $(this).parents("tr").remove();
                    $(".add-new").removeAttr("disabled");
                });
            });
        </script>
    </head>
    <body>
        <%
            int sessionId = 0;

            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }

                if (c.getName().equals("login_type")) {

                    String loginType = c.getValue();
                    if (loginType.equals("admin")) {
                        response.sendRedirect("../admin/index.jsp");
                    }

                    if (loginType.equals("staff_g2")) {
                        response.sendRedirect("../staff_g2/index.jsp");
                    }
                }
            }

            if (sessionId == 0) {
                response.sendRedirect("log.jsp");
            }
        %>

        <%                                DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

        %>
        <div class="container-scroller d-flex">
            <!-- partial:./partials/_sidebar.jsp -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <li class="nav-item sidebar-category">
                    <center><img src="images/kindpng_2267500.png" height="60" width="60"></center>
                    <span></span>
                    </li><br>
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">
                            <i class="mdi mdi-view-quilt menu-icon"></i>
                            <span class="menu-title">Dashboard</span>

                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="user.jsp">
                            <i class="mdi mdi mdi-account-plus menu-icon"></i>
                            <span class="menu-title">Manage users</span>
                        </a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="flight.jsp">
                            <i class="mdi mdi-airplane menu-icon"></i>
                            <span class="menu-title">Manage Flights</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ticket.jsp">
                            <i class="mdi mdi-cards-outline menu-icon"></i>
                            <span class="menu-title">Manage Tickets</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../ManagementLogOutServlet?id=<%=sessionId%>">
                            <i class=mdi mdi-account-remove menu-icon"></i>
                            <span class="menu-title">Logout</span>
                        </a>
                    </li>



                </ul>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:./partials/_navbar.jsp -->
                <nav class="navbar col-lg-12 col-12 px-0 py-0 py-lg-4 d-flex flex-row">
                    <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
                        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
                            <span class="mdi mdi-menu"></span>
                        </button>
                        <div class="navbar-brand-wrapper">
                            <a class="navbar-brand brand-logo" href="index.jsp" style="font-size: 30px; color: black; font-weight: bold">Pheonix Airline PVT (Staff G1)</a>
                            <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/logo-mini.svg" alt="logo"/></a>
                        </div>
                        <h4 class="font-weight-bold mb-0 d-none d-md-block mt-1"></h4>
                        <ul class="navbar-nav navbar-nav-right">
                            <li class="nav-item">
                                <h4 class="mb-0 font-weight-bold d-none d-xl-block"></h4>
                            </li>

                            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
                                <span class="mdi mdi-menu"></span>
                            </button> 


                    </div>




                </nav>
                <!-- partial -->
                <div class="main-panel">        
                    <div class="content-wrapper">
                        <div class="row">


                        </div>
                        <div class="col-12 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Flight details</h4>
                                    <%
                                        PreparedStatement preparedStatement;
                                        int ticketId = Integer.parseInt(request.getParameter("id"));

                                    %>
                                    <%                                    try {
                                            Statement statement = connection.createStatement();

                                            ResultSet resultSet = statement.executeQuery("select ticket.id, `user`.full_name, `day`.day, `time`.time, ticket.type from ticket join `user` on `user`.id = ticket.user_id join schedule on schedule.id = ticket.schedule_id join `day` on `day`.id = schedule.day_id join `time` on `time`.id = ticket.time_id where ticket.id = " + ticketId + ";");
                                            resultSet.next();
                                    %>
                                    <form name="ticket_update" method="POST" action="../UpdateTicketServlet">
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Ticket Id</label>
                                            <input name="ticket_id" type="text" class="form-control" id="contact_name" value="<%=resultSet.getInt(1)%>" placeholder="Shedule ID" readonly >
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleSelectGender">User's name</label>
                                            <input name="flight_date" type="text" class="form-control" id="contact_name" value="<%=resultSet.getString(2)%>" placeholder="Shedule ID" readonly>
                                        </div>

                                        <% } catch (Exception e) {
                                                out.print(e.getMessage());
                                            }

                                        %>

                                        <div class="form-group">
                                            <label for="exampleSelectGender">Ticket Type</label>
                                            <select class="form-control" id="sel1" name="type">
                                                <option value="0">Please Select</option>
                                                <option value="economy">Economy Class</option>
                                                <option value="business">Business Class</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="sel1">Flight Time (select)</label>
                                            <select class="form-control" id="sel1" name="time">
                                                <option value="">Please Select</option>
                                                <option value="06.30">6.30 A.M</option>
                                                <option value="14.00">2.00 P.M</option>
                                                <option value="22.30">10.30 P.M</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleSelectGender">Day</label>
                                            <select class="form-control" id="sel1" name="day">
                                                <option value="0">Please Select</option>
                                                <%                                    try {
                                                        Statement statement = connection.createStatement();
                                                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.day;");

                                                        while (resultSet.next()) {
                                                %>
                                                <option value="<%=resultSet.getInt(1)%>"><%=resultSet.getString(2)%></option>
                                                <% }
                                                    } catch (Exception e) {
                                                        out.print(e.getMessage());
                                                    }

                                                %>

                                            </select>
                                        </div>

                                        <button type="submit" class="btn btn-primary mr-2">Update Ticket</button>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
                <!-- partial:../../partials/_footer.jsp -->

                <!-- partial -->
            </div>
            <!-- main-panel ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- base:js -->
    <script src="../../vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="../../js/off-canvas.js"></script>
    <script src="../../js/hoverable-collapse.js"></script>
    <script src="../../js/template.js"></script>
    <!-- endinject -->
    <!-- plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- Custom js for this page-->
    <script src="../../js/file-upload.js"></script>
    <!-- End custom js for this page-->
    <script src="test.js"></script>
    <script>
            var myInput = document.getElementById("psw");
            var letter = document.getElementById("letter");
            var capital = document.getElementById("capital");

            var length = document.getElementById("length");

            // When the user clicks on the password field, show the message box
            myInput.onfocus = function () {
                document.getElementById("message").style.display = "block";
            }

            // When the user clicks outside of the password field, hide the message box
            myInput.onblur = function () {
                document.getElementById("message").style.display = "none";
            }

            // When the user starts to type something inside the password field
            myInput.onkeyup = function () {
                // Validate lowercase letters
                var lowerCaseLetters = /[a-z]/g;
                if (myInput.value.match(lowerCaseLetters)) {
                    letter.classList.remove("invalid");
                    letter.classList.add("valid");
                } else {
                    letter.classList.remove("valid");
                    letter.classList.add("invalid");
                }

                // Validate capital letters
                var upperCaseLetters = /[A-Z]/g;
                if (myInput.value.match(upperCaseLetters)) {
                    capital.classList.remove("invalid");
                    capital.classList.add("valid");
                } else {
                    capital.classList.remove("valid");
                    capital.classList.add("invalid");
                }


                // Validate length
                if (myInput.value.length >= 8) {
                    length.classList.remove("invalid");
                    length.classList.add("valid");
                } else {
                    length.classList.remove("valid");
                    length.classList.add("invalid");
                }
            }
    </script>
</body>
</body>
</html>
