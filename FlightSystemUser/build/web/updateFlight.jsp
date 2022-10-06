<%-- 
    Document   : updateFlight
    Created on : Oct 2, 2022, 7:04:42 PM
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
        <%                                DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            HttpSession httpSession = request.getSession();

            int flightId = Integer.parseInt(request.getParameter("id"));
            int from_oldCountryId = Integer.parseInt(request.getParameter("from_id"));
            int to_oldCountryId = Integer.parseInt(request.getParameter("to_id"));
            
            httpSession.setAttribute("from_oldCountryId", from_oldCountryId);
            httpSession.setAttribute("to_oldCountryId", to_oldCountryId);

        %> 
        <h1>Update Flight</h1>
        <form name="update_flight" method="POST" action="./UpdateFlightServlet">
            Flight Id <input type="text" name="id" value="<%=flightId%>" readonly> <br><br>
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
            Flight Type <select name="type">
                <option value="0">Please Select</option>
                <option value="round">Round Trip</option>
                <option value="one">One Way Trip</option>
            </select><br><br>

            Flight Date <input type="date" name="flight_date"> <br><br>
            
            <input type="submit" value="Update Flight">
        </form>
    </body>
</html>
