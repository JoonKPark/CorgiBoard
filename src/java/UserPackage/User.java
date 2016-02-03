package UserPackage;


import AuthPackage.*;
import java.io.Serializable;
import java.sql.*;
import Database.*;
/**
 * 
 * @author Leo
 */
public class User implements Serializable {
    
    private String username;
    private String password;
    private String firstName;
    private String lastName;
    private String email;
    private int userID;
    private int corgiID;
    
    /**
     * Constructor
     */
    public User(){
        
    }
    
    /**
     * Accessor method for username
     * @return 
     */
    public String getUsername(){
        return username;
    }
    /**
     * Accessor method for password
     * @return 
     */
    public String getPassword(){
        return password;
    }
    
    /**
     * Accessor method for firstName
     * @return 
     */
    public String getFirstName(){
        return firstName;
    }
    
    /**
     * Accessor method for lastName
     * @return 
     */
    public String getLastName(){
        return lastName;
    }
    
    /**
     * Accessor method for email
     * @return 
     */
    public String getEmail(){
        return email;
    }
    
    /**
     * Accessor method for userID
     * @return 
     */
    public int getUserID(){
        return userID;
    }
    
    
    /**
     * Mutator method for username
     * @param u 
     */
    public void setUsername(String u){
        username = u;
    }
    
    /**
     * Mutator method for password
     * @param pw 
     */
    public void setPassword(String pw){
        password = pw;
    }
    
    /**
     * Mutator method for firstName
     * @param fn 
     */
    public void setFirstName(String fn){
        firstName = fn;
    }
    
    /**
     * Mutator method for lastName
     * @param ln 
     */
    public void setLastName(String ln){
        lastName = ln;
    }
    
    /**
     * Mutator method for email
     * @param newEmail 
     */
    public void setEmail(String newEmail){
        email = newEmail;
    }
    
    /**
     * Mutator method for userID
     * @param id 
     */
    public void setUserID(int id){
        userID = id;
    }
    
    /**
     * method to search via dropdown menu
     */
    public void searchDropDown(){
        //implementation tba
    }
    
    /**
     * method to search via keywords
     */
    public void searchKeyWord(){
        //implementation tba
    }
    
    
    /**
     * method to authenticate the user 
     * returns true on successful authentication and false otherwise.
     * @param u
     * @param p
     * @return 
     */
    public Connection authenticate() throws SQLException{ 
        Connection c =  ConnectionManager.getConnection();
        Statement stmt = c.createStatement();
        String SQL = "SELECT * FROM tblUser WHERE UserName='" + username + "' && Password='" + password+ "'";
        ResultSet rs = stmt.executeQuery(SQL);
        while (rs.next()){
            if ((rs.getString("UserName")).equals(username)){
                if ((rs.getString("Password")).equals(password)){
                    return c;
                }
            }
        }
        c.close();
        return null;
    }
    
    public Course findCourse(int courseID) throws SQLException {
        Connection c = ConnectionManager.getConnection();
        Course toReturn = new Course();
        
        Statement stmt = c.createStatement();
        String SQL = "SELECT * FROM tblcourses WHERE CourseID =" + courseID;
        ResultSet rs = stmt.executeQuery(SQL);
        if (rs.next()) {
            toReturn.setCourseID(rs.getInt("CourseID"));
            toReturn.setCourseInstructor(rs.getString("Instructor"));
            toReturn.setCourseName(rs.getString("CourseName"));
            toReturn.setCourseNum(rs.getInt("CourseNum"));
            toReturn.setCourseTag(rs.getString("CourseTag"));
            toReturn.setAnnouncement(rs.getString("Announcement"));
        }
        
        return toReturn;
    }
    

    
}
