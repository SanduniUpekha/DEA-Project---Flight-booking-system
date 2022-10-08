<%-- 
    Document   : updateUser
    Created on : Sep 25, 2022, 4:10:21 PM
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
                ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where id = " + userId + " ");

                resultSet.next();
        %>

        <h1>Update User</h1>
        <form name="user_update" method="POST" action="./UpdateUserServlet">
            User Id: <input type="text" name="user_id" value="<%=resultSet.getInt(1)%>" readonly> <br><br>
            Full Name: <input type="text" name="full_name" value="<%=resultSet.getString(2)%>" > <br><br>
            Age: <input type="text" name="age" value="<%=resultSet.getInt(3)%>" > <br><br>
            NIC: <input type="text" name="nic" value="<%=resultSet.getInt(4)%>" > <br><br>
            Email: <input type="email" name="email" value="<%=resultSet.getString(5)%>" > <br><br>
            UserName: <input type="text" name="username" value="<%=resultSet.getString(6)%>" ><br><br>
            Password: <input type="password" name="password" value="<%=resultSet.getString(7)%>" ><br><br>
            <input type="submit" value="Update" />
        </form>

        <%
            } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
