<%-- 
    Document   : index
    Created on : Oct 8, 2022, 1:41:22 PM
    Author     : dhanu
--%>

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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- endinject -->
        <link rel="shortcut icon" href="images/favicon.png" />
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
                    
                    if (loginType.equals("staff_g1")) {
                        response.sendRedirect("../staff_g1/index.jsp");
                    }
                }
            }

            if (sessionId == 0) {
                response.sendRedirect("log.jsp");
            }
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
                        <a class="nav-link" href="flight.jsp">
                            <i class="mdi mdi-airplane menu-icon"></i>
                            <span class="menu-title">Manage Flights</span>
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
                            <a class="navbar-brand brand-logo" href="index.jsp"><img src="images/1.png" alt="logo"/></a>
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
                            <div class="col-12 col-xl-6 grid-margin stretch-card">
                                <div class="row w-100 flex-grow">
                                    <div class="col-md-12 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <p class="card-title">Website Audience Metrics</p>
                                                <p class="text-muted">25% more traffic than previous week</p>
                                                <div class="row mb-3">
                                                    <div class="col-md-7">
                                                        <div class="d-flex justify-content-between traffic-status">
                                                            <div class="item">
                                                                <p class="mb-">Users</p>
                                                                <h5 class="font-weight-bold mb-0">93,956</h5>
                                                                <div class="color-border"></div>
                                                            </div>
                                                            <div class="item">
                                                                <p class="mb-">Bounce Rate</p>
                                                                <h5 class="font-weight-bold mb-0">58,605</h5>
                                                                <div class="color-border"></div>
                                                            </div>
                                                            <div class="item">
                                                                <p class="mb-">Page Views</p>
                                                                <h5 class="font-weight-bold mb-0">78,254</h5>
                                                                <div class="color-border"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <ul class="nav nav-pills nav-pills-custom justify-content-md-end" id="pills-tab-custom"
                                                            role="tablist">
                                                            <li class="nav-item">

                                                            </li>
                                                            <li class="nav-item">

                                                            </li>
                                                            <li class="nav-item">
                                                                <a class="nav-link" id="pills-contact-tab-custom" data-toggle="pill" href="#pills-music"
                                                                   role="tab" aria-controls="pills-contact" aria-selected="false">
                                                                    Month
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <canvas id="audience-chart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center justify-content-between flex-wrap">
                                                    <p class="card-title">Weekly Balance</p>
                                                    <p class="text-success font-weight-medium">20.15 %</p>
                                                </div>
                                                <div class="d-flex align-items-center flex-wrap mb-3">
                                                    <h5 class="font-weight-normal mb-0 mb-md-1 mb-lg-0 mr-3">$22.736</h5>
                                                    <p class="text-muted mb-0">Avg Sessions</p>
                                                </div>
                                                <canvas id="balance-chart" height="130"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center justify-content-between flex-wrap">
                                                    <p class="card-title">Today Task</p>
                                                    <p class="text-success font-weight-medium">45.39 %</p>
                                                </div>
                                                <div class="d-flex align-items-center flex-wrap mb-3">
                                                    <h5 class="font-weight-normal mb-0 mb-md-1 mb-lg-0 mr-3">17.247</h5>
                                                    <p class="text-muted mb-0">Avg Sessions</p>
                                                </div>
                                                <canvas id="task-chart" height="130"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 col-xl-6 grid-margin stretch-card">
                                <div class="row w-100 flex-grow">
                                    <div class="col-md-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body">
                                                <p class="card-title">Regional Load</p>
                                                <p class="text-muted">Last update: 2 Hours ago</p>
                                                <div class="regional-chart-legend d-flex align-items-center flex-wrap mb-1"
                                                     id="regional-chart-legend"></div>
                                                <canvas height="280" id="regional-chart"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 grid-margin stretch-card">
                                        <div class="card">
                                            <div class="card-body pb-0">
                                                <div class="d-flex align-items-center mb-4">
                                                    <p class="card-title mb-0 mr-1">Today activity</p>
                                                    <div class="badge badge-info badge-pill">2</div>
                                                </div>
                                                <div class="d-flex flex-wrap pt-2">
                                                    <div class="mr-4 mb-lg-2 mb-xl-0">
                                                        <p>Time On Site</p>
                                                        <h4 class="font-weight-bold mb-0">77.15 %</h4>
                                                    </div>
                                                    <div>
                                                        <p>Page Views</p>
                                                        <h4 class="font-weight-bold mb-0">14.15 %</h4>
                                                    </div>
                                                </div>
                                            </div>
                                            <canvas height="150" id="activity-chart"></canvas>
                                        </div>
                                    </div>
                                    <div class="col-md-12 stretch-card">
                                        <div class="card">
                                            <div class="card-body pb-0">
                                                <p class="card-title">Server Status 247</p>
                                                <div class="d-flex justify-content-between flex-wrap">
                                                    <p class="text-muted">Last update: 2 Hours ago</p>
                                                    <div class="d-flex align-items-center flex-wrap server-status-legend mt-3 mb-3 mb-md-0">
                                                        <div class="item mr-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="color-bullet"></div>
                                                                <h5 class="font-weight-bold mb-0">128GB</h5>
                                                            </div>
                                                            <p class="mb-">Total Usage</p>
                                                        </div>
                                                        <div class="item mr-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="color-bullet"></div>
                                                                <h5 class="font-weight-bold mb-0">92%</h5>
                                                            </div>
                                                            <p class="mb-">Memory Usage</p>
                                                        </div>
                                                        <div class="item mr-3">
                                                            <div class="d-flex align-items-center">
                                                                <div class="color-bullet"></div>
                                                                <h5 class="font-weight-bold mb-0">16%</h5>
                                                            </div>
                                                            <p class="mb-">Disk Usage</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <canvas height="170" id="status-chart"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- content-wrapper ends -->
                        <!-- partial:./partials/_footer.jsp -->

                        <!-- partial -->
                    </div>
                    <!-- main-panel ends -->
                </div>
                <!-- page-body-wrapper ends -->
            </div>
            <!-- container-scroller -->

            <!-- base:js -->
            <script src="vendors/js/vendor.bundle.base.js"></script>
            <!-- endinject -->
            <!-- Plugin js for this page-->
            <script src="vendors/chart.js/Chart.min.js"></script>
            <!-- End plugin js for this page-->
            <!-- inject:js -->
            <script src="js/off-canvas.js"></script>
            <script src="js/hoverable-collapse.js"></script>
            <script src="js/template.js"></script>
            <!-- endinject -->
            <!-- plugin js for this page -->
            <!-- End plugin js for this page -->
            <!-- Custom js for this page-->
            <script src="js/dashboard.js"></script>
            <!-- End custom js for this page-->

    </body>
</html>
