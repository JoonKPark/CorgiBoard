package UserPackage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Owner
 */
import Database.ConnectionManager;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class GradeCenter {

    private int courseID;
    private int userID;
    private int assignmentID;
    private int grade;
    
    public GradeCenter(){}
    
    public GradeCenter(int UserID, int AssignmentID, int CourseID) {
        userID = UserID;
        assignmentID = AssignmentID;
        courseID = CourseID;
    }

    public ArrayList<GradeCenter> getGradeRow(int UserID, int AssignmentID, int CourseID) {
        ArrayList<GradeCenter> toReturn = new ArrayList<GradeCenter>();
        try {
            Connection c = ConnectionManager.getConnection();
            Statement stmt = c.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT *     FROM tblgradecenter "
                    + "WHERE UserID='" + UserID + "' "
                    + "AND AssignmentID = '" + AssignmentID + "'"
                    + "AND CourseID = '" + CourseID + "'");
            if (rs.next()) {

                GradeCenter gc = new GradeCenter(UserID, AssignmentID, CourseID);
                gc.setCourseID(rs.getInt("CourseID"));
                gc.setAssignmentID(rs.getInt("AssignmentID"));
                gc.setUserID(rs.getInt("UserID"));
                gc.setGrade(rs.getInt("Grade"));
                toReturn.add(gc);
                stmt.close();
                c.close();

            }
            stmt.close();
            c.close();
        } catch (Exception e) {
        }
        return toReturn;

    }

    public int getAverageGradeForAssignment(int AssignmentID, int CourseID) {
        try {
            Connection c = ConnectionManager.getConnection();
            Statement stmt = c.createStatement();
            int avgGrade = 0;
            int counter = 0;

            ResultSet rs = stmt.executeQuery("SELECT *     FROM tblgradecenter "
                    + "WHERE AssignmentID = '" + AssignmentID + "'"
                    + "AND CourseID = '" + CourseID + "'");
            if (rs.next()) {
                counter++;
                GradeCenter gc = new GradeCenter(0, AssignmentID, CourseID);
                gc.setCourseID(rs.getInt("CourseID"));
                gc.setAssignmentID(rs.getInt("AssignmentID"));
                gc.setUserID(rs.getInt("UserID"));
                gc.setGrade(rs.getInt("Grade"));
                stmt.close();
                c.close();
                avgGrade = ((avgGrade + gc.grade) / counter);
            }

            stmt.close();
            c.close();
            return avgGrade;
        } catch (Exception e) {
        }
        return -1;

    }

    public File generateGradeReport() {
        return null;
    }

    public int getCourseID() {
        return courseID;
    }

    public int getUserID() {
        return userID;
    }

    public int getAssignmentID() {
        return assignmentID;
    }

    public int getGrade() {
        return grade;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setAssignmentID(int assignmentID) {
        this.assignmentID = assignmentID;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

}
