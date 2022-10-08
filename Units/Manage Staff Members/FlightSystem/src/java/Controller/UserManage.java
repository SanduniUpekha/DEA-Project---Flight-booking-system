/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

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
public class UserManage {

    Connection connection;
    Statement statement;

    public int UserRegister(User user) {
        boolean result = false;
        int key = 5;
        int i = 0;

        String fullName = user.getFullName();
        int age = user.getAge();
        int nic = user.getNic();
        String email = user.getEmail();
        String username = user.getUsername();
        String password = user.getPassword();

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
            preparedStatement = connection.prepareStatement("{CALL SP_USER_LOGIN(?, ?)}");
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
                query = "{CALL SP_USER_INSERT (?, ?, ?, ?, ?, ?, ?)}";
                stmt = connection.prepareCall(query);

                stmt.setString(1, fullName);
                stmt.setInt(2, age);
                stmt.setInt(3, nic);
                stmt.setString(4, email);
                stmt.setString(5, username);
                stmt.setString(6, password);
                stmt.setInt(7, sessionId);

                rs = stmt.executeQuery();

                // Insert Success
                user.setSessionId(sessionId);
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

    public int userLogin(User user) {
        int result;
        PreparedStatement preparedStatement;

        String username = user.getUsername();
        String password = user.getPassword();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            preparedStatement = connection.prepareStatement("{CALL SP_USER_LOGIN(?, ?)}");
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int userId = resultSet.getInt(1);

                int sessionId = resultSet.getInt(8);
                preparedStatement = connection.prepareStatement("{CALL SP_SESSION_LOGIN(?)}");
                preparedStatement.setInt(1, sessionId);
                resultSet = preparedStatement.executeQuery();

                // User logged in successfully
                user.setSessionId(sessionId);
                user.setUserId(userId);
                result = 0;
            } else {
                // Username and password are incorrect
                result = 1;
            }
            return result;
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);

            // Have a database error
            return 2;
        }
    }

    public int userUpdate(User user) {
        boolean result = false;
        int key = 5;
        int i = 0;

        int userId = user.getUserId();
        String fullName = user.getFullName();
        int age = user.getAge();
        int nic = user.getNic();
        String email = user.getEmail();
        String username = user.getUsername();
        String password = user.getPassword();

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

            String query = "{CALL SP_USER_UPDATE (?, ?, ?, ?, ?, ?, ?)}";
            CallableStatement stmt = connection.prepareCall(query);

            stmt.setInt(1, userId);
            stmt.setString(2, fullName);
            stmt.setInt(3, age);
            stmt.setInt(4, nic);
            stmt.setString(5, email);
            stmt.setString(6, username);
            stmt.setString(7, password);

            ResultSet rs = stmt.executeQuery();

            // Insert Success
            return 0;

        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 2;

        }
    }

    public int userBlock(User user) {
        int userId = user.getUserId();

        PreparedStatement preparedStatement;
        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_USER_BLOCK (?)}";

            CallableStatement stmt = connection.prepareCall(query);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            // User blocked successfully
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }
    
    public int userUnblock (User user) {
        int userId = user.getUserId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_USER_UNBLOCK (?)}";

            CallableStatement stmt = connection.prepareCall(query);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            // User Unblocked successfully
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }

    public int userDelete(User user) {
        int userId = user.getUserId();

        DBConnection dBConnection = new DBConnection();
        connection = dBConnection.getConnection();

        try {
            String query = "{CALL SP_USER_DELETE (?)}";

            CallableStatement stmt = connection.prepareCall(query);
            stmt.setInt(1, userId);

            ResultSet rs = stmt.executeQuery();

            // User blocked successfully
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
            return 1;
        }
    }

}
