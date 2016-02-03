<%-- 
    Document   : announceresult
    Created on : Feb 2, 2016, 4:38:49 PM
    Author     : thisi
--%>

<%@page import="java.util.*"%>
<%@page import="UserPackage.*"%>
<%@page import="Database.*"%>
<%@page import="AuthPackage.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta name="generator"
              content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CorgiBoard | Making announcement...</title>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="Shortcut Icon" href="images/favicon.ico">
        <script src="js/vendor/modernizr.js"></script>
    </head>
    <body bgcolor="F5F1DE">
        <%  if(null == session.getAttribute("isValid")){%>  
            <c:redirect url="/index.jsp"/>    
        <%}%>
        <jsp:include page="topbar.jsp"/>
        
        <div class="row">
             <div class="small-6 large-centered columns">
                <img style="width:440px; height:340px;" src="images/siteLogo.png">
            </div>
        </div>
        
        <jsp:useBean id="instructor" scope="page" class="UserPackage.CourseInstructor"/>
        <%
            try{
                String newAnnouncement = request.getParameter("announce");
                System.out.println(newAnnouncement);
                int corgiID = Integer.parseInt(session.getAttribute("corgi").toString());
                
                int courseID = Integer.parseInt(request.getParameter("courseID").toString());
                System.out.println(courseID);
                String message = instructor.makeAnnouncement(courseID, newAnnouncement, corgiID);
                if (message.equals("")) { %>
                    <form action="homepage.jsp" method="POST">
                         <input type="submit" value="Announcement posted!" class="button expand"/>
                    </form>
                <% } else { %>
                <form action="homepage.jsp" method="POST">
                         <input type="submit" value="<%= message %>" class="button expand"/>
                </form> <% }
            } catch (Exception e) { e.printStackTrace(); }
            finally {
                    instructor = null;
            }
        %>
    </body>
</html>
