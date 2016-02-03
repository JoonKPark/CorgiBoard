package UserPackage;

import java.util.Calendar;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Owner
 */
public class Course {
    private String courseName = "";
    private String courseTag = "";
    private int courseID=0 ;
    private int courseNum =0;
    private String instructor = "";
    private User instr;
    private String announcement = "";



    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public User getInstr() {
        return instr;
    }

    public void setInstr(User instr) {
        this.instr = instr;
    }

    public int getCourseNum() {
        return courseNum;
    }

    public void setCourseNum(int courseNum) {
        this.courseNum = courseNum;
    }
   
    
    public Course() {
    }
    public Course (String name, String tag, int num, String inst, int id, String announ) {
        courseName = name;
        courseTag = tag;
        courseNum = num;
        instructor = inst;
        courseID = id;
        announcement = announ;
    }
    
    public String getCourseName() {
        return courseName;
    }
    public String getCourseTag() {
        return courseTag;
    }
    public int getCourseID() {
        return courseID;
    }
    public String getCourseCode() {
        return courseTag + " " + courseNum;
    }
    public String getCourseInstructor() {
        return instructor;
    }
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public void setCourseTag(String courseTag) {
        this.courseTag = courseTag;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }
    public void setCourseInstructor(String inst) {
        instructor = inst;
    }
    
    
    
    
    public void changeCourseName(String cN) {
        courseName = cN;
    }
    public void changeCourseTag(String tag) {
        courseTag = tag;
    }
    public void changeCourseID(int id) {
        if (courseID >= 100)
            courseID = id;
    }

    public String getAnnouncement() {
        return announcement;
    }

    public void setAnnouncement(String announcment) {
        this.announcement = announcment;
    }
    
    public void addAnnouncement (String newAnnounce) {
        String temp = announcement;
        
        System.out.println("Previously: " + announcement);
        Calendar now = Calendar.getInstance();
        this.announcement =newAnnounce +
                           "<br><small><i>" + now.getTime() + "</i></small>" +
                           "<hr>";
        this.announcement+=temp;
    }
    

    
    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Course)) return false;
        else {
            return
                    ((Course)o).getCourseName().equals(this.courseName) &&
                    ((Course)o).getCourseInstructor().equals(this.instructor)&&
                    ((Course)o).getCourseID() == this.courseID &&
                    ((Course)o).getCourseTag().equals(this.courseTag);
        }
    }

}