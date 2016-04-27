<%-- 
    Document   : debug
    Created on : 27-Apr-2016, 10:24:27
    Author     : Ruth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <p> ${debugOne}  </p>
        <c:forEach items="${eventList}" var="venue">
            <p>
                ${venue.name}
                
            </p>
        </c:forEach>
        
        
        
    </body>
</html>
