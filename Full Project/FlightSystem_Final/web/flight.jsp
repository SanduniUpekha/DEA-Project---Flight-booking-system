<%-- 
    Document   : flight
    Created on : Oct 8, 2022, 1:49:48 PM
    Author     : dhanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Pheonix Airline PVT - Search Flight</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">  
        <style>
            .modal-box{ font-family: 'Poppins', sans-serif; }
            .show-modal{
                color: #fff;
                background: linear-gradient(to right, #33a3ff, #0675cf, #49a6fd);
                font-size: 15px;
                font-weight: 100;
                text-transform: capitalize;
                padding: 10px 10px;
                margin: 0px auto 0;
                border: none;
                outline: none;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                display: block;
                transition: all 0.3s ease 0s;
            }
            .show-modal:hover,
            .show-modal:focus{
                color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.4);
                outline: none;
            }
            .modal-dialog{
                width: 400px;
                margin: 70px auto 0;
            }
            .modal-dialog{ transform: scale(0.5); }
            .modal-dialog{ transform: scale(1); }
            .modal-dialog .modal-content{
                text-align: center;
                border: none;
            }
            .modal-content .close{
                color: #fff;
                background: linear-gradient(to right, #33a3ff, #0675cf, #4cd5ff);
                font-size: 25px;
                font-weight: 400;
                text-shadow: none;
                line-height: 27px;
                height: 25px;
                width: 25px;
                border-radius: 50%;
                overflow: hidden;
                opacity: 1;
                position: absolute;
                left: auto;
                right: 8px;
                top: 8px;
                z-index: 1;
                transition: all 0.3s;
            }
            .modal-content .close:hover{
                color: #fff;
                box-shadow: 0 0 5px rgba(0,0,0,0.5);
            }
            .close:focus{ outline: none; }
            .modal-body{ padding: 60px 40px 40px !important; }
            .modal-body .title{
                color: #026fd4;
                font-size: 33px;
                font-weight: 700;
                letter-spacing: 1px;
                margin: 0 0 10px;
            }
            .modal-body .description{
                color: #9A9EA9;
                font-size: 16px;
                margin: 0 0 20px;
            }
            .modal-body .form-group{
                text-align: left;
                margin-bottom: 20px;
                position: relative;
            }
            .modal-body .input-icon{
                color: #777;
                font-size: 18px;
                transform: translateY(-50%);
                position: absolute;
                top: 50%;
                left: 20px;
            }
            .modal-body .form-control{
                font-size: 17px;
                height: 45px;
                width: 100%;
                padding: 6px 0 6px 50px;
                margin: 0 auto;
                border: 2px solid #eee;
                border-radius: 5px;
                box-shadow: none;
                outline: none;
            }
            .form-control::placeholder{
                color: #AEAFB1;
            }
            .form-group.checkbox{
                width: 130px;
                margin-top: 0;
                display: inline-block;
            }
            .form-group.checkbox label{
                color: #9A9EA9;
                font-weight: normal;
            }
            .form-group.checkbox input[type=checkbox]{
                margin-left: 0;
            }
            .modal-body .forgot-pass{
                color: #7F7FD5;
                font-size: 13px;
                text-align: right;
                width: calc(100% - 135px);
                margin: 2px 0;
                display: inline-block;
                vertical-align: top;
                transition: all 0.3s ease 0s;
            }
            .forgot-pass:hover{
                color: #9A9EA9;
                text-decoration: underline;
            }
            .modal-content .modal-body .btn{
                color: #fff;
                background: linear-gradient(to right, #33a3ff, #0675cf, #4cd5ff);
                font-size: 16px;
                font-weight: 500;
                letter-spacing: 1px;
                text-transform: uppercase;
                line-height: 38px;
                width: 100%;
                height: 40px;
                padding: 0px;
                border: none;
                border-radius: 5px;
                border: none;
                display: inline-block;
                transition: all 0.6s ease 0s;
            }
            .modal-content .modal-body .btn:hover{
                color: #fff;
                letter-spacing: 2px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }
            .modal-content .modal-body .btn:focus{ outline: none; }
            @media only screen and (max-width: 480px){
                .modal-dialog{ width: 95% !important; }
                .modal-content .modal-body{
                    padding: 60px 20px 40px !important;
                }
            }

            .dropbtn {
                background-color: #04AA6D;
                color: white;
                padding: 16px;
                font-size: 16px;
                border: none;
            }

            .dropdown {
                position: relative;
                display:inline-block;
            }

            .dropdown-content {
                display: none;
                position: absolute;
                background-color: #f1f1f1;
                min-width: 120px;
                box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
                z-index: 1;
            }

            .dropdown-content a {
                color: black;
                padding: 12px 16px;
                text-decoration: none;
                display: block;
            }
            .avatar {
                vertical-align: middle;
                width: 40px;
                height: 40px;
                border-radius: 50%;
            }


            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }

            .button1 {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }

            .button:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }
            table {
                width: 100%;
            }
            * {
                box-sizing: border-box;
            }

            .row {
                margin-left:-5px;
                margin-right:-5px;
            }

            .column {
                float: left;
                width: 50%;
                padding: 5px;
            }

            /* Clearfix (clear floats) */
            .row::after {
                content: "";
                clear: both;
                display: table;
            }

            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
                border: 1px solid #ddd;
            }

            th, td {
                text-align: left;
                padding: 16px;
            }


            /* Responsive layout - makes the two columns stack on top of each other instead of next to each other on screens that are smaller than 600 px */
            @media screen and (max-width: 600px) {
                .column {
                    width: 100%;
                }
            }

            .button {
                background-color: #106eea; /* Green */
                border: none;
                color: white;
                padding: 5px 15px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                cursor: pointer;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
            }

            .button1 {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
            }

            .button:hover {
                box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
            }
        </style>


    </style>



    <!-- =======================================================
    * Template Name: BizLand - v3.9.0
    * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->
