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
        <link type="text/css" media="screen" rel="stylesheet" href="css/responsive-tables.css" />
        <script type="text/javascript" src="responsive-tables.js"></script>
    </head>
    <body>
          <%  if(null == session.getAttribute("isValid")){ 
                       %>  <c:redirect url="/index.jsp"/>    <%
                 }%>
        <jsp:useBean id="searcher" scope="page" class="Database.CourseSearcher"/>
         <jsp:useBean id="sManager" scope="page" class="UserPackage.SiteManager"/>
        <table class="responsive">
            <thead>
                <tr>
                    <th width="200">Course Code </th>
                    <th width="200">Course Name</th>
                    <th width="200">Instructor</th>
                      <% if ((session.getAttribute("typeString").equals("3")) || (session.getAttribute("typeString").equals("4"))){  %>
                    <th width="100">Register</th>
                    <th width="100">Unregister</th>
                    <%     }                   
                     if(session.getAttribute("typeString").equals("1")){%>
                        <th width="100">Delete</th>
                   <% }%>
                </tr>
            </thead>
            <tbody>
                <%
                    try {
                        int index = 0;
                        searcher.setResults(request.getParameter("query"));
                        ArrayList<Course> courses = searcher.getResults();
                        while (index < courses.size()) {
                            Course lookingAt = courses.get(index);

                %>
                <tr>
                    <td><a href=<%="\"coursehome.jsp?Id=" + lookingAt.getCourseID() + "\"" %>>><%= lookingAt.getCourseTag() + lookingAt.getCourseNum() %></a></td>
                    <td><a href=<%="\"coursehome.jsp?Id=" + lookingAt.getCourseID() + "\"" %>><%= lookingAt.getCourseName() %></a></td>
                    <td> <%= lookingAt.getCourseInstructor() %> </td>
                    <% if ((session.getAttribute("typeString").equals("3")) || (session.getAttribute("typeString").equals("4"))){  %>        
                    <td><% if (!(sManager.isUserRegistered(Integer.parseInt(session.getAttribute("corgi").toString()), lookingAt.getCourseID()))){ %>
                        <form action="courseRegister.jsp" method="POST">
                           <input type="hidden" name="cId" value="<%=lookingAt.getCourseID()%>" type="number"/>
                    <input type="submit" value="Register" class="button expand"/>
                </form> <% } %>
                    </td>
                    <td><% if ((sManager.isUserRegistered(Integer.parseInt(session.getAttribute("corgi").toString()), lookingAt.getCourseID()))){ %>
                        <form action="courseDeregister.jsp" method="POST">
                           <input type="hidden" name="cId" value="<%=lookingAt.getCourseID()%>" type="number"/>
                    <input type="submit" value="Deregister" class="button expand"/>
                </form> <% } %>
                    </td> <% } 
                     if(session.getAttribute("typeString").equals("1")){%>
                    <td><form action="deletecourseresult.jsp" method="POST">
                           <input type="hidden" name="cId" value="<%=lookingAt.getCourseID()%>" type="number"/>
                    <input type="submit" value="Delete" class="button expand"/>
                </form> </td>
                    <%}%>
                </tr>
                <%
                            index++;
                        }
                    } catch (Exception e) {
                    } finally {
                        searcher = null;
                    }
                    
                %>
            </tbody>
        </table>
    </body>
</html>
