<%-- 
    Document   : userDashboard
    Created on : Sep 17, 2022, 7:05:02 PM
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

        <h1>User Dashboard</h1>

        <%                                    try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where session_id =" + sessionId + " ");

                resultSet.next();
        %>

        User Id: <%=resultSet.getInt(1)%> <br><br>
        Full Name: <%=resultSet.getString(2)%> <br><br>
        Date of birth: <%=resultSet.getString(3)%> <br><br>
        Address: <%=resultSet.getString(4)%> <br><br>
        Phone number: <%=resultSet.getInt(5)%> <br><br>
        Passport: <%=resultSet.getInt(6)%> <br><br>
        Email: <%=resultSet.getString(7)%> <br><br>
        Username: <%=resultSet.getString(8)%> <br><br>
        Password: <%=resultSet.getString(9)%> <br><br>


        <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
        
        <a href="updateUserProfile.jsp"><input type="button" value="Update Profile"></a>
    </body>
</html>
