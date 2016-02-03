<%-- 
    Document   : createCourse
    Created on : Nov 20, 2014, 1:09:07 AM
    Author     : Leo
--%>
<%@page import="java.util.*"%>
<%@page import="UserPackage.*"%>
<%@page import="Database.*"%>
<%@page import="AuthPackage.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta name="generator"
              content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CorgiBoard | Welcome</title>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="Shortcut Icon" href="images/favicon.ico">
        <script src="js/vendor/modernizr.js"></script>
    </head>
    <body bgcolor= "#F5F1DE">

        <!-----------------------------------------------------------------------> 
        <jsp:include page="topbar.jsp"/>
        <!------------------------------------------------------------------->
          <!-- Left Nav Section -->
          
        <div class="row">
            <div class="small-6 large-centered columns">
                <img style="width:440px; height:340px;" src="images/siteLogo.png"></a>
            </div>
        </div>

    <body>
       <jsp:useBean id="sManager" scope="page" class="UserPackage.CourseInstructor"/>
       <%
            try {
                Assignment c = new Assignment();
                boolean b = false;
              
                c.setAssignmentDescr(request.getParameter("des"));
                c.setAssignmentId(Integer.parseInt(request.getParameter("aid")));
                c.setCourseId(Integer.parseInt(request.getParameter("cid")));
                c.setMaxPts(Integer.parseInt(request.getParameter("pp")));
                c.setSpecifications(request.getParameter("asp"));
                
                if ( b = sManager.createAssignment(c)){
                    %>
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="Assignment Created Successfully" class="button expand"/>
                     </form>
                          <%
                 }
                else {%>
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="Failed to Create Assignment" class="button expand"/>
                     </form>
                    <%}

            } catch(Exception e) {
                    } finally {
                        sManager = null;
                    }
           
           %>
          
    </body>
</html>
