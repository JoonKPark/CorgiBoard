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
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="en">
    <head>
        <meta name="generator"
              content="HTML Tidy for HTML5 (experimental) for Windows https://github.com/w3c/tidy-html5/tree/c63cc39" />
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>CorgiBoard | Creating new course...</title>
        <link rel="stylesheet" href="css/foundation.css" />
        <link rel="Shortcut Icon" href="images/favicon.ico">
        <script src="js/vendor/modernizr.js"></script>
    </head>
    <body bgcolor= "#F5F1DE">
          <%  if(null == session.getAttribute("isValid")){ 
                       %>  <c:redirect url="/index.jsp"/>    <%
                 }%>

        <!-----------------------------------------------------------------------> 
        <jsp:include page="topbar.jsp"/>
        <!------------------------------------------------------------------->
          <!-- Left Nav Section -->
          
        <div class="row">
            <div class="small-6 large-centered columns">
                <img style="width:440px; height:340px;" src="images/siteLogo.png">
            </div>
        </div>
       <jsp:useBean id="sManager" scope="page" class="UserPackage.SiteManager"/>
       <%
            try {
                Course c = new Course();
                String message = "";
                c.setCourseName(request.getParameter("cName"));
                c.setCourseNum(Integer.parseInt(request.getParameter("cNum")));
                c.setCourseTag(request.getParameter("cTag"));
                
                if ( (message=sManager.createCourse(c, Integer.parseInt(request.getParameter("cInstructorF").toString()))).equals("")){
                    %>
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="Course Created Successfully" class="button expand"/>
                     </form>
                          <%
                 }
                else {%>
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="<%=message %>" class="button expand"/>
                     </form>
                    <%}

            } catch(Exception e) {
                    } finally {
                        sManager = null;
                    }
           
           %>
          
    </body>
</html>
