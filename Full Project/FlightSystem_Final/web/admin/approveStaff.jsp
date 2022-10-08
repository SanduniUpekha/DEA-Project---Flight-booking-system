<%-- 
    Document   : approveStaff
    Created on : Oct 8, 2022, 10:07:17 AM
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
        <title>Pheonix Airline PVT - Approve Staff</title>
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
            var ALERT_TITLE = "Alert";
            var ALERT_BUTTON_TEXT = "Ok";

            if (document.getElementById) {
                window.alert = function (txt) {
                    createCustomAlert(txt);
                }
            }

            function createCustomAlert(txt) {
                d = document;

                if (d.getElementById("modalContainer"))
                    return;

                mObj = d.getElementsByTagName("body")[0].appendChild(d.createElement("div"));
                mObj.id = "modalContainer";
                mObj.style.height = d.documentElement.scrollHeight + "px";

                alertObj = mObj.appendChild(d.createElement("div"));
                alertObj.id = "alertBox";
                if (d.all && !window.opera)
                    alertObj.style.top = document.documentElement.scrollTop + "px";
                alertObj.style.left = (d.documentElement.scrollWidth - alertObj.offsetWidth) / 2 + "px";
                alertObj.style.visiblity = "visible";

                h1 = alertObj.appendChild(d.createElement("h1"));
                h1.appendChild(d.createTextNode(ALERT_TITLE));

                msg = alertObj.appendChild(d.createElement("p"));
                //msg.appendChild(d.createTextNode(txt));
                msg.innerHTML = txt;

                btn = alertObj.appendChild(d.createElement("a"));
                btn.id = "closeBtn";
                btn.appendChild(d.createTextNode(ALERT_BUTTON_TEXT));
                btn.href = "#";
                btn.focus();
                btn.onclick = function () {
                    removeCustomAlert();
                    return false;
                }

                alertObj.style.display = "block";

            }

            function removeCustomAlert() {
                document.getElementsByTagName("body")[0].removeChild(document.getElementById("modalContainer"));
            }
            function showConfirmBox() {
                document.getElementById("confirm-box").hidden = false;
            }

            function confirm(data) {
                if (data === "yes") {
                    console.log(" user clicked yes");
                } else {
                    console.log("user clicked No");
                }
            }
        </script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script>
            function functionConfirm(msg, myYes, myNo) {
                var confirmBox = $("#confirm");
                confirmBox.find(".message").text(msg);
                confirmBox.find(".yes,.no").unbind().click(function () {
                    confirmBox.hide();
                });
                confirmBox.find(".yes").click(myYes);
                confirmBox.find(".no").click(myNo);
                confirmBox.show();
            }
        </script>
        <style>
            #confirm {
                display: none;
                background-color: white;
                border: 1px solid #106eea;
                position:fixed;
                width: 200px;
                height: 100px;
                left: 55%;
                margin-left: -100px;
                padding: 8px;
                box-sizing: border-box;
                text-align: center;
            }
            #confirm button {
                background-color: #106eea;
                display: inline-block;
                border-radius: 5px;
                border: 1px solid white;
                padding: 5px;
                text-align: center;
                width: 80px;
                cursor: pointer;
                margin-top: 20px;
            }
            #confirm .message {
                text-align: center;
            }
        </style>
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
                    if (loginType.equals("staff_g1")) {
                        response.sendRedirect("../staff_g1/index.jsp");
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
        <div class="container-scroller d-flex">
            <!-- partial:./partials/_sidebar.html -->
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
                        <a class="nav-link" href="stff.jsp">
                            <i class="mdi mdi mdi-account-plus menu-icon"></i>
                            <span class="menu-title">Manage staff</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="approveStaff.jsp">
                            <i class="mdi mdi-account-check menu-icon"></i>
                            <span class="menu-title">Approve Staff</span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="../ManagementLogOutServlet?id=<%=sessionId%>">
                            <i class="mdi mdi-account-remove menu-icon"></i>
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
                            <a class="navbar-brand brand-logo" href="index.jsp" style="font-size: 30px; color: black; font-weight: bold">Pheonix Airline PVT (Admin)</a>
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
                <div id="confirm">
                    <div class="message"></div>
                    <button class="yes">Yes</button>
                    <button class="no">No</button>
                </div>
                <div class="main-panel">        
                    <div class="content-wrapper">
                        <div class="row">


                        </div>
                        <div class="col-12 grid-margin stretch-card">

                        </div>

                        <div class="container-lg">
                            <div class="table-responsive">
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-8"><h2>Approve <b>Staff</b></h2></div>

                                        </div>
                                    </div>

                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Full Name</th>
                                                <th>Age</th>
                                                <th>NIC</th>
                                                <th>Email</th>
                                                <th>Grade</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                DBConnection dBConnection = new DBConnection();
                                                Connection connection = dBConnection.getConnection();

                                            %>

                                            <%                                    try {
                                                    Statement statement = connection.createStatement();
                                                    ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.employee where status = 0;");

                                                    while (resultSet.next()) {
                                            %>
                                            <tr>
                                                <td><%=resultSet.getInt(1)%></td>
                                                <td><%=resultSet.getString(2)%></td>
                                                <td><%=resultSet.getInt(3)%></td>
                                                <td><%=resultSet.getInt(4)%></td>
                                                <td><%=resultSet.getString(5)%></td>
                                                <td><%=resultSet.getInt(8)%></td>

                                                <td>
                                                    <a href="./AcceptStaffMemberServlet?id=<%=resultSet.getInt(1)%>">
                                                        <input type="button" value = "✔" onclick='functionConfirm("Approve staff member?", function yes() {

                                                                },
                                                                        function no() {

                                                                        });'>
                                                    </a>

                                                    <a href="./RejectStaffMemberServlet?id=<%=resultSet.getInt(1)%>">
                                                        <input type="button" value = "❌" onclick='functionConfirm("Approve staff member?", function yes() {

                                                                },
                                                                        function no() {

                                                                        });'>
                                                    </a>


                                                </td>



                                                </td>

                                            </tr>

                                            <% }
                                                } catch (Exception e) {
                                                    out.print(e.getMessage());
                                                }

                                            %>


                                        </tbody>
                                    </table>
                                    <div id="confirm-box" hidden>
                                        <h3>Confirmation</h3>
                                        <p>Do you really want to reset the database?</p>
                                        <button onclick="confirm('yes')">Yes</button>
                                        <button onclick="confirm('no')">No</button>
                                    </div>
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
</body>
</html>
