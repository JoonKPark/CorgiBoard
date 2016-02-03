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
        <title>CorgiBoard | Welcome</title>
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
        <div class="row">
            <div class="small-6 large-centered columns">
                <img style="width:240px; height:200px;margin-left:20%;" src="images/siteLogo.png">
            </div>
        </div>

        <div class="row">
            <div class="small-6 large-centered columns">
                <form action="viewGrades.jsp" method ="POST">
                    <input name="courseID" type="text" placeholder="Enter course ID" />
                    <input name="assignID" type="text" placeholder="Enter AssignmentID"/>
                    <input name="userID" type="text" placeholder="Enter UserID"/>
                    <input type="submit" value="Search" class="button expand" />
                </form>
            </div>  
        </div>
<script>
        $(document).foundation();
    </script></body>
</html>