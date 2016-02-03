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

    <body>
            <nav class="top-bar" data-topbar role="navigation">
            <ul class="title-area">
                <li class="name">
                    <a href="homepage.jsp"><img style = "width:70px; height:40px" src="images/siteLogo.png"</a>
                </li>
                <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
                <li class="toggle-topbar menu-icon"><a href="#"><span>Menu</span></a></li>
            </ul>

            <section class="top-bar-section">
                <!-- Right Nav Section -->
                <ul class="right">
                    <li><a href="help.jsp">Help</a></li>
                    <li><a href="index.jsp">Login</a></li>
                </ul>
            </section>


                <section class="top-bar-section">

                    <!-- Left Nav Section -->
                    <ul class="left">
                    </ul>

                </section>
        </nav>

        <!-------------------------------------------------------------------------------------------------------------------->
        <div class="block" style="height: 100px;">      
        </div>
       
        <!-------------------------------------------------------------------------------------------------------------------------------------------->	
        <div class="block" style="height: 25px;"></div>
        
        <div class="row">
            <div class= "large-12 columns centered">
            <img src="images/corgi_login_art.png" style="display:block; height: 400 px; width: 400px; margin-left: auto; margin-right: auto;">
            </div>
        </div>
        <div class ="container">
        <div class="row">
              <%
         if(!(null == session.getAttribute("isValid"))){  
            // User IS logged in.  
               if (session.isNew()==false){
              if (session.getAttribute("isValid").equals("false")){
                  %>
                       <div class="large-12 columns centered">
                <div class="panel clearfix" style="">	
                    Wrong Username or Password! Please try again.
                 </div>
                  </div>
                  <%
                 %> 
                         
                 <%
              }else{
                    %>  <c:redirect url="/homepage.jsp"/>    <%
              }}}
        %>
            
                <form action="authenticate.jsp" method="POST">
                    <div class="row">
                        <div class="large-12 columns">
                           <input name="username" placeholder="Username" type="text"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="large-12 columns">
                           <input name="password" placeholder="Password" type="password"/>
                        </div>
                    </div>

                    <input type="submit" value="Log in" class="button expand"/>
                    
                    
                </form> 
        </div>

        <div class="row">
            <img src="images/loginfooter.png" style="margin-left:2%;">
        </div>
            
        </div>

        <script src="js/vendor/jquery.js"></script> 
        <script src="js/foundation.min.js"></script> 
        <script>
            $(document).foundation();

        </script></body>
</html>
