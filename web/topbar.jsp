<%-- 
    Document   : topbar
    Created on : Nov 19, 2014, 4:21:46 AM
    Author     : Owner
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <body>        
        <jsp:useBean id="currentUser" class="UserPackage.User" />
        <nav class="top-bar" data-topbar role="navigation">
            <ul class="title-area">
                <li class="name">
                    <a href="homepage.jsp"><img style = "width:70px; height:40px" src="images/siteLogo.png"></a>
                </li>
                <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
                <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
            </ul>
            
            <%                 
                switch (Integer.parseInt(session.getAttribute("type").toString())) {
                    case (1): {%> 
                    <section class="top-bar-section">
                        <!-- Site Admin Menu -->
                        <ul class="right">
                            <li><a href="createcourse.jsp">Create Course</a></li>
                            <li><a href="coursesearch.jsp">Search Courses</a></li>
                            <li><a href="help.jsp">Help</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </section>
                        <% break;} 
                    case (2): {%> 
                    <section class="top-bar-section">
                        <!-- Teacher Menu -->
                        <ul class="right">
                            <!--<li><a href="createcourse.jsp"></a></li>
                            <li><a href="deletecourse.jsp"></a></li>-->
                            <li><a href="coursesearch.jsp">Search Courses</a></li>
                            <li><a href="help.jsp">Help</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </section>
                        <% break; }
                    case (3): {%> 
                    <section class="top-bar-section">
                        <!-- Teaching Assistant Menu -->
                        <ul class="right">
                            <!--<li><a href="createcourse.jsp">Create Course</a></li>
                            <li><a href="deletecourse.jsp">Delete Course</a></li>-->
                            <li><a href="coursesearch.jsp">Search Courses</a></li>
                            <li><a href="help.jsp">Help</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </section>
                        <% break; }
                    case (4): {%> 
                    <section class="top-bar-section">
                        <!-- Student Menu -->
                        <ul class="right">
                            <!--<li><a href="createcourse.jsp">Create Course</a></li>
                            <li><a href="deletecourse.jsp">Delete Course</a></li>-->
                            <li><a href="coursesearch.jsp">Search Courses</a></li>
                            <li><a href="help.jsp">Help</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                        </ul>
                    </section>
                        <% break; }
          }%>
            

            


                <section class="top-bar-section">

                    <!-- Left Nav Section -->
                    <ul class="left">
                    </ul>

                </section>
        </nav>

        <!-------------------------------------------------------------------------------------------------------------------->
        <div class="block" style="height: 100px;">      
        </div>

    
    <script>
        $(document).foundation();

    </script>
</body>
</html>
