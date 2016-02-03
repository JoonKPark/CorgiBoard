<%-- 
    Document   : authenticate
    Created on : Nov 18, 2014, 4:35:36 PM
    Author     : Owner
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logging in...</title>
    </head>
    <body>
        <jsp:useBean id="logger" scope="session" class="AuthPackage.Authenticator" />
        <jsp:setProperty name="logger" property="*" />
        <%
            if (logger.authenticate()) {
                //THIS GETS THE USER TYPE
                int type = logger.getType();
                session.setAttribute("type", type);
                session.setAttribute("typeString",""+type);
                int id = logger.getID();
                session.setAttribute("userID", id);
                session.setAttribute("userIDString",""+id);
                int corgi = logger.getCorgiId();
                session.setAttribute("corgi",corgi);
                String firstName = logger.getFirstName();
                session.setAttribute("FirstName", firstName);
                String lastName = logger.getLastName();
                session.setAttribute("LastName", lastName);
        %>
                <!--THIS GET THE USERNAME --!>
        <%String name = request.getParameter( "username" );
          session.setAttribute( "username", name );
          session.setAttribute("isValid", "true");
        
        %>
        <c:redirect url="/homepage.jsp"/>
        <%
            } else {
                session.setAttribute("isValid", "false");
        %>    
        <c:redirect url="/index.jsp"/>
        <%
            }
        %>
    </body>
</html>
