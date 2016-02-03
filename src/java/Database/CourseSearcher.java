/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import UserPackage.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Owner
 */
public class CourseSearcher {
    


    private ArrayList<Course> returnedList = new ArrayList<Course>();

    public CourseSearcher() {
    }
    
    public Course getCourseFromID(int cid){
         try {
            Connection c = ConnectionManager.getConnection();
            Statement stmt = c.createStatement();

                ResultSet rs = stmt.executeQuery("SELECT * FROM tblcourses WHERE CourseID='"+cid+"'");
            if (rs.next()) {

                Course d = new Course();
                d.setCourseID(rs.getInt("CourseID"));
                d.setCourseName(rs.getString("CourseName"));
                d.setCourseInstructor(rs.getString("Instructor"));
                d.setCourseTag(rs.getString("CourseTag"));
                d.setCourseNum(rs.getInt("CourseNum"));
                d.setAnnouncement(rs.getString("Announcement"));
                  stmt.close();
             c.close();
                return d;

             } 
            stmt.close();
             c.close();
         }
         catch (Exception e) {
        }
            return null;

    }
    
    public void setResultsEnrolledIn(int userID){
         try {
            Connection c = ConnectionManager.getConnection();
            Statement stmt = c.createStatement();
            /*String SQL = "SELECT * FROM tblcourses WHERE "
                    + "CourseName='" + query
                    + "' OR CourseInstructor ='" + query + 
                    "' OR CourseTag ='" + query + 
                    "' OR CourseNum ='" + Integer.parseInt(query) + "'";*/
            
                ResultSet rs = stmt.executeQuery("SELECT * FROM tblUser WHERE UserID='"+userID+"'");
            if (rs.next()) {
              int c1 = rs.getInt("classOne");
              int c2 = rs.getInt("classTwo");
              int c3 = rs.getInt("classThree");
              int c4 = rs.getInt("classFour");
              int c5 = rs.getInt("classFive");

             setResults(c1);
              setResults(c2);
               setResults(c3);
                setResults(c4);
                 setResults(c5);
                 
             } 
             stmt.close();
             c.close();
         }
         catch (Exception e) {
        }
        

    }

    //THIS IS FOR SEARCHING
    public void setResults(String query) {
        try {
            Connection c = ConnectionManager.getConnection();
            Statement stmt = c.createStatement();
            /*String SQL = "SELECT * FROM tblcourses WHERE "
                    + "CourseName='" + query
                    + "' OR CourseInstructor ='" + query + 
                    "' OR CourseTag ='" + query + 
                    "' OR CourseNum ='" + Integer.parseInt(query) + "'";*/
            
            String SQL = "SELECT * FROM tblcourses WHERE CourseTag='" +
                    query + "'";

            ResultSet rs = stmt.executeQuery(SQL);
            boolean more = rs.next();
            while (more) {
               String name, tag, instructor, announcement;
                int num;
                int id;

                name = rs.getString("CourseName");
                tag = rs.getString("CourseTag");
                num = rs.getInt("CourseNum");
                id = rs.getInt("CourseID");
                instructor = rs.getString("Instructor");
                announcement = rs.getString("Announcement");
                Course toAdd = new Course(name, tag, num,instructor, id, announcement);
                returnedList.add(toAdd);
                more = rs.next();
            }
            
            SQL = "SELECT * FROM tblcourses WHERE CourseName like '%" +
                    query + "%'";
            rs = stmt.executeQuery(SQL);
            more = rs.next();
            while (more) {
                String name, tag, instructor, announcement;
                int num;
                int id;

                name = rs.getString("CourseName");
                tag = rs.getString("CourseTag");
                num = rs.getInt("CourseNum");
                id = rs.getInt("CourseID");
                instructor = rs.getString("Instructor");
                announcement = rs.getString("Announcement");
                Course toAdd = new Course(name, tag, num,instructor, id, announcement);
                if (!returnedList.contains(toAdd)) returnedList.add(toAdd);
                more = rs.next();
            }
            
            SQL = "SELECT * FROM tblcourses WHERE Instructor like '%" +
                    query + "%'";
            rs = stmt.executeQuery(SQL);
            more = rs.next();
            while (more) {
                String name, tag, instructor, announcement;
                int num;
                int id;

                name = rs.getString("CourseName");
                tag = rs.getString("CourseTag");
                num = rs.getInt("CourseNum");
                id = rs.getInt("CourseID");
                instructor = rs.getString("Instructor");
                announcement = rs.getString("Announcement");
                Course toAdd = new Course(name, tag, num,instructor, id, announcement);
                if (!returnedList.contains(toAdd)) returnedList.add(toAdd);
                more = rs.next();
            }
            
            SQL = "SELECT * FROM tblcourses WHERE CourseNum='" +
                    query + "'";
            rs = stmt.executeQuery(SQL);
            more = rs.next();
            while (more) {
                String name, tag, instructor, announcement;
                int num;
                int id;

                name = rs.getString("CourseName");
                tag = rs.getString("CourseTag");
                num = rs.getInt("CourseNum");
                id = rs.getInt("CourseID");
                instructor = rs.getString("Instructor");
                announcement = rs.getString("Announcement");
                Course toAdd = new Course(name, tag, num,instructor, id, announcement);
                if (!returnedList.contains(toAdd)) returnedList.add(toAdd);
                
                more = rs.next();
            }
            stmt.close();
             c.close();
        } catch (Exception e) {
        }
    }
    
    //THIS RETURNS DATA FOR HOMEPAGE
    public void setResults(int query) {
        try {
            Connection c = ConnectionManager.getConnection();
            Statement stmt = c.createStatement();
            /*String SQL = "SELECT * FROM tblcourses WHERE "
                    + "CourseName='" + query
                    + "' OR CourseInstructor ='" + query + 
                    "' OR CourseTag ='" + query + 
                    "' OR CourseNum ='" + Integer.parseInt(query) + "'";*/
            
            String SQL = "SELECT * FROM tblcourses WHERE CourseID='" +
                    query + "'";

            ResultSet rs = stmt.executeQuery(SQL);
            boolean more = rs.next();
            while (more) {
               String name, tag, instructor, announcement;
                int num;
                int id;

                name = rs.getString("CourseName");
                tag = rs.getString("CourseTag");
                num = rs.getInt("CourseNum");
                id = rs.getInt("CourseID");
                instructor = rs.getString("Instructor");
                announcement = rs.getString("Announcement");
                Course toAdd = new Course(name, tag, num,instructor, id, announcement);
                returnedList.add(toAdd);
                more = rs.next();
            }
           
            stmt.close();
             c.close();
        } catch (Exception e) {
        }
    }

    public ArrayList<Course> getResults() {
        return returnedList;
    }
}
