<%-- 
    Document   : coursehome
    Created on : Nov 26, 2014, 2:10:46 AM
    Author     : Kevin
--%>

<%@page import="UserPackage.Course"%>
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
    <link rel="Shortcut Icon" href="images/favicon.ico"/>
    <script src="js/vendor/modernizr.js"></script>
  </head>
  <body>
            <%  if(null == session.getAttribute("isValid")){ 
                       %>  <c:redirect url="/index.jsp"/>    <%
                 }%>
 <!-----------------------------------------------------------------------> 
    <!-----------------------------------------------------------------------> 
        <jsp:include page="topbar.jsp"/>
        <!------------------------------------------------------------------->

 <jsp:useBean id="searcher" scope="page" class="Database.CourseSearcher"/>
 <%
     Course thisCourse = searcher.getCourseFromID(Integer.parseInt(request.getParameter("Id")));
     %>
  
  <div class="row">
    <div class="large-12 columns">
      <div class="panel clearfix">
	    <img src="images/class_corgi.png"/ class = "left">
                 <h2 style="padding-left: 5px;"> <%=thisCourse.getCourseName() %></h2>
            <h3 style="padding-left: 5px;"> <%=thisCourse.getCourseCode() %>  </h3>
		<h4 style="padding-left: 5px;"> <%=thisCourse.getCourseInstructor() %>  </h4>
                
      </div>
    </div>
  </div>
  
  <!--------------------NAV BAR UNDER THE FRAME THING--------------------->
  <div class = "row">
  <nav class="top-bar" data-topbar role="navigation">
  <section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
    </ul>

    <!-- Left Nav Section -->
    <ul class="left">
      <li class ="active"><a href=<%= "\"coursehome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>> Announcements </a>
	   	   <div class ="slider-arrow3"></div>
	  </li>
	  <li><a href=<%= "\"assignmenthome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Assignments</a></li>
	  <li><a href=<%= "\"documenthome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Documents</a></li>
	  <li><a href=<%= "\"contactshome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Contacts</a></li>
          <% if ((session.getAttribute("type").equals("1")) || (session.getAttribute("type").equals("2"))) { %>
          <li><a href=<%= "\"modifycourse.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Modify Course</a></li>
          
          
          <% } %>
    </ul>
  </section>
</nav>
</div>
<!---------------------------------------------------------------------------------------------------------------->
 <div class="block" style="height: 20px;"></div>  
  <div class="row">  
    <div class="large-12 columns">
	<div class = "panel" >
	        <ul class="pricing-table">
                <li class="title"> Announcement </li>
                <li class="bullet-item"> 
                    <% 
                            String tempAnnouncement = thisCourse.getAnnouncement().toString();
                            if(!tempAnnouncement.equals("")) {%>
                            <ul class="disc">
                                <h5><%=thisCourse.getAnnouncement().toString()%></h5>
                            </ul>  
                            <% }%>
                    <% if (session.getAttribute("type").toString().equals("2")) { %>
                            <form action="announceresult.jsp" method="POST" id="announcement">
                            <h5>
                                New announcement: <br>
                                <textarea name="announce" rows="5" cols="100" form="announcement" required>New announcement</textarea>
                                <input name="courseID" value="<%= thisCourse.getCourseID() %>" type="hidden"/>
                                <input type="submit" value="Make announcement" class="button expand"/>
                            </h5>
                            </form>
                <% } %>
                </li>
                
    </div>
	</div>
  </script> </body>
</html>
