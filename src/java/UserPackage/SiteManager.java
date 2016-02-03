
package UserPackage;
import Database.ConnectionManager;
import java.io.Serializable;
import java.sql.*;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 * class representing a Teachers Assistant
 * extends the user superclass
 * @author Leo
 */
public class SiteManager extends User implements Serializable {
    
    /**
     * Constructor for TeacherAssistant
     */
    public SiteManager(){
        super();
    }
    
    /**
     * method to create a course
     */
    public String createCourse(Course c, int instructorCorgiID) throws SQLException{
        try {
            try (Connection con = ConnectionManager.getConnection()) {
                int courseId = 0;
                String msg;
                String iName;
                if ((iName=getInstructorName(con,instructorCorgiID)).equals("")){
                    return "Error: Instructor not found,";
                }
                if (!((msg=checkUserStatus(con,instructorCorgiID,2)).equals(""))){
                    return msg;
                }
                if (!((msg = updateHighestUserClassID(instructorCorgiID,getHighestCourseID(con)))).equals("")){
                    return msg;
                }
                String query = " INSERT INTO tblcourses (CourseName, CourseTag, Instructor, CourseID, CourseNum)"
                        + " values(?, ?, ?, ?, ?)";
                PreparedStatement statement1 = con.prepareStatement(query);
                statement1.setString(1, c.getCourseName());
                statement1.setString(2, c.getCourseTag());
                statement1.setString(3, iName);
                courseId = getHighestCourseID(con);
                statement1.setInt(4,courseId);
                statement1.setInt(5, c.getCourseNum());
                statement1.executeUpdate();

                con.close();
                statement1.close();           
                return "";
            }
            
        }catch (Exception e) {
        }
        return "An Error Occured while creating the course. Please try again.";
    }
    
    public String registerCourse(int courseId, int corgi){


               String msg = "";
                if (!((msg = updateHighestUserClassID(corgi,courseId))).equals("")){
                    return msg;
                }
               else{
                   return "";
               }
        
    }
    public String unregisterCourse(int courseId, int corgi){

        String msg = "";
         if (!((msg = updateChosenUserClassID(corgi,courseId, -1))).equals("")){
                    return msg;
                }
         else
             return "";
    }
    public String getInstructorName(Connection c, int corgi){
         try {
            Statement stmt = c.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID=" +
                    corgi + "";
           ResultSet rs = stmt.executeQuery(SQL);
           if (rs.next()){
              return rs.getString("FirstName")+" "+rs.getString("LastName");
           }
           else{
               return "";
           }
           }catch (Exception e) {
        }
         return "";
    }
    
    public String getInstructorName(int corgi){
                try {
            try (Connection con = ConnectionManager.getConnection()) {
             Statement stmt = con.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID=" +
                    corgi + "";
           ResultSet rs = stmt.executeQuery(SQL);
           if (rs.next()){
               con.close();
               stmt.close();
              return rs.getString("FirstName")+" "+rs.getString("LastName");
           }
           else{
               con.close();
               stmt.close();
               return "";
           }
            } }catch (Exception e) {
        }
         return "";
    }
   public String checkUserStatus(Connection c, int corgi, int userTypeRequired){
         try {
            Statement stmt = c.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID=" +
                    corgi + "";
           ResultSet rs = stmt.executeQuery(SQL);
           if (rs.next()){
               if (rs.getInt("Type")!=userTypeRequired){
                   return "Error: Mismatched User Type";}
               else{
                   return "";
               }
           }
           else{
               return "Error: No Such User Found";
           }
           }catch (Exception e) {
        }
         return "Error in checking user type";
   }
   
