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
                <img style="width:440px; height:340px;" src="images/siteLogo.png">
            </div>
        </div>

        <div class="row">
            <div class="radius panel large-5 columns large-centered">			
                <form action="modifycourseresult.jsp" method="POST">
                    <div class="row">
                        <div class="large-12 columns">
                            New Course Name: <input name="cName" placeholder="CName" type="text" maxlength="45" required/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-12 columns">
                            Instructor's Corgi ID: <input name="cInstructorF" type="number" min="100000000" max="999999999" required/>
                        </div>
                    </div>

                    <input type='hidden' name="cId" value='<%=request.getParameter("Id") %>'  />
      


                     <div class="row">
                        <div class="large-12 columns">
                            New CourseTag: <input name="cTag" placeholder="CTag" type="text" maxlength="3" required/>
                        </div>
                    </div>
                     <div class="row">
                        <div class="large-12 columns">
                            New CourseNum: <input name="cNum" type="number" min="1" max="999" required />
                        </div>
                    </div>


                    <input type="submit" value="modify course" class="button expand"/>
                </form> 
            </div>
        </div>
         

          
    </body>
</html>
