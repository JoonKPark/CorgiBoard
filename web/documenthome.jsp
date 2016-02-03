<%-- 
    Document   : documenthome
    Created on : Nov 26, 2014, 2:17:23 AM
    Author     : Kevin
--%>

<%@page import="UserPackage.Course"%>
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
                 <h2> <%=thisCourse.getCourseName() %></h2>
            <h3> <%=thisCourse.getCourseCode() %>  </h3>
		<h4> <%=thisCourse.getCourseInstructor() %>  </h4>
                
      </div>
    </div>
  </div>
  <!--------------------NAV BAR UNDER THE FRAME THING (NAVIGATES THRU THE "COURSE OPTIONS"--------------------->
  <div class = "row">
  <nav class="top-bar" data-topbar role="navigation">
  <section class="top-bar-section">
    <!-- Right Nav Section -->
    <ul class="right">
    </ul>

    <!-- Left Nav Section -->
    <ul class="left">
      <li><a href=<%= "\"coursehome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>> Announcements </a></li>
	  <li><a href=<%= "\"assignmenthome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Assignments</a></li>
	  <li class="active"><a href=<%= "\"documenthome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Documents</a>
                             <div class ="slider-arrow3"></div></li>
	  <li><a href=<%= "\"contactshome.jsp?Id=" + thisCourse.getCourseID() + "\"" %>>Contacts</a></li>
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
               <li class="title"> Documents 			   
			                          
               <%                 
                switch (Integer.parseInt(session.getAttribute("type").toString())) {
                    case (1): {%> 
                           <div class="block" style="height:20px;"></div>
			   <a href="course_document_edit.html" class="tiny button"> Add Document</a>
                        <% break;}          
                    case (2): {%>
                           <div class="block" style="height:20px;"></div>
			   <a href="course_document_edit.html" class="tiny button"> Add Document</a>                    
                        <% break; }
                    case (3): {%>
                           <div class="block" style="height:20px;"></div>
			   <a href="course_document_edit.html" class="tiny button"> Add Document</a>
                        <% break; }
                    case (4): {%>                    
                        <% break; }
               }%>
               </li>
              	

               <li class="bullet-item"> 
			   <h5><a href = ""> Document 1 </a></h5>
			   Posted on: MONTH_DAY_YEAR
               <ul class="disc">
			     <font size = 2> Put some text here. </font>
               </ul>  
			  			   
               <%                 
                switch (Integer.parseInt(session.getAttribute("type").toString())) {
                    case (1): {%>
                           <div class="block" style="height:20px;"></div>
			   <a href="course_document_edit.html" class="tiny button"> Edit Document</a>
			   <a href="#" class="tiny button"> Delete Document</a>                    
                        <% break;}          
                    case (2): {%> 
                           <div class="block" style="height:20px;"></div>
			   <a href="course_document_edit.html" class="tiny button"> Edit Document</a>
			   <a href="#" class="tiny button"> Delete Document</a>
                        <% break; }
                    case (3): {%>
                           <div class="block" style="height:20px;"></div>
			   <a href="course_document_edit.html" class="tiny button"> Edit Document</a>
			   <a href="#" class="tiny button"> Delete Document</a>                    
                        <% break; }
                    case (4): {%>
                           <div class="block" style="height:20px;"></div>
			   <a href="" class="tiny button"> Download</a>
                        <% break; }
               }%>
               
               
               
               
               
               
               
               
               
               </li>
    </div>
	</div>
  </script></body>
</html>
