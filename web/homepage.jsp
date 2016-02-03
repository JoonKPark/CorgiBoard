<%@page import="java.util.ArrayList"%>
<%@page import="UserPackage.Course"%>
<%@page import="UserPackage.Course"%>
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
        <link rel="Shortcut Icon" href="images/favicon.ico"/>
        <script src="js/vendor/modernizr.js"></script>
    </head>
    <body>
    <%  if(null == session.getAttribute("isValid")){ 
                       %>  <c:redirect url="/index.jsp"/>    <%
                 }%>
        <!-----------------------------------------------------------------------> 
        <jsp:include page="topbar.jsp"/>
        <!------------------------------------------------------------------->

        <div class="row">
            <div class="large-12 columns centered">
                <div class="panel clearfix">
                    <p>Hello, <%= session.getAttribute("FirstName")%> <%= session.getAttribute("LastName")%>! You are a
                        <% switch (Integer.parseInt(session.getAttribute("type").toString())) {
                    case (1): {%> Site Administrator.
                        <% break;} 
                    case (2): {%> Course Instructor.
                        <% break; }
                    case (3): {%> Teacher's Assistant.
                        <% break; }
                    case (4): {%> Student.
                        <% break; }
          }      %>
                    <p>Your 9-digit Corgi ID is: <%=session.getAttribute("corgi").toString() %></p>
                </div>
            </div>
        </div>


        

        <div class="row">
            <div class="large-12 columns centered">
                <div class = "panel clearfix" >
                    <ul class="pricing-table">
                        <li class="title">Course List</li>
                         <jsp:useBean id="searcher" scope="page" class="Database.CourseSearcher"/>
       
                <%
                    try {
                        int index = 0;                        
                        String uId = session.getAttribute("userID").toString();
                        searcher.setResultsEnrolledIn(Integer.parseInt(uId));  
                        ArrayList<Course> courses = searcher.getResults();
                        while (index < courses.size()) {
                            Course lookingAt = courses.get(index);

                %>
                    <li class="bullet-item"> 
                            <h5><a href=<%="\"coursehome.jsp?Id=" + lookingAt.getCourseID() + "\"" %>><%=lookingAt.getCourseTag() +" " + lookingAt.getCourseNum() +" "+ lookingAt.getCourseName() %></a></h5>
                            
                    </li>
                   <% 
                            String tempAnnouncement = lookingAt.getAnnouncement().toString();
                            if(!tempAnnouncement.equals("")) {%>
                            <li class="bullet-item">
                            <p>Announcements:</p>
                            <ul class="disc">
                                <%=lookingAt.getAnnouncement().toString()%>
                            </ul>  
                            </li>
                            <% }%>
                <%
                            index++;
                        }
                    } catch (Exception e) {
                    } finally {
                        searcher = null;
                    }
                    
                %>
              
                       			   
                    </ul>
                </div>
            </div>
        </div>
    </body>
</html>