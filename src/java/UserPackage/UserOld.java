/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserPackage;

import AuthPackage.*;
import Database.*;
import java.sql.*;

/**
 *
 * @author Owner
 */
public class UserOld {

    private String username;
    private String name;
    private int permissions;

    private Connection newCon;
    private Statement stmt;
    private ResultSet rs;

    public UserOld() {
    }

    public UserOld(String un) {
        username = un;
        String searchQuery
                = "select * from tblUser where UserName='"
                + username
                + "'";
        try {
            newCon = ConnectionManager.getConnection();
            stmt = newCon.createStatement();
            rs = stmt.executeQuery(searchQuery);
            permissions = rs.getInt("Type");
            name = rs.getString("FirstName");
        } catch (Exception e) {
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
