<%-- 
    Document   : staffDashboard
    Created on : Sep 18, 2022, 5:06:48 PM
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
        <h1>Staff Dashboard</h1>
        <%
            int sessionId = 0;

            Cookie cookies[] = request.getCookies();

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }
            }
        %>

        <h1>Current Users</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Full Name</th>
                    <th>DOB</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Passport</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <%                                DBConnection dBConnection = new DBConnection();
                    Connection connection = dBConnection.getConnection();

                %>
                <%                                    try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where status = 1;");

                        while (resultSet.next()) {
                %>

                <tr>
                    <td><%=resultSet.getInt(1)%></td>
                    <td><%=resultSet.getString(2)%></td>
                    <td><%=resultSet.getString(3)%></td>
                    <td><%=resultSet.getString(4)%></td>
                    <td><%=resultSet.getInt(5)%></td>
                    <td><%=resultSet.getInt(6)%></td>
                    <td><%=resultSet.getString(7)%></td>
                    <td>
                        <a href="./user.jsp?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="view" value="View">
                        </a>
                        <a href="./updateUser.jsp?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="update" value="Update">
                        </a>
                        <a href="./BlockUserServlet?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="block" value="Block">
                        </a>
                        <a href="./DeleteUserServlet?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="delete" value="Delete">
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

        <h1>Blocked Users</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Full Name</th>
                    <th>DOB</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Passport</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%                                    try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.user where status = 2;");

                        while (resultSet.next()) {
                %>

                <tr>
                    <td><%=resultSet.getInt(1)%></td>
                    <td><%=resultSet.getString(2)%></td>
                    <td><%=resultSet.getString(3)%></td>
                    <td><%=resultSet.getString(4)%></td>
                    <td><%=resultSet.getInt(5)%></td>
                    <td><%=resultSet.getInt(6)%></td>
                    <td><%=resultSet.getString(7)%></td>
                    <td>

                        <a href="./updateUser.jsp?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="update" value="Update">
                        </a>
                        <a href="./UnblockUserServlet?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="block" value="Unblock">
                        </a>
                        <a href="./DeleteUserServlet?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="delete" value="Delete">
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
        <h1>Flight Details</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Flight Id</th>
                    <th>From Id</th>
                    <th>To Id</th>
                    <th>Flight Type</th>
                    <th>Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%                                    try {
                        Statement statement = connection.createStatement();
                        ResultSet resultSet = statement.executeQuery("SELECT * FROM flight_system.flight;");
                        String type = "";

                        while (resultSet.next()) {
                            if (resultSet.getString(4).equals("round")) {
                                type = "Round way trip";
                            } else {
                                type = "One way trip";
                            }
                %>

                <tr>
                    <td><%=resultSet.getInt(1)%></td>
                    <td><%=resultSet.getInt(2)%></td>
                    <td><%=resultSet.getInt(3)%></td>
                    <td><%=type%></td>
                    <td><%=resultSet.getString(5)%></td>
                    <td>

                        <a href="./viewFlight.jsp?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="view" value="View Flight">
                        </a>
                        <a href="./updateFlight.jsp?id=<%=resultSet.getInt(1)%>&from_id=<%=resultSet.getInt(2)%>&to_id=<%=resultSet.getInt(3)%>">
                            <input type="button" name="update" value="Update Flight">
                        </a>
                        <a href="./DeleteFlightServlet?id=<%=resultSet.getInt(1)%>">
                            <input type="button" name="delete" value="Remove Flight">
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

    </body>
</html>