   public boolean isUserRegistered(int corgi, int courseID){
        try {
            try (Connection c = ConnectionManager.getConnection()) {
            Statement stmt = c.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID=" +
                    corgi + "";
           ResultSet rs = stmt.executeQuery(SQL);
           
           if (rs.next()){
              if (rs.getInt("classOne")==courseID)
              {
                  c.close();
                   stmt.close();
                  return true;
              }
              if (rs.getInt("classTwo")==courseID)
                  {
                  c.close();
                   stmt.close();
                  return true;
              }
              if (rs.getInt("classThree")==courseID)
                 {
                  c.close();
                   stmt.close();
                  return true;
              }
              if (rs.getInt("classFour")==courseID)
                  {
                  c.close();
                   stmt.close();
                  return true;
              }
              if (rs.getInt("classFive")==courseID)
                  {
                  c.close();
                   stmt.close();
                  return true;
              }
           }
                c.close();
                   stmt.close();
               return false;
      
            }
           }catch (Exception e) {
        }
         return false;
   }
   public static int getChosenUserClassID(Connection con,int corgi,int oldCid){
        try {
            Statement stmt = con.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID=" +
                    corgi + "";
           ResultSet rs = stmt.executeQuery(SQL);
           rs.next();
              if (Integer.parseInt(rs.getString("classOne"))==oldCid)
                  return 1;
              else if (Integer.parseInt(rs.getString("classTwo"))==oldCid)
                  return 2;
              else if (Integer.parseInt(rs.getString("classThree"))==oldCid)
                  return 3;
              else if (Integer.parseInt(rs.getString("classFour"))==oldCid)
                  return 4;
              else if (Integer.parseInt(rs.getString("classFive"))==oldCid)
                  return 5;
           stmt.close();
        } catch (SQLException ex) {
        }
        return 6;
   }
   public static String updateChosenUserClassID(int corgi, int oldCid, int newCid){
       try {
            try (Connection con = ConnectionManager.getConnection()) {
                int highest = getChosenUserClassID(con,corgi, oldCid);
                String  sql = 
                "UPDATE tblUser " + 
                "  SET classOne = ? " + 
                "WHERE CorgiID = ?";
                
                    
                switch (highest){
                    case 1: sql = 
                "UPDATE tblUser " + 
                "  SET classOne = ? " + 
                "WHERE CorgiID = ?";break;
                    case 2: sql = 
                "UPDATE tblUser " + 
                "  SET classTwo = ? " + 
                "WHERE CorgiID = ?";break;
                    case 3: sql = 
                "UPDATE tblUser " + 
                "  SET classThree = ? " + 
                "WHERE CorgiID = ?";break;
                    case 4: sql = 
                "UPDATE tblUser " + 
                "  SET classFour = ? " + 
                "WHERE CorgiID = ?";break;
                    case 5: sql = 
                "UPDATE tblUser " + 
                "  SET classFive = ? " + 
                "WHERE CorgiID = ?";break;
                    default: return "User is already deregistered from the course.";
                }
                PreparedStatement pstmt = con.prepareStatement(sql);

                pstmt.setInt(1, newCid);

                pstmt.setInt(2, corgi);
                pstmt.executeUpdate();

                con.close();
                pstmt.close();      
                return "";
            }
            
        }catch (Exception e) {
        }
        return "An error occured while deregistering a User.";
   }
    public static String updateHighestUserClassID(int corgi, int cId){
         try {
            try (Connection con = ConnectionManager.getConnection()) {
                int highest = getHighestEmptyUserClassID(con,corgi);
                String  sql = 
                "UPDATE tblUser " + 
                "  SET classOne = ? " + 
                "WHERE CorgiID = ?";
                
                    
                switch (highest){
                    case 1: sql = 
                "UPDATE tblUser " + 
                "  SET classOne = ? " + 
                "WHERE CorgiID = ?";break;
                    case 2: sql = 
                "UPDATE tblUser " + 
                "  SET classTwo = ? " + 
                "WHERE CorgiID = ?";break;
                    case 3: sql = 
                "UPDATE tblUser " + 
                "  SET classThree = ? " + 
                "WHERE CorgiID = ?";break;
                    case 4: sql = 
                "UPDATE tblUser " + 
                "  SET classFour = ? " + 
                "WHERE CorgiID = ?";break;
                    case 5: sql = 
                "UPDATE tblUser " + 
                "  SET classFive = ? " + 
                "WHERE CorgiID = ?";break;
                    default: return "User cannot be registered into any more courses.";
                }
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setInt(1, cId);
                pstmt.setInt(2, corgi);
                pstmt.executeUpdate();

                con.close();
                pstmt.close();      
                return "";
            }
            
        }catch (Exception e) {
        }
        return "An error occured while registering a User.";
    }
    
    
    public static int getHighestCourseID(Connection c){
        int result = 0;
        try {
            Statement stmt = c.createStatement();
            String SQL = "SELECT * FROM tblcourses";
           ResultSet rs = stmt.executeQuery(SQL);
           while (rs.next()){
               if (rs.getInt("CourseID")>=result){
                   result = rs.getInt("CourseID")+1;
               }
           }
           stmt.close();
        } catch (SQLException ex) {
        }
        return result;
    }
    