</head>

<body>

    <%
        Cookie cookies[] = request.getCookies();
        int sessionId = 0;
        String date = "0";

        for (Cookie c : cookies) {
            if (c.getName().equals("session_id")) {
                sessionId = Integer.parseInt(c.getValue());
            }
        }

    %>

    <!-- ======= Top Bar ======= -->
    <section id="topbar" class="d-flex align-items-center">
        <div class="container d-flex justify-content-center justify-content-md-between">
            <div class="contact-info d-flex align-items-center">

            </div>
            <div class="social-links d-none d-md-flex align-items-center">

            </div>
        </div>
    </section>

    <!-- ======= Header ======= -->
    <header id="header" class="d-flex align-items-center">
        <div class="container d-flex align-items-center justify-content-between">

            <h1 class="logo"><a href="index.jsp">Pheonix Airline PVT<span>.</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.jsp" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto " href="index.jsp">Home</a></li>

                    <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
                    <li><a class="nav-link scrollto" href="service.jsp">Services</a></li>
                    <li><a class="nav-link scrollto active" href="flight.jsp">Flight</a></li>
                    <li><a class="nav-link scrollto" href="contact.jsp">Contact</a></li>
                    <li><a class="nav-link scrollto" ></a></li>
                    <button type="button" class="btn btn-primary btn-lg show-modal" data-toggle="modal" data-target="#myModal">
                        Login Form
                    </button>
                    <li><a class="nav-link scrollto" ></a></li>
                    <button type="button" class="btn btn-primary btn-lg show-modal" data-toggle="modal" data-target="#myreg">
                        Register Form
                    </button>
                    <li><a class="nav-link scrollto" ></a></li>
                    <div class="dropdown">
                        <img src="assets/img/icons8-male-user-64.png" alt="Avatar" class="avatar">
                        <div class="dropdown-content">
                            <br>
                            <center> <img src="assets/img/woman.png" alt="Avatar" class="avatar"></center>
                            <br>
                            <a href="update.jsp"> Edit Profile</a>
                            <a href="../ManagementLogOutServlet?id=<%=sessionId%>">Logout</a>

                        </div>
                    </div>
                    <!-- Button trigger modal -->



                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->

        </div>
    </header><!-- End Header -->


    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="modal-box">

                    <form name="userLogin" method="POST" action="./CreateUserServlet">
                        <!-- Modal -->
                        <div class="modal fade" id="myreg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content clearfix">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <div class="modal-body">
                                        <h3 class="title">Registration Form</h3>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fa fa-user"></i></span>

                                            <input type="text"  class="form-control" id="contact_name" name="full_name" placeholder="Enter name" required></input>
                                        </div>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fa fa-user"></i></span>

                                            <input type="date"  class="form-control" id="contact_name" placeholder="Birthdate" name="age" required></input>
                                        </div>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fa fa-user"></i></span>

                                            <input type="text"  class="form-control" id="contact_name" placeholder="Enter Passport Number" name="nic" required></input>
                                        </div>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fa fa-user"></i></span>

                                            <input type="email" class="form-control" placeholder="Enter email" id="contact_email" name="email" required></input>
                                        </div>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fa fa-user"></i></span>

                                            <input type="text"  class="form-control" id="contact_name" placeholder="Enter Username" name="username" required></input>
                                        </div>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fas fa-key"></i></span>

                                            <input type="password" class="form-control" placeholder="Password" name="password" id="psw" autocomplete="off" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                                        </div>
                                        <a href="" class="forgot-pass" data-toggle="modal" data-target="#myModal" data-dismiss="modal">Already have an account</a>
                                        <button class="btn">Register</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>



    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="modal-box">

                    <form id="contact" name="login" method="POST" action="./LoginUserServlet">
                        <!-- Modal -->
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content clearfix">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                    <div class="modal-body">
                                        <h3 class="title">Login Form</h3>
                                        <p class="description">Login here Using Username & Password</p>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fa fa-user"></i></span>

                                            <input type="text"  class="form-control" id="contact_name" name="username" placeholder="Enter username" required></input>
                                        </div>
                                        <div class="form-group">
                                            <span class="input-icon"><i class="fas fa-key"></i></span>

                                            <input type="password" class="form-control" placeholder="Password" name="password" id="psw"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
                                        </div>
                                        <a href="" class="forgot-pass" data-toggle="modal" data-target="#myreg" data-dismiss="modal">Don't have an account? </a>
                                        <button class="btn">Login</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <main id="main">

        <!-- ======= Pricing Section ======= -->
        <section id="pricing" class="pricing">
            <div class="container" data-aos="fade-up">

                <div class="section-title">

                    <h3>Search <span>Flight</span></h3>

                </div>

                <div class="row">
                    <label for="sel1">Select Date</label>
                    <div class="column">
                        <table>
                            <tr>
                            <form name="filter_flight" method="POST" action="./FilterFlightServlet" style="border:1px solid #ccc">

                                <div class="form-group" >

                                    <input class="form-control" type="date" name="date">

                                </div>
                                <button class="button button2" type="submit">Search Flight</button>
                            </form>
                        </table>
                    </div>



                    <%
                        
                        for (Cookie c : cookies) {
                            if (c.getName().equals("flight_date")) {
                                date = c.getValue();
                            }
                        }

                        PreparedStatement preparedStatement;
                        DBConnection dBConnection = new DBConnection();
                        Connection connection = dBConnection.getConnection();

                        if (!date.equals("0")) {
                            try {
                                Statement statement = connection.createStatement();
                                ResultSet resultSet = statement.executeQuery("select @country_from := country.country from flight join `from` on `from`.id = flight.from_id join country on country.id = `from`.country_id where flight.date= '" + date + "'; ");
                                resultSet.next();
                                String fromCountry = resultSet.getString(1);

                                resultSet = statement.executeQuery("select @country_to := country.country from flight join `to` on `to`.id = flight.to_id join country on country.id = `to`.country_id where flight.date = '" + date + "'; ");
                                resultSet.next();
                                String toCountry = resultSet.getString(1);
                                
                                resultSet = statement.executeQuery("select id, type, date from flight where date = '" + date + "'; ");
                                resultSet.next();
                                
                                String flightType = resultSet.getString(2);
                                if (flightType.equals("one")) {
                                    flightType = "One way trip";
                                } else {
                                    flightType = "Round way trip";
                                }


                    %>

                    <div class="column">
                        <table>
                            <tr>
                                <th>Flight Id</th>
                                <th>Country (From)</th>
                                <th>Country (To)</th>
                                <th>Flight Type</th>
                                <th>Flight Date</th>
                            </tr>
                            <tr>
                                <td><%=resultSet.getInt(1)%></td>
                                <td><%=fromCountry%></td>
                                <td><%=toCountry%></td>
                                <td><%=flightType%></td>
                                <td><%=resultSet.getString(3)%></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <%         } catch (Exception e) {
                        out.print(e.getMessage());
                    }
                }


            %>
            </div>
        </section><!-- End Pricing Section -->


    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer">

        <div class="footer-newsletter">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-6">
                        <h4>Join Our Newsletter</h4>

                        <form action="" method="post">
                            <input type="email" name="email"><input type="submit" value="Subscribe">
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer-top">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 col-md-6 footer-contact">
                        <h3>SPACE LAND<span>.</span></h3>
                        <p>
                            After Flying Domestic and International Skies for Decades, We Know We are the Best! Whatever the Destination You Wanna Get to, Either of Our Private Jets Will Fly You There!
                        </p>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><i class="bx bx-chevron-right"></i> <a href="index.jsp">Home</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="about.jsp">About us</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="service.jsp">Services</a></li>
                            <li><i class="bx bx-chevron-right"></i> <a href="contact.jsp">Contact us</a></li>

                        </ul>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Services</h4>
                        <p>
                            Jhon keels street <br>
                            Katunayake<br>
                            Srilanka <br><br>
                            <strong>Phone:</strong> +94 77 34 56 323<br>
                            <strong>Email:</strong> Pheonix Airline PVT@mail.com<br>
                        </p>
                    </div>

                    <div class="col-lg-3 col-md-6 footer-links">
                        <h4>Our Social Networks</h4>

                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <div class="container py-4">
            <div class="copyright">
                &copy; Copyright <strong><span>Pheonix Airline PVT</span></strong>. All Rights Reserved
            </div>
            <div class="credits">
                <!-- All the links in the footer should remain intact. -->
                <!-- You can delete the links only if you purchased the pro version. -->
                <!-- Licensing information: https://bootstrapmade.com/license/ -->
                <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->

            </div>
        </div>
    </footer><!-- End Footer -->

    <div id="preloader"></div>
    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
    <script src="assets/vendor/aos/aos.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
    <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
    <script src="assets/vendor/php-email-form/validate.js"></script>

    <!-- Template Main JS File -->
    <script src="assets/js/main.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.0.min.js"></script><script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>
        /* When the user clicks on the button,
         toggle between hiding and showing the dropdown content */
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        function filterFunction() {
            var input, filter, ul, li, a, i;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            div = document.getElementById("myDropdown");
            a = div.getElementsByTagName("a");
            for (i = 0; i < a.length; i++) {
                txtValue = a[i].textContent || a[i].innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    a[i].style.display = "";
                } else {
                    a[i].style.display = "none";
                }
            }
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var country = ["Australia", "Bangladesh", "Denmark", "Hong Kong", "Indonesia", "Netherlands", "New Zealand", "South Africa"];
            $("#country").select2({
                data: country
            });
        });
    </script>

</body>
</html>
