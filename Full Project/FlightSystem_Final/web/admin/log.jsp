<%-- 
    Document   : log.jsp
    Created on : Oct 8, 2022, 9:40:35 AM
    Author     : dhanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Animated Login Form</title>
        <link rel="stylesheet" type="text/css" href="log.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link
            href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap"
            rel="stylesheet"
            />
        <script src="https://kit.fontawesome.com/a81368914c.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1" />


        <style>
            #message {
                display:none;
                background: #f1f1f1;
                color: #000;
                position: relative ;
                padding: px;
                margin-top: 2px;
            }

            #message p {
                padding: px px;
                font-size: 15px;
                align-items: center ;
            }

            /* Add a green text color and a checkmark when the requirements are right */
            .valid {
                color: rgb(16, 24, 255);
            }

            .valid:before {
                position:relative ;
                left: -35px;
                content: "✔";
            }

            /* Add a red text color and an "x" when the requirements are wrong */
            .invalid {
                color: red;
            }

            .invalid:before {
                position: relative;
                left: -35px;
                content: "✖";
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

            if (sessionId != 0) {
                response.sendRedirect("index.jsp");
            }

        %>
        <img class="wave" src="images/log.png" />
        <div class="container">
            <div class="img"></div>
            <div class="login-content">
                <form name="managementLogin" method="POST" action="../LoginManagementServlet">
                    <img src="images/icon.png" />
                    <h2 class="title">Login here</h2>
                    <!-- Name -->
                    <div class="input-div one">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5 for="contact_name">Username</h5>
                            <input type="text"  class="input" id="contact_name" name="username" required></input>

                        </div>
                    </div>
                    <!-- Email -->
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5 for="contact_email">Password</h5>
                            <input type="password" class="input" name="password" id="psw" autocomplete="off" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>

                        </div>
                    </div>					
                    <!--Website -->

                    <a href="reg.jsp">Create account</a>

                    <!-- Submit Button -->
                    <div class="my-3">

                        <div id="contact_submit">				
                            <input  class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn"  type="submit" onclick="validate()">
                        </div>

                    </div>
                </form>

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
