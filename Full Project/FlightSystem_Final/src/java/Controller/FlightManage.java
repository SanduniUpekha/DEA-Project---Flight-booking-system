/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Flight;
import Model.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author dhanu
 */
public class FlightManage {

    Connection connection;
    Statement statement;

    public int checkAvailability(Flight flight) {
        String ticket_class = flight.getTicket_class();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_TICKET_CHECK(?)}");
            preparedStatement.setString(1, ticket_class);

            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();
            int count = resultSet.getInt(1);

            if (ticket_class.equals("economy")) {
                if (count > 20) {
                    return 1;
                } else {
                    return 0;
                }
            } else {
                if (count > 50) {
                    return 1;
                } else {
                    return 0;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(FlightManage.class.getName()).log(Level.SEVERE, null, ex);
            return 2;
        }
    }

    public int reservationInsert(Flight flight, User user) {
        int sessionId = user.getSessionId();
        int phone = user.getPhone();
        String address = user.getAddress();
        int from = Integer.parseInt(flight.getFrom());
        int to = Integer.parseInt(flight.getTo());
        String ticketClass = flight.getTicket_class();
        String flightType = flight.getFlight_type();
        int day = Integer.parseInt(flight.getDay());
        String flightTime = flight.getFlight_time();
        String flightDate = flight.getFlight_date();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_RESERVE_INSERT(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            preparedStatement.setInt(1, from);
            preparedStatement.setInt(2, to);
            preparedStatement.setString(3, ticketClass);
            preparedStatement.setString(4, flightType);
            preparedStatement.setInt(5, day);
            preparedStatement.setString(6, flightTime);
            preparedStatement.setString(7, flightDate);
            preparedStatement.setString(8, address);
            preparedStatement.setInt(9, phone);
            preparedStatement.setInt(10, sessionId);

            ResultSet resultSet = preparedStatement.executeQuery();

            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(FlightManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }

    public int updateFlight(Flight flight) {
        int from = Integer.parseInt(flight.getFrom());
        int to = Integer.parseInt(flight.getTo());
        String flightType = flight.getFlight_type();
        String flightDate = flight.getFlight_date();
        int from_oldCountryId = flight.getFrom_oldCountryId();
        int to_oldCountryId = flight.getTo_oldCountryId();
        int flightId = flight.getFlight_id();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_UPDATE_FLIGHT(?, ?, ?, ?, ?, ?, ?)}");
            preparedStatement.setInt(1, from);
            preparedStatement.setInt(2, from_oldCountryId);
            preparedStatement.setInt(3, to);
            preparedStatement.setInt(4, to_oldCountryId);
            preparedStatement.setString(5, flightType);
            preparedStatement.setString(6, flightDate);
            preparedStatement.setInt(7, flightId);

            ResultSet resultSet = preparedStatement.executeQuery();

            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(FlightManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }

    public int deleteFlight(Flight flight) {
        int flightId = flight.getFlight_id();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_DELETE_FLIGHT(?)}");
            preparedStatement.setInt(1, flightId);

            ResultSet resultSet = preparedStatement.executeQuery();

            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(FlightManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }

    public int insertFlight(Flight flight) {
        int from = Integer.parseInt(flight.getFrom());
        int to = Integer.parseInt(flight.getTo());
        String type = flight.getFlight_type();
        String date = flight.getFlight_date();
        
        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();
        
        try {
            preparedStatement = connection.prepareStatement("{CALL SP_FLIGHT_INSERT(?, ?, ?, ?)}");
            preparedStatement.setInt(1, from);
            preparedStatement.setInt(2, to);
            preparedStatement.setString(3, type);
            preparedStatement.setString(4, date);

            ResultSet resultSet = preparedStatement.executeQuery();

            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(FlightManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }
}
