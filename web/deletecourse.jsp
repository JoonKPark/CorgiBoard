<%-- 
    Document   : createCourse
    Created on : Nov 20, 2014, 1:09:07 AM
    Author     : Leo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="UserPackage.*"%>

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
        <div class="row">
            <div class="small-6 large-centered columns">
                <img style="width:440px; height:340px;" src="images/siteLogo.png"></a>
            </div>
        </div>

         <div class="block" style="height: 100px;"></div>
        <div class="row">
            <div class="radius panel large-5 columns large-centered">			
                <form action="deletecourseresult.jsp" method="POST">

                     <div class="row">
                        <div class="large-12 columns">
                            CourseID: <input name="cId" placeholder="CId" type="number" maxlength="11" required/>
                        </div>
                    </div>

                    <input type="submit" value="delete course" class="button expand"/>
                </form> 
            </div>
        </div>
         

          
    </body>
</html>
