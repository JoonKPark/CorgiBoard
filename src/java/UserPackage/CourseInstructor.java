package UserPackage;
import Database.ConnectionManager;
import java.io.Serializable;
import java.sql.*;
import java.util.*;
import javax.swing.JOptionPane;


/**
 * CourseInstructor class, extends the User class
 * @author Leo
 */
public class CourseInstructor extends User implements Serializable {

     private ArrayList<Course> teaching;  
    
    /**
     * Constructor for CourseInstructor
     */
    public CourseInstructor(){
        super();
    }
    
    /**
     * method to create Assignment
     */
    public boolean createAssignment(Assignment c) throws SQLException{
          try {
            try (Connection con = ConnectionManager.getConnection()) {
        
            String query = " insert into tblassignment (AssignmentID, Descr, PointPossible, AssignmentSpec, CourseID)"
                    + " values(?,?,?,?,?)";
            PreparedStatement statement = con.prepareStatement(query);
            statement.setInt(1,c.getAssignmentId());
            statement.setString(2,c.getAssignmentDescr());
           // statement.setDate(3,c.getDueDate());
            statement.setInt(3, c.getMaxPts());
            statement.setString(4, c.getSpecifications());
            statement.setInt(5, c.getCourseId());
            statement.execute();
             statement.close();
             con.close();
             return true;
                 }
           }catch (Exception e) {
               
        }
        return false;
    }
    
    public boolean deleteAssignment(Assignment c)throws SQLException{
        try {
            try (Connection con = ConnectionManager.getConnection()) {
                String query = " delete from tblassignment where AssignmentID = ?";
                PreparedStatement statement = con.prepareStatement(query);
                statement.setInt(1,c.getAssignmentId());
                statement.executeUpdate();
                con.close();
                statement.close();
                return true;
            }
            
        }catch (Exception e) {
        }
        return false;
    }
    
    /**
     * method to modify assignment
     * @param x 
     */
    public boolean modifyAssignment(Assignment old,  Assignment newA) throws SQLException{
      int x = old.getAssignmentId();
      if (this.deleteAssignment(old))
          if (this.createAssignment(newA))
              return true;
      return false;
    }
    
    /**
     * method to appoint TA
     * @param ta 
     */
    public void appointTA(TeacherAssistant ta, Course c) throws SQLException{
       Connection con;
        if ((con=super.authenticate())!=null){
           String query = " insert into users (usernames, userpasswords, userID, userType, date_created, course_id)"
                    + " values(?, ?, ?, ?, ?)";
            Calendar calendar = Calendar.getInstance();
            java.sql.Date currentTime = new java.sql.Date(calendar.getTime().getTime());    
            PreparedStatement statement = con.prepareStatement(query);
            statement.setString(1, ta.getUsername());
            statement.setString(2, ta.getPassword());
            statement.setInt(3, ta.getUserID());
            statement.setString(4, "Teaching Assistant");
            statement.setDate(5,currentTime);
            statement.setInt(6, c.getCourseID());
            statement.execute();
        }
        con.close();
    }
    
    /**
     * method to upload assignment specs
     */
    public void uploadAssignmentSpecs(){
        //implementation tba
    }
    
    /**
     * method to view submissions
     * @return 
     */
   public ArrayList<Assignment> viewSubmissions() throws SQLException{
        Connection con;
        ArrayList<Assignment> res = new ArrayList<Assignment>();
        if ((con=super.authenticate())!=null){
            Statement statemnt = con.createStatement();
            ResultSet result = statemnt.executeQuery("SELECT * from assignment");
            while (result.next()){
                Assignment temp = new Assignment();

                res.add(temp);
            }
        }
        
        con.close();
        return res;
    }
    
   /**
    * method to mark assignments
    * @param as 
    */
    public void markAssignment(Assignment as, int grade) throws SQLException{
       Connection con;
        if ((con=super.authenticate())!=null){
            Statement statemnt = con.createStatement();
            ResultSet result = statemnt.executeQuery("SELECT * from assignment");
            while (result.next()){
                String query = " update assignments (assignment_grade)"
                    + " values(?) where assignment_id = ?";
                PreparedStatement update = con.prepareStatement(query);
                update.setInt(1,grade);
                update.execute();
            }
        }
        con.close();
    }
    
    /**
     * method to leave comments on assignments
     * @param as
     * @param s 
     */
    public void leaveComment(Assignment as, String s) throws SQLException{
         Connection con;
        if ((con=super.authenticate())!=null){
            Statement statemnt = con.createStatement();
            ResultSet result = statemnt.executeQuery("SELECT * from assignment");
            while (result.next()){
                String query = " update assignments (assignment_comment)"
                    + " values(?) where assignment_id = ?";
                PreparedStatement update = con.prepareStatement(query);
                update.setString(1,s);
                update.execute();
            }
        }
        con.close();
    }
    
    public boolean isUserTeaching(int corgi, int courseID) {
        try (Connection c = ConnectionManager.getConnection()) {
            Statement stmt = c.createStatement();
            String SQL = "SELECT * FROM tblUser WHERE CorgiID="
                    + corgi + " AND Type = 2";
            ResultSet rs = stmt.executeQuery(SQL);

            if (rs.next()) {
                System.out.println(rs.toString());
                if (rs.getInt("classOne") == courseID
                        || rs.getInt("classTwo") == courseID
                        || rs.getInt("classThree") == courseID
                        || rs.getInt("classFour") == courseID
                        || rs.getInt("classFive") == courseID) {
                    c.close();
                    stmt.close();
                    return true;
                }
            } else {
                c.close();
                stmt.close();
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public String makeAnnouncement(int courseID,String s,int corgiID) throws SQLException {
        if (!s.equals(null) && !s.equals("")) {
            try (Connection con = ConnectionManager.getConnection()) {
                
                if (isUserTeaching(corgiID,courseID)) {
                    Course c = findCourse(courseID);
                    c.addAnnouncement(s);
                    String query = "UPDATE tblcourses SET Announcement= ? WHERE CourseID= ?";
                
                
                
                    PreparedStatement pstmt = con.prepareStatement(query);
                    
                    pstmt.setString(1, c.getAnnouncement());
                    pstmt.setInt(2, courseID);
                
                    pstmt.executeUpdate();
                
                    con.close();
                    pstmt.close();
                    
                    return "";
                }
                else return "You aren't the instructor to this course.";
                
            } catch (SQLException e) {
                e.printStackTrace();
                return "Something went wrong.";
            }
        }
        else return "Enter an announcement.";
    }
        
        
        
    
}
