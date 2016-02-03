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
                <!--THIS GET THE USERNAME --!>
        <%
        session.invalidate();
        %>
        <c:redirect url="/index.jsp"/>
    </body>
</html>
