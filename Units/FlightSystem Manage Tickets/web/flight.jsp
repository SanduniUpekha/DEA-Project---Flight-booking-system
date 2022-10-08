<%-- 
    Document   : flight
    Created on : Oct 1, 2022, 3:17:30 PM
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

        %> 
        <h1>Check Availability</h1>
        <form name="availability" method="POST" action="./AvailabilityCheckServlet">
            From <select name="from">
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
            </select> <br><br>

            To <select name="to">
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
            </select><br><br>
            Ticket Class <select name="class">
                <option value="0">Please Select</option>
                <option value="economy">Economy Class</option>
                <option value="business">Business Class</option>
            </select><br><br>
            Flight Type <select name="type">
                <option value="0">Please Select</option>
                <option value="round">Round Trip</option>
                <option value="one">One Way Trip</option>
            </select><br><br>
            Day <select name="day">
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
            </select><br><br>
            Flight Time <select name="time">
                <option value="">Please Select</option>
                <option value="06.30">6.30 A.M</option>
                <option value="14.00">2.00 P.M</option>
                <option value="22.30">10.30 P.M</option>
            </select><br><br>
            Flight Date <input type="date" name="flight_date"> <br><br>
            <input type="submit" value="Check Availability">
        </form>
    </body>
</html>
