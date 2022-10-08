<%-- 
    Document   : filterFlights
    Created on : Oct 2, 2022, 9:10:17 PM
    Author     : dhanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Controller.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Filter Flights</h1>
        <form name="filter_flight" method="POST" action="./FilterFlightServlet">
            Filter Flight by date <input type="date" name="date"> <br><br>
            <input type="submit" value="Filter Flight">
        </form>

        <%
            HttpSession httpSession = request.getSession();

            PreparedStatement preparedStatement;
            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            String date = httpSession.getAttribute("flight_date").toString();

            if (!date.equals("0")) {
                try {
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery("select @country_from := country.country from flight join `from` on `from`.id = flight.from_id join country on country.id = `from`.country_id where flight.date= '" + date + "'; ");
                    resultSet.next();
                    String fromCountry = resultSet.getString(1);

                    resultSet = statement.executeQuery("select @country_to := country.country from flight join `to` on `to`.id = flight.to_id join country on country.id = `to`.country_id where flight.date = '" + date + "'; ");
                    resultSet.next();
                    String toCountry = resultSet.getString(1);
                    if (toCountry.equals("one")) {
                        toCountry = "One way trip";
                    } else {
                        toCountry = "Round way trip";
                    }

                    resultSet = statement.executeQuery("select id, type, date from flight where date = '" + date + "'; ");
                    resultSet.next();


        %>
        <table>
            <tr>
                <th>Flight Id</th>
                <th>Country (From)</th>
                <th>Country (To)</th>
                <th>Country (To)</th>
            </tr>
        </table>

        <div><%=resultSet.getInt(1)%></div>
        <div><%=fromCountry%></div>
        <div><%=toCountry%></div>
        <div><%=resultSet.getString(2)%></div>
        <div><%=resultSet.getString(3)%></div>

        <%         } catch (Exception e) {
                    out.print(e.getMessage());
                }
            }


        %>
    </body>
</html>
