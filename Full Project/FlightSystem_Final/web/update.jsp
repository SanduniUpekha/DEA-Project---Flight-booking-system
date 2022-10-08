<%-- 
    Document   : update
    Created on : Oct 8, 2022, 1:55:44 PM
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
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Flight</title>
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
        <link href="test.css" rel="stylesheet"> 
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

            .dropdown-content a:hover {background-color: #ddd;}

            .dropdown:hover .dropdown-content {display: block;}

            .dropdown:hover .dropbtn {background-color: #3e8e41;}


        </style>
        <!-- =======================================================
        * Template Name: BizLand - v3.9.0
        * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <%                                    DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            Cookie cookies[] = request.getCookies();
            int sessionId = 0;

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }
            }

            if (sessionId == 0) {
                response.sendRedirect("index.jsp");
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

                <h1 class="logo"><a href="index.jsp">SpaceLand<span>.</span></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.jsp" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

                <nav id="navbar" class="navbar">
                    <ul>
                        <li><a class="nav-link scrollto " href="index.jsp">Home</a></li>

                        <li><a class="nav-link scrollto " href="about.jsp">About</a></li>
                        <li><a class="nav-link scrollto" href="service.jsp">Services</a></li>
                        <li><a class="nav-link scrollto " href="flight.jsp">Flight</a></li>
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


        <div id="wrapper">

            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <br>
                        <img src="assets/img/woman.png" alt="Avatar" class="aavatar">

                    <center><P class="t">Edit Profile</P> </center>


                </ul>
            </div>
            <!-- /#sidebar-wrapper -->

            <!-- Page Content -->
            <div id="page-content-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>Edit Profile</h2>
                            <br><br>
                            <form name="update_profile" method="POST" action="./UpdateProfileServlet">



                                <%                                    try {
                                        Statement statement = connection.createStatement();
                                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where session_id = " + sessionId + ";");

                                        resultSet.next();
                                %>

                                <div class="row">
                                    <div class="col form-group">
                                        <label for="fname">User Id</label>
                                        <input type="text" id="contact_name" name="user_id" placeholder="Your name" value="<%=resultSet.getInt(1)%>" required>

                                    </div>
                                    <div class="col form-group">
                                        <label for="fname"> Name</label>
                                        <input type="text" id="contact_name" name="full_name" placeholder="Your name" value="<%=resultSet.getString(2)%>" required>

                                    </div>
                                    <div class="col form-group">
                                        <label for="fname">Date of birth</label>
                                        <input type="text" id="contact_name" name="dob" placeholder="Your age" value="<%=resultSet.getString(3)%>" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col form-group">
                                        <label for="fname">Phone number</label>
                                        <input type="text" id="contact_name" name="phone" required>

                                    </div>

                                    <div class="col form-group">
                                        <label for="fname">Address</label>
                                        <input type="text" id="contact_name" name="address" required>

                                    </div>

                                    <div class="col form-group">
                                        <label for="fname">Passport number</label>
                                        <input type="text" id="contact_name" name="passport" placeholder="Your NIC" value="<%=resultSet.getInt(6)%>" required>

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col form-group">
                                        <label for="fname">Email</label>
                                        <input type="email" id="contact_email" name="email" placeholder="Your Email" value="<%=resultSet.getString(7)%>" required>

                                    </div>
                                    <div class="col form-group">
                                        <label for="fname">Username</label>
                                        <input type="text" id="contact_name" name="username" placeholder="Your username" value="<%=resultSet.getString(8)%>" required>

                                    </div>
                                    <div class="col form-group">
                                        <label for="fname">Password</label>
                                        <input type="password" id="psw" name="password" placeholder="Your password" value="<%=resultSet.getString(9)%>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required>

                                    </div>
                                </div>

                                <%
                                    } catch (Exception e) {
                                        out.print(e.getMessage());
                                    }

                                %>


                                <div class="text-center"><button class="button">Update Profile</button></div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <!-- /#page-content-wrapper -->

        </div>
        <!-- /#wrapper -->
        <!-- Menu Toggle Script -->
        <!-- ======= Footer ======= -->
        <!-- End Footer -->

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
