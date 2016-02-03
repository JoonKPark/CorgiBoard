package UserPackage;

import Database.ConnectionManager;
import java.io.IOException;
import java.io.Serializable;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JFileChooser;

/**
 * class representing a student.
 * extends the User superclass.
 * @author Leo
 */
public class Student extends User implements Serializable {
    
    public Student(){
        super();
    }
    
    /**
     * method to return the courses that the student is enrolled in
     * @return
     */
    public ArrayList<Course> getCourses() throws SQLException{
        ArrayList<Course> c = new ArrayList<Course>();
        Connection con;
        if ((con=super.authenticate())!=null){
            Statement statemnt = con.createStatement();
            ResultSet result = statemnt.executeQuery("SELECT * from courses");
            while (result.next()){
                Course temp = new Course();
                temp.setCourseName(result.getString("course_name"));
                temp.setCourseTag(result.getString("course_tag"));
                temp.setCourseID(result.getInt("course_id"));
                c.add(temp);
            }
            con.close();
            return c;
        }
        con.close();
        return null;
        
    }
    
    /**
     * method to view course.
     * @return 
     */
    public void viewCourses() throws SQLException{
        Connection con;
        if ((con=super.authenticate())!=null){
            Statement statemnt = con.createStatement();
            ResultSet result = statemnt.executeQuery("SELECT * from courses");
            while (result.next()){
                Course temp = new Course();
                temp.setCourseName(result.getString("course_name"));
                temp.setCourseTag(result.getString("course_tag"));
                temp.setCourseID(result.getInt("course_id"));
                System.out.println(temp.toString());
            }
        }
        con.close();
    }
    
    //public void submitAssignment (File assignment) {
        
    //}
    public String[] submitAssignment() throws IOException {
        JFileChooser chooser = new JFileChooser();
        
        int returnVal = chooser.showOpenDialog(null);
        String [] param = new String[2];
        
        if (returnVal == JFileChooser.APPROVE_OPTION) {
            param[0] = chooser.getSelectedFile().getPath();
            param[1] = chooser.getSelectedFile().getName();
        }
        else throw new IOException();
        return param;
    }
    
    public boolean confirmSubmission(String [] dirAndName) {
        try {
            try (Connection con = ConnectionManager.getConnection()) {
                String query = "INSERT INTO table1 VALUES(1, LOAD_FILE('";
                query = query + dirAndName[0] + "'))";
                PreparedStatement statement = con.prepareStatement(query);
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
