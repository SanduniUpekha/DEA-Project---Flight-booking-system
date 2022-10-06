<%-- 
    Document   : reservation
    Created on : Oct 1, 2022, 4:27:12 PM
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
        <%                                DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            Cookie cookies[] = request.getCookies();
            int sessionId = 0;

            for (Cookie c : cookies) {
                if (c.getName().equals("session_id")) {
                    sessionId = Integer.parseInt(c.getValue());
                }
            }

        %>

        <h1>Reservation</h1>
        <h4>Passenger name</h4>
        <%                                    try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select * from user where session_id = " + sessionId + " ");

                resultSet.next();

                String fullName = resultSet.getString(2);
                int idx = fullName.lastIndexOf(' ');
                String firstName = fullName.substring(0, idx);
                String lastName = fullName.substring(idx + 1);
        %>
        <form name="reserve" method="POST" action="./ReserveFlightServlet">
            <div class="col form-group">
                <input type="text" name="name" class="form-control" value="<%=firstName%>" readonly>
                <input type="email" class="form-control" name="email" value="<%=lastName%>" readonly>
            </div>

            <h4>Passport Number</h4>
            <div class="form-group">
                <input type="test" name="subject" value="<%=resultSet.getInt(6)%>" readonly>
            </div>
            <h4>Date of Birth</h4>
            <div class="form-group">
                <input type="text" name="subject" value="<%=resultSet.getString(3)%>" readonly>
            </div>
            <h4>Email</h4>
            <div class="form-group">
                <input type="email" name="subject" value="<%=resultSet.getString(7)%>" readonly>
            </div>
            <h4>Phone number</h4>
            <div class="form-group">
                <input type="text" class="form-control" name="phone" id="contact_name" placeholder="##########">
            </div>
            <h4>Address</h4>
            <div class="form-group">
                <input type="text" class="form-control" name="address" id="contact_name" placeholder="25, james street, colombo 5">
            </div> <br><br>
            <input type="submit" value="Reserve Flight">

        </form>
        <% } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
