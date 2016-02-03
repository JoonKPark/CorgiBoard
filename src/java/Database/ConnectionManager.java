package Database;

/**
 * This package is used to connect to the database.
 * The code was originally written and posted on met.guc.edu.eg
 * 
 */

import java.sql.*;
import java.util.*;

public class ConnectionManager {

    static Connection con;
    static String url;

    public static Connection getConnection() {
        
        try {
            // NOTE: NEVER DO THIS FOR ACTUAL DEPLOYMENT LOL
            
            String url = "jdbc:mysql://104.196.111.246:3306/corgiboardDB?user=root";
            String username = "root";
            String password = "corgi";

            Class.forName("com.mysql.jdbc.Driver");

            try {
                con = DriverManager.getConnection(url, username, password);
                System.out.println(con.toString());
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.out.println(e);
        }

        return con;
    }
}
