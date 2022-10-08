<%-- 
    Document   : viewFlight
    Created on : Oct 2, 2022, 5:46:52 PM
--%>

<%@page import="java.sql.PreparedStatement"%>
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
            PreparedStatement preparedStatement;
            DBConnection dBConnection = new DBConnection();
            Connection connection = dBConnection.getConnection();

            int flightId = Integer.parseInt(request.getParameter("id"));

        %>
        <%                                    try {
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("select @country_from := country.country from flight join `from` on `from`.id = flight.from_id join country on country.id = `from`.country_id where flight.id= " + flightId + "; ");
                resultSet.next();
                String fromCountry = resultSet.getString(1);

                resultSet = statement.executeQuery("select @country_to := country.country from flight join `to` on `to`.id = flight.to_id join country on country.id = `to`.country_id where flight.id = " + flightId + "; ");
                resultSet.next();
                String toCountry = resultSet.getString(1);
                
                resultSet = statement.executeQuery("select id, type, date from flight where id = " + flightId + "; ");
                resultSet.next();
        %>

        <div><%=resultSet.getInt(1)%></div>
        <div><%=fromCountry%></div>
        <div><%=toCountry%></div>
        <div><%=resultSet.getString(2)%></div>
        <div><%=resultSet.getString(3)%></div>

        <% } catch (Exception e) {
                out.print(e.getMessage());
            }

        %>
    </body>
</html>
