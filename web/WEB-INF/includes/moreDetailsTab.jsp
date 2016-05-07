<%-- 
    Document   : moreDetailsTab
    Created on : 06-May-2016, 10:05:27
    Author     : Ruth
--%>

<%@page contentType="application/xml" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<data>
    <c:forEach items="${moreEvents}" var="more">
                        
        <div class="col-lg-2  newEventGallery"> 
            <a href="event.do?eventdata=${more.ID}">
                <img class="eventImage" src="Image?type=event&id=${more.ID}">
                 <div class="underImageInfo">
                     <div class="boxName"> ${more.name} </div> 

                <div class="boxChildren">  </div>
                </div>
            </a>  
        </div>
    </c:forEach>

</data>


