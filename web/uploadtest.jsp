<%-- 
    Document   : createCourse
    Created on : Nov 20, 2014, 1:09:07 AM
    Author     : Leo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserPackage.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

         <div class="block" style="height: 100px;"></div>
        <div class="row">
            <div class="radius panel large-5 columns large-centered">	
                <form action="/upload/" method="post" enctype="multipart/form-data">
            <input type="file" name="dummyname" /><br />
            <input type="submit" />
              </form>
                
            </div>
        </div>
         

          
    </body>
</html>
