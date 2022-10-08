<%-- 
    Document   : index
    Created on : Oct 8, 2022, 1:52:29 PM
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

        <title>Pheonix Airline PVT - Homepage</title>
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

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.min.css">


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





            .mmodal-body{ padding: 60px 40px 40px !important; }
            .mmodal-body .title{
                color: #026fd4;
                font-size: 33px;
                font-weight: 700;
                letter-spacing: 1px;
                margin: 0 0 10px;
            }
            .mmodal-body .description{
                color: #9A9EA9;
                font-size: 16px;
                margin: 0 0 20px;
            }
            .mmodal-body .form-group{
                text-align: left;
                margin-bottom: 20px;
                position: relative;
            }
            .mmodal-body .input-icon{
                color: #777;
                font-size: 18px;
                transform: translateY(-50%);
                position:absolute;
                top: 50%;
                left: 20px;
            }
            .mmodal-body .form-control{
                font-size: 17px;
                height: 45px;
                width: 100%;
                padding: 6px 0 6px 10px;
                margin: 0 auto;
                border: 2px solid #eee;
                border-radius: 5px;
                box-shadow: none;
                outline: none;
            }

            .bbtn{
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
            .bbtn:hover{
                color: #fff;
                letter-spacing: 2px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }
            .bbtn:focus{ outline: none; }
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

                        <li><a class="nav-link scrollto active" href="index.jsp">Home</a></li>

                        <li><a class="nav-link scrollto" href="about.jsp">About</a></li>
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

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">
            <div class="container" data-aos="zoom-out" data-aos-delay="100">
                <h1>Around the <span>world</span></h1>
                <h2 >FAST, SAFE AND DIRECT FLIGHTS</h2>
                <a href="" data-toggle="modal"  data-target="#mycheck"><h2 style="color:#106eea"><i> Check Flight Availability</i></h2></a>
                <div class="d-flex">

                    <a href="https://www.youtube.com/watch?v=ZPG_9CC9Ia4" class="glightbox btn-watch-video"><i class="bi bi-play-circle"></i><span>Watch Video</span></a>
                </div>

            </div>

        </section><!-- End Hero -->
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


        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="modal-box">
                        <%                            DBConnection dBConnection = new DBConnection();
                            Connection connection = dBConnection.getConnection();

                        %> 
                        <form name="availability" method="POST" action="./AvailabilityCheckServlet">
                            <!-- Modal -->
                            <div class="modal fade" id="mycheck" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content clearfix">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                                        <div class="mmodal-body">
                                            <h3 class="title">Flights</h3>
                                            <div class="form-group" >

                                                <label for="sel1">From (select)</label>
                                                <select class="form-control" id="sel1" name="from">
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


                                                <label for="sel1">To (select)</label>

                                                <select name="to" class="form-control" id="sel1">
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


                                                <label for="sel1">Ticket Class (select)</label>

                                                <select class="form-control" id="sel1" name="class">
                                                    <option value="0">Please Select</option>
                                                    <option value="economy">Economy Class</option>
                                                    <option value="business">Business Class</option>


                                                </select>
                                            </div>
                                            <div class="form-group">


                                                <label for="sel1">Flight type (select)</label>

                                                <select class="form-control" id="sel1" name="type">
                                                    <option value="0">Please Select</option>
                                                    <option value="round">Round Trip</option>
                                                    <option value="one">One Way Trip</option>
                                                </select>
                                            </div>
                                            <div class="form-group">


                                                <label for="sel1">Day (select)</label>

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

                                            <div class="form-group">

                                                <label for="sel1">Flight Time (select)</label>

                                                <select class="form-control" id="sel1" name="time">
                                                    <option value="">Please Select</option>
                                                    <option value="06.30">6.30 A.M</option>
                                                    <option value="14.00">2.00 P.M</option>
                                                    <option value="22.30">10.30 P.M</option>
                                                </select>
                                            </div>

                                            <div  id="divWpickDate">
                                                <div class="form-group">	
                                                    <label for="sel1"> Flight Date (select)</label>		 
                                                    <input name="flight_date" type="date" id="datetimepicker1" class="form-control" placeholder="dd/mm/yy" /> 
                                                </div>
                                            </div>   




                                            <input class="bbtn" value="Check availability" type="submit">
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



            <!-- ======= Featured Services Section ======= -->
            <section id="featured-services" class="featured-services">
                <div class="container" >
                    <div class="section-title">

                        <h3>LET’S FLY AWAY IN  <span>STYLE!</span></h3>

                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box" >
                                <img src="assets/img/staff.jpg"   class="center">
                                <h4 class="title">EXPERIANCED STAFF</h4>
                                <p class="description">We hire only true specialists who know how to solve all kinds of issues that may appear during your staying at our airport.</p>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box" data-aos-delay="200">
                                <img src="assets/img/improvment.jpg"   class="center">
                                <h4 class="title">CONSTANT IMPROVMENT</h4>
                                <p class="description">We are striving for delivering services of superior quality that is why we value your opinions and reviews a lot more</p>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box"  data-aos-delay="300">
                                <img src="assets/img/air.jpg"   class="center">
                                <h4 class="title">AIR TRANSPOTATION</h4>
                                <p class="description">We cooperate only with the world’s most recognized aircraft manufacturers, and have our specialists checking the quality.</p>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                            <div class="icon-box" data-aos-delay="400">
                                <img src="assets/img/food.jpg"   class="center">
                                <h4 class="title">CUSTOMER CARE </a></h4>
                                <p class="description">We are striving for delivering services of superior quality that is why we value your opinions and reviews a lot more</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Featured Services Section -->

            <!-- ======= About Section ======= -->
            <section id="about" class="about section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">

                        <h3>WHATEVER THE DESTINATION YOU WANNA GET TO, EITHER OF OUR PRIVATE JETS WILL FLY YOU THERE!</h3>

                    </div>

                    <div class="row">
                        <div class="col-lg-6" data-aos="fade-right" data-aos-delay="100">
                            <img src="assets/img/index2.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="col-lg-6 pt-4 pt-lg-0 content d-flex flex-column justify-content-center" data-aos="fade-up" data-aos-delay="100">
                            <h3>After Flying Domestic and International Skies for Decades, We Know We are the Best! Whatever the Destination You Wanna Get to, Either of Our Private Jets Will Fly You There!</h3>
                            <br><br> <p class="fst-italic">
                                Considering most of our planes flew limited-distance destinations,this is some big news! Visit the Pacific isles with our help!



                                Do you feel like trying either of out flights for the first time?Hopefully our 20% off will help you make the decision!
                            </p>


                        </div>
                    </div>

                </div>
            </section><!-- End About Section -->



            <!-- ======= Counts Section ======= -->
            <section id="counts" class="counts">
                <div class="container" data-aos="fade-up">
                    <div class="section-title">
                        <h3>REASON TO  <span>FLY WITH US!</span></h3>
                    </div><br><br><br>
                    <div class="row">

                        <div class="col-lg-3 col-md-6">
                            <div class="count-box">
                                <i class="bi bi-emoji-smile"></i>
                                <span data-purecounter-start="0" data-purecounter-end="200" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Countries</p>
                            </div>
                        </div>



                        <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                            <div class="count-box">
                                <i class="bi bi-emoji-smile"></i>
                                <span data-purecounter-start="0" data-purecounter-end="99" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Planes</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                            <div class="count-box">
                                <i class="bi bi-people"></i>
                                <span data-purecounter-start="0" data-purecounter-end="10000" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Clients</p>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6 mt-5 mt-lg-0">
                            <div class="count-box">
                                <i class="bi bi-people"></i>
                                <span data-purecounter-start="0" data-purecounter-end="40" data-purecounter-duration="1" class="purecounter"></span>
                                <p>Pilots</p>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Counts Section -->



            <div class="section-title">
                <h3>Testimonials</h3>
            </div>

            <!-- ======= Testimonials Section ======= -->
            <section id="testimonials" class="testimonials">
                <div class="container" data-aos="zoom-in">

                    <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                        <div class="swiper-wrapper">

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <img src="assets/img/testimonials/testimonials-1.jpg" class="testimonial-img" alt="">
                                    <h3>GA Jhon</h3>

                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        Being a millionaire has its cons. It obliges me to spend tons of money on private flights.
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <img src="assets/img/testimonials/testimonials-2.jpg" class="testimonial-img" alt="">
                                    <h3>Sara Jhan</h3>

                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        As a movie star, I very often fly from a set to award shows. Can you imagine me doing so on a regular flight?
                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                </div>
                            </div><!-- End testimonial item -->

                            <div class="swiper-slide">
                                <div class="testimonial-item">
                                    <img src="assets/img/testimonials/testimonials-3.jpg" class="testimonial-img" alt="">
                                    <h3>RN Smith</h3>

                                    <p>
                                        <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                        As soon as I won the lottery, I’ve immediately signed off regular flights and started flying.


                                        <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                                    </p>
                                </div>
                            </div><!-- End testimonial item -->




                        </div>
                        <div class="swiper-pagination"></div>
                    </div>

                </div>
            </section><!-- End Testimonials Section -->






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
                                <strong>Email:</strong>Pheonix Airline PVT@mail.com<br>
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

        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>         
        <script type="text/javascript">
            $(function () {
                $("#datetimepicker1").datepicker({
                    minDate: new Date(),
                    dateFormat: 'mm-dd-yy'
                });
            });
        </script>

    </body>
</html>
