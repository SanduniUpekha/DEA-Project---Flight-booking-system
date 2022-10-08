<%-- 
    Document   : adminDashboard
    Created on : Sep 20, 2022, 10:08:13 AM
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Admin Dashboard</h1>

        <h2>Staff Members need to approve</h2>
        <%
            int sessionId = 0;

            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }
            }
        %>

        <table border="1">
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
                            <input type="button" name="approve" value="Approve">
                        </a>
                        <a href="./RejectStaffMemberServlet?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="Reject" value="Reject">
                        </a>
                    </td>
                </tr>

                <% }
                    } catch (Exception e) {
                        out.print(e.getMessage());
                    }

                %>
            </tbody>
        </table>
            <h1>Add staff members</h1>
            <form name="staff_add" method="POST" action="./AddStaffServlet">
            Full Name: <input type="text" name="full_name"> <br><br>
            Age: <input type="text" name="age"> <br><br>
            NIC: <input type="text" name="nic" > <br><br>
            Email: <input type="email" name="email" > <br><br>
            UserName: <input type="text" name="username" ><br><br>
            Password: <input type="password" name="password"><br><br>
            Grade: 
            <select name="grade">
                <option value="">Please Select</option>
                <option value="1">Grade 1</option>
                <option value="2">Grade 2</option>
            </select><br><br>
            <input type="submit" value="Add" />
        </form>
    </body>
</html>
