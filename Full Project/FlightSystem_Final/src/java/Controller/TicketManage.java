/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Ticket;
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
public class TicketManage {
    Connection connection;
    Statement statement;
    
    public int deleteTicket(Ticket ticket) {
        int ticketId = ticket.getTicketId();
        
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();
        
        try {
            String query = "{CALL SP_TICKET_DELETE (?)}";

            CallableStatement stmt = connection.prepareCall(query);
            stmt.setInt(1, ticketId);

            ResultSet rs = stmt.executeQuery();

            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }
    
    public int updateTicket(Ticket ticket) {
        int ticketId = ticket.getTicketId();
        String ticketType = ticket.getTicketType();
        String time = ticket.getTime();
        int day = ticket.getDay();
        
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();
        
        try {
            String query = "{CALL SP_TICKET_UPDATE (?, ?, ?, ?)}";

            CallableStatement stmt = connection.prepareCall(query);
            stmt.setInt(1, ticketId);
            stmt.setInt(2, day);
            stmt.setString(3, time);
            stmt.setString(4, ticketType);

            ResultSet rs = stmt.executeQuery();

            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(TicketManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }
}
