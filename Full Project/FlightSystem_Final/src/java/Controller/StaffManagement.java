/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Management;
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
public class StaffManagement {

    Connection connection;
    Statement statement;

    public int managementLogin(Management management) {
        int result;
        PreparedStatement preparedStatement;

        String username = management.getUsername();
        String password = management.getPassword();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_MANAGEMENT_AUTHENTICATE(?, ?)}");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                // int userId = resultSet.getInt(1);
                int sessionId = resultSet.getInt(1);
                String managementType = resultSet.getString(2);
                int staffGrade = resultSet.getInt(3);

                preparedStatement = connection.prepareStatement("{CALL SP_SESSION_LOGIN(?)}");
                preparedStatement.setInt(1, sessionId);
                resultSet = preparedStatement.executeQuery();

                // User logged in successfully
                management.setSessionID(sessionId);
                // management.setUserId(userId);

                if (managementType.equals("staff")) {
                    // Staff record
                    if (staffGrade == 1) {
                        // grade 1
                        result = 0;
                    } else {
                        // grade 2
                        result = 1;
                    }

                } else {
                    // Admin record
                    result = 2;
                }

            } else {
                // Username and password are incorrect
                result = 3;
            }
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(StaffManagement.class.getName()).log(Level.SEVERE, null, ex);

            // Have a database error
            return 4;
        }
    }

    public int staffCreate(Management management) {
        boolean result = false;
        int key = 5;
        int i = 0;

        String fullName = management.getFullName();
        int age = management.getAge();
        int nic = management.getNic();
        String email = management.getEmail();
        String username = management.getUsername();
        String password = management.getPassword();
        int grade = management.getGrade();

        String mergedName = fullName + " " + password;
        char[] chars = mergedName.toCharArray();
        int len = chars.length;
        char[] charArray = new char[len];

        for (char c : chars) {
            c += key;
            charArray[i] = c;
            i++;

        }

        String sessionName = new String(charArray);

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_MANAGEMENT_AUTHENTICATE(?, ?)}");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.next()) {
                String query = "{CALL SP_SESSION_INSERT (?)}";
                CallableStatement stmt = connection.prepareCall(query);

                stmt.setString(1, sessionName);
                ResultSet rs = stmt.executeQuery();
                rs.next();

                int sessionId = rs.getInt(1);
                query = "{CALL SP_STAFF_INSERT (?, ?, ?, ?, ?, ?, ?, ?)}";
                stmt = connection.prepareCall(query);

                stmt.setString(1, fullName);
                stmt.setInt(2, age);
                stmt.setInt(3, nic);
                stmt.setString(4, email);
                stmt.setString(5, username);
                stmt.setString(6, password);
                stmt.setInt(7, grade);
                stmt.setInt(8, sessionId);

                rs = stmt.executeQuery();

                // Insert Success
                management.setSessionID(sessionId);
                return 0;
            } else {

                // Error. Have same username and password for different accounts.
                return 1;
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 2;

        }

    }

    public int addStaff(Management management) {
        boolean result = false;
        int key = 5;
        int i = 0;

        String fullName = management.getFullName();
        int age = management.getAge();
        int nic = management.getNic();
        String email = management.getEmail();
        String username = management.getUsername();
        String password = management.getPassword();
        int grade = management.getGrade();

        String mergedName = fullName + " " + password;
        char[] chars = mergedName.toCharArray();
        int len = chars.length;
        char[] charArray = new char[len];

        for (char c : chars) {
            c += key;
            charArray[i] = c;
            i++;

        }

        String sessionName = new String(charArray);

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_MANAGEMENT_AUTHENTICATE(?, ?)}");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (!resultSet.next()) {
                String query = "{CALL SP_SESSION_INSERT (?)}";
                CallableStatement stmt = connection.prepareCall(query);

                stmt.setString(1, sessionName);
                ResultSet rs = stmt.executeQuery();
                rs.next();

                int sessionId = rs.getInt(1);
                query = "{CALL SP_STAFF_ADD (?, ?, ?, ?, ?, ?, ?, ?)}";
                stmt = connection.prepareCall(query);

                stmt.setString(1, fullName);
                stmt.setInt(2, age);
                stmt.setInt(3, nic);
                stmt.setString(4, email);
                stmt.setString(5, username);
                stmt.setString(6, password);
                stmt.setInt(7, grade);
                stmt.setInt(8, sessionId);

                rs = stmt.executeQuery();

                // Insert Success
                management.setSessionID(sessionId);
                return 0;
            } else {

                // Error. Have same username and password for different accounts.
                return 1;
            }

        } catch (SQLException ex) {
            Logger.getLogger(StaffManagement.class.getName()).log(Level.SEVERE, null, ex);
            return 2;

        }
    }

    public int approveStaff(Management management) {
        int result;

        int staffId = management.getUserId();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {

            String query = "{CALL SP_MANAGEMENT_APPROVE (?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, staffId);

            ResultSet rs = stmt.executeQuery();

            // Approved successfully
            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }

    }

    public int rejectStaff(Management management) {
        int staffId = management.getUserId();
        String username = management.getUsername();
        String password = management.getPassword();
        int sessionId = management.getSessionID();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {

            String query = "{CALL SP_MANAGEMENT_REJECT (?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, staffId);
            stmt.setString(2, username);
            stmt.setString(3, password);
            stmt.setInt(4, sessionId);

            ResultSet rs = stmt.executeQuery();

            // Rejected successfully
            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(StaffManagement.class.getName()).log(Level.SEVERE, null, ex);
            return 1;

        }
    }
    
    public int managementLogOut(Management management) {
        int sessionId = management.getSessionID();
        
        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();
        
        try {
            preparedStatement = connection.prepareStatement("{CALL SP_SESSION_LOGOUT(?)}");
            preparedStatement.setInt(1, sessionId);

            ResultSet resultSet = preparedStatement.executeQuery();
            
            // Logged out successfully
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(StaffManagement.class.getName()).log(Level.SEVERE, null, ex);
            
            // Have a database error
            return 1;
        }
    }

}
