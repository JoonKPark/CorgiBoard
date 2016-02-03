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
import java.sql.*;

public class Assignment {
    
    private String specifications="";
    private String assignmentDescr="";
    private int assignmentId=0;
    private Date dueDate;
    private int courseId=0;
    private int maxPts=0;
    
    public Assignment(){
        this.dueDate = new Date(1);
    }

    public String getSpecifications() {
        return specifications;
    }

    public void setSpecifications(String specifications) {
        this.specifications = specifications;
    }

    public String getAssignmentDescr() {
        return assignmentDescr;
    }

    public void setAssignmentDescr(String assignmentDescr) {
        this.assignmentDescr = assignmentDescr;
    }

    public int getAssignmentId() {
        return assignmentId;
    }

    public void setAssignmentId(int assignmentId) {
        this.assignmentId = assignmentId;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getMaxPts() {
        return maxPts;
    }

    public void setMaxPts(int maxPts) {
        this.maxPts = maxPts;
    }


    
    
    
}