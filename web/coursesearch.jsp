
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
            <div class = "row">
            <div class="large-12 centered columns">
                <img style="display: block; width:400px; height:400px; margin-left:auto; margin-right: auto;" src="images/corgi_search_art.png">
            </div>
            </div>
        
            <div class="container">  
            <div class="row">  
            <div class="large-12 centered columns">
                <form action="coursesearch.jsp" method ="POST">
                    <input name="query" type="text" placeholder="Enter course name or tag"/>
                    <input type="submit" value="Search" class="button expand"/>
                </form>
            </div>
            </div>
            </div>

        
        
        <div class="row">
            <div class ="small-12 large-centered columns">
                <jsp:include page="searchresult.jsp"/>
            </div>
        </div>
        
        


<script>
        $(document).foundation();
    </script></body>
</html>