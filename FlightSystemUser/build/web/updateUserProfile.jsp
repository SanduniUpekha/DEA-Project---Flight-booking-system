<%-- 
    Document   : updateUserProfile
    Created on : Oct 3, 2022, 9:53:08 PM
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            int sessionId = 0;

            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }
            }

        %>

        <%                                    try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where session_id =" + sessionId + " ");

                resultSet.next();
        %>

        <form name="update_profile" method="POST" action="./UpdateProfileServlet">
            User Id: <input type="text" name="user_id" value="<%=resultSet.getInt(1)%>" readonly> <br><br>
            Full Name: <input type="text" name="full_name" value="<%=resultSet.getString(2)%>" > <br><br>
            Date of birth: <input type="text" name="dob" value="<%=resultSet.getString(3)%>" > <br><br>
            Address: <input type="text" name="address" value="<%=resultSet.getString(4)%>" > <br><br>
            Phone number: <input type="text" name="phone" value="<%=resultSet.getInt(5)%>" > <br><br>
            Passport: <input type="text" name="passport" value="<%=resultSet.getInt(6)%>" > <br><br>
            Email: <input type="text" name="email" value="<%=resultSet.getString(7)%>" > <br><br>
            Username: <input type="text" name="username" value="<%=resultSet.getString(8)%>" > <br><br>
            Password: <input type="text" name="password" value="<%=resultSet.getString(9)%>" > <br><br>
            
            <input type="submit" value="Update user profile">
        </form>


        <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
