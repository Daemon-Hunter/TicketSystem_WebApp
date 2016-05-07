<%-- 
    Document   : moreDetailsTab
    Created on : 06-May-2016, 10:05:27
    Author     : Ruth
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<data>
    <c:forEach end="11" items="${loadMoreList}" var="more">
                        
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


