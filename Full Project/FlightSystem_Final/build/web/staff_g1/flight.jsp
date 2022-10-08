<%-- 
    Document   : flight
    Created on : Oct 8, 2022, 11:13:47 AM
    Author     : dhanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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

                                    <form class="forms-sample" id="contact" name="add_flight" method="POST" action="../AddFlightServlet">
                                        <div class="form-group">
                                            <label for="exampleInputName1">Country (From)</label>
                                            <select name="from" class="form-control">
                                                <option value="0">Please Select</option>

                                                <%                                    try {
                                                        Statement statement = connection.createStatement();
                                                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.country;");

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
                                        <div class="form-group" >
                                            <label for="exampleInputEmail3">Country (To)</label>
                                            <select name="to"  class="form-control">
                                                <option value="0">Please Select</option>
                                                <%                                    try {
                                                        Statement statement = connection.createStatement();
                                                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.country;");

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
                                        <div class="form-group">
                                            <label for="exampleSelectGender">Flight Type</label>
                                            <select name="type" class="form-control">
                                                <option value="0">Please Select</option>
                                                <option value="round">Round Trip</option>
                                                <option value="one">One Way Trip</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleSelectGender">Flight Date</label>
                                            <input name="flight_date" type="date" class="form-control" id="contact_name" placeholder="Shedule ID" required >
                                        </div>

                                        <button type="submit" class="btn btn-primary mr-2">Add Flight</button>
                                        <button class="btn btn-light">Cancel</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="container-lg">
                            <div class="table-responsive">
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-8"><h2>Flight <b>Details</b></h2></div>
                                            <div class="col-sm-4">

                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Flight Id</th>
                                                <th>From Id</th>
                                                <th>To Id</th>
                                                <th>Flight Type</th>
                                                <th>Date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                    try {
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.flight;");
                                                    String type = "";

                                                    while (resultSet.next()) {
                                                        if (resultSet.getString(4).equals("round")) {
                                                            type = "Round way trip";
                                                        } else {
                                                            type = "One way trip";
                                                        }
                                            %>
                                            <tr>
                                                <td><%=resultSet.getInt(1)%></td>
                                                <td><%=resultSet.getInt(2)%></td>
                                                <td><%=resultSet.getInt(3)%></td>
                                                <td><%=type%></td>
                                                <td><%=resultSet.getString(5)%></td>
                                                <td>
                                                    <a href="./viewFlight.jsp?id=<%=resultSet.getInt(1)%>">
                                                        <input type="button" name="view" value="View Flight">
                                                    </a>
                                                    <a href="./updateFlight.jsp?id=<%=resultSet.getInt(1)%>&from_id=<%=resultSet.getInt(2)%>&to_id=<%=resultSet.getInt(3)%>">
                                                        <input type="button" name="update" value="Update Flight">
                                                    </a>
                                                    <a href="../DeleteFlightServlet?id=<%=resultSet.getInt(1)%>">
                                                        <input type="button" name="delete" value="Remove Flight">
                                                    </a>
                                                </td>
                                            </tr>

                                            <% }
                                                } catch (Exception e) {
                                                    out.print(e.getMessage());
                                                }

                                            %>


                                        </tbody>
                                    </table>
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
</html>
