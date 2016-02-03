<%-- 
    Document   : searchresult
    Created on : Nov 19, 2014, 7:20:21 PM
    Author     : Owner
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="UserPackage.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="generator"
        content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CorgiBoard | Grades</title>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="Shortcut Icon" href="images/favicon.ico">
        <script src="js/vendor/modernizr.js"></script>
    </head>
  
    <body>
          <% if(null == session.getAttribute("isValid")){%><c:redirect url="/index.jsp"/> <%}
             %>
                 
                 
        <jsp:useBean id="gradeCenter" scope="page" class="UserPackage.GradeCenter"/>
        <table>
            
            <thead>
                
                <tr>
                    <th width="200">Course ID </th>
                    <th width="200">Assignment ID</th>
                    <th width="200">User ID</th>
                </tr>
            </thead>
            <tbody>
                <%
                        int index = 0;
                        int userID = Integer.parseInt((String)(session.getAttribute("userID")));
                        int courseID = Integer.parseInt((String)(request.getAttribute("courseID")));
                        int assignmentID = Integer.parseInt((String)(request.getAttribute("assignmentID")));
                        
                        ArrayList<GradeCenter> gradeRows = gradeCenter.getGradeRow(userID, assignmentID, courseID);
                        while (index < gradeRows.size()) {
                            GradeCenter lookingAt = gradeRows.get(index);
                        
                %>
                <tr>
                    <td><%= lookingAt.getGrade() + "" %></td>
                </tr>
                <%index++;}%>
            </tbody>
        </table>
    </body>
</html>

