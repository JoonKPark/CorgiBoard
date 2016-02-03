package AuthPackage;

import java.sql.*;
import java.util.*;
import Database.*;
import UserPackage.*;
import java.text.*;


/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Owner
 */
public class Authenticator {

    private String username;
    private String password;
    private int    type;
    private int     ID;
    private String firstName;
    private String lastName;
    private int corgiId;
    private boolean success = false;

    Connection newCon = null;
    Statement stmt = null;
    ResultSet rs = null;

    public Authenticator() {
    }

    public int getCorgiId() {
        return corgiId;
    }

    public void setCorgiId(int corgiId) {
        this.corgiId = corgiId;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public int getType() {
        return type;
    }
    
    public int getID(){
        return ID;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }
    
    

    public void setType(int type) {
        this.type = type;
    }       

    public void setUsername(String un) {
        username = un;
    }

    public void setPassword(String pw) {
        password = pw;
    }

    public boolean authenticate() {
        String searchQuery
                = "select * from tblUser where UserName='"
                + username
                + "' AND Password='"
                + password
                + "'";
        try {
            System.out.println("Searching for " + username + " using password " + password);
            newCon = ConnectionManager.getConnection();
            stmt = newCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            rs.next();
            
            System.out.println("User found in table.");
            
            ID = rs.getInt("userID");
            firstName = rs.getString("FirstName");
            lastName = rs.getString("LastName");
            String userName = rs.getString("UserName");
            type = rs.getInt("Type");

            corgiId = rs.getInt("CorgiID");
            Calendar calendar = Calendar.getInstance();
            //DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            java.sql.Date currentTime = new java.sql.Date(calendar.getTime().getTime());
            //java.util.Date date = new java.util.Date();
            
            
            
            String logMessage = "User logged in successfully.";
            String log = "INSERT INTO corgiboardDB.tbllogs(id, dateTime, userName, strLOG, type) VALUES (?,?,?,?,?)";

            PreparedStatement statement = newCon.prepareStatement(log);
            statement.setInt(1, ID);
            statement.setDate(2, currentTime);
            statement.setString(3,userName);
            statement.setString(4, logMessage);
            statement.setInt(5, type);
            statement.execute();
            
            
                return true;
        } catch (Exception e) {
            System.out.println("Exception thrown");
            e.printStackTrace();
            return false;
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (Exception e) {
                }
                rs = null;
            }

            if (stmt != null) {
                try {
                    stmt.close();
                } catch (Exception e) {
                }
                stmt = null;
            }

            if (newCon != null) {
                try {
                    newCon.close();
                } catch (Exception e) {
                }

                newCon = null;
            }
        }
    }


}
