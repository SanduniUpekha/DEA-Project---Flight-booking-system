<%-- 
    Document   : user
    Created on : Sep 27, 2022, 12:58:06 PM
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
            int userId = Integer.parseInt(request.getParameter("id"));
        %>

        <%                                DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

        %>
        <%                                    try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where id =" + userId + " ");

                resultSet.next();
        %>


        User Id: <%=resultSet.getInt(1)%> <br><br>
        Full Name: <%=resultSet.getString(2)%> <br><br>
        Age: <%=resultSet.getInt(3)%> <br><br>
        NIC: <%=resultSet.getInt(4)%> <br><br>
        Email: <%=resultSet.getString(5)%> <br><br>


        <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
