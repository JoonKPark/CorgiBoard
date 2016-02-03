<%-- 
    Document   : createCourse
    Created on : Nov 20, 2014, 1:09:07 AM
    Author     : Leo
--%>
<%@page import="java.util.*"%>
<%@page import="UserPackage.*"%>
<%@page import="Database.*"%>
<%@page import="AuthPackage.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

          <%  if(null == session.getAttribute("isValid")){ 
                       %>  <c:redirect url="/index.jsp"/>    <%
                 }%>
        <!-----------------------------------------------------------------------> 
        <jsp:include page="topbar.jsp"/>
        <!------------------------------------------------------------------->
          <!-- Left Nav Section -->
          
        <div class="row">
            <div class="small-6 large-centered columns">
                <img style="width:440px; height:440px;" src="images/register_corgi.png">
            </div>
        </div>
       <jsp:useBean id="sManager" scope="page" class="UserPackage.SiteManager"/>
       <%
            try {
                int cid = Integer.parseInt(request.getParameter("cId"));
                String message = "";
                message=sManager.unregisterCourse(cid, Integer.parseInt(session.getAttribute("corgi").toString()));
                if (message.equals("")){
                   %>
                   <div class="container">
                   <div class="large-12 centered columns">
                     <form action="homepage.jsp" method="POST">
                         <input type="submit" value="Course Deregistered Successfully" class="button expand"/>
                     </form>
                   </div>
                   </div>
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
