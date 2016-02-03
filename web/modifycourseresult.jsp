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
                <img style="width:440px; height:340px;" src="images/siteLogo.png">
            </div>
        </div>

    <body>
       <jsp:useBean id="sManager" scope="page" class="UserPackage.SiteManager"/>
        <jsp:useBean id="searcher" scope="page" class="Database.CourseSearcher"/>
 <%
     Course thisCourse = searcher.getCourseFromID(Integer.parseInt(request.getParameter("cId")));
     %>
       <%
            try {
                Course c = new Course();
                Course old = new Course();
                String b = "";
                int oldCorgi;
                int oldd = Integer.parseInt(request.getParameter("cId"));
                c.setCourseID(Integer.parseInt(request.getParameter("cId")));
                int corgi = Integer.parseInt(request.getParameter("cInstructorF"));
                oldCorgi = sManager.getCorgiIDFromName(thisCourse.getCourseInstructor());
                c.setCourseInstructor(sManager.getInstructorName(corgi));
                c.setCourseName(request.getParameter("cName"));
                c.setCourseNum(Integer.parseInt(request.getParameter("cNum")));
                c.setCourseTag(request.getParameter("cTag"));
                if ((( b = sManager.modifyCourse(oldd,c,corgi, oldCorgi)).equals("")==true)){
                    %>
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="Course Modified Successfully" class="button expand"/>
                     </form>
                          <%
                 }
                else {%>
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="<%=b %>" class="button expand"/>
                     </form>
                    <%}

            } catch(Exception e) {
                    } finally {
                        sManager = null;
                    }
           
           %>
          
    </body>
</html>