    public static int getCorgiIDFromName(String fullName){
              try {
            try (Connection con = ConnectionManager.getConnection()) {
            Statement stmt = con.createStatement();
            String SQL = "SELECT * FROM tblUser";
           ResultSet rs = stmt.executeQuery(SQL);
           while (rs.next()){
               if ((rs.getString("FirstName") + " "+ rs.getString("LastName")).equals(fullName)){
                   stmt.close();
                con.close();
                   return rs.getInt("CorgiID");
               }
           }
           stmt.close();
           con.close();
        }} catch (SQLException ex) {
        }
        return 6;
    }
    
    public static int getHighestEmptyUserClassID(Connection c, int corgi){
        try {
            Statement stmt = c.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID=" +
                    corgi;
           ResultSet rs = stmt.executeQuery(SQL);
           rs.next();
              if (Integer.parseInt(rs.getString("classOne"))==-1)
                  return 1;
              else if (Integer.parseInt(rs.getString("classTwo"))==-1)
                  return 2;
              else if (Integer.parseInt(rs.getString("classThree"))==-1)
                  return 3;
              else if (Integer.parseInt(rs.getString("classFour"))==-1)
                  return 4;
              else if (Integer.parseInt(rs.getString("classFive"))==-1)
                  return 5;
           stmt.close();
        } catch (SQLException ex) {
            System.out.println("SQL Error!");
        }
        return 6;
    }
   
    
    public String modifyCourse(int old, Course c, int instructorCorgiID, int oldInstructorCorgiID) throws SQLException{
       try {
            try (Connection con = ConnectionManager.getConnection()) {
                int courseId = 0;
                String msg;
                String iName;
                if ((iName=getInstructorName(con,instructorCorgiID)).equals("")){
                    return "Error: New Instructor not found,";
                }
                this.unregisterCourse(old, oldInstructorCorgiID);
                this.registerCourse(old,instructorCorgiID);
               
               
                PreparedStatement statement1 = con.prepareStatement("UPDATE tblcourses SET CourseName = ?, CourseTag = ?, Instructor = ?, CourseNum = ? WHERE CourseID = ?");
                statement1.setString(1, c.getCourseName());
                statement1.setString(2, c.getCourseTag());
                statement1.setString(3, iName);
                statement1.setInt(4,c.getCourseNum());
                statement1.setInt(5, old);
                statement1.executeUpdate();

                con.close();
                statement1.close();           
                return "";
            }
            
        }catch (Exception e) {
        }
        return "An Error Occured while modifying the course. Please try again.";
    }
    
    public boolean deleteCourse(Course c)throws SQLException{
        try {
            try (Connection con = ConnectionManager.getConnection()) {
                String query = " delete from tblcourses where CourseID = ?";
                PreparedStatement statement = con.prepareStatement(query);
                statement.setInt(1,c.getCourseID());
                statement.executeUpdate();
                con.close();
                statement.close();
                return true;
            }
            
        }catch (Exception e) {
        }
        return false;
    }
        
    

    
}
