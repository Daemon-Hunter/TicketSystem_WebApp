<%-- 
    Document   : index
    Created on : 25-Feb-2016, 12:21:22
    Author     : Nick
--%>




<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="font-awesome-4.5.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/helper.css" type="text/css" rel="stylesheet">
        <link href="less/myLess.less" type="text/css" rel="stylesheet/less">
        <link href="css/bootstrap.min.css" type="text/css" rel="stylesheet">
        <link href="css/bootstrap-theme.css" type="text/css" rel="stlyesheet">
        <style type="text/css">
            .nav-tabs li a {font-size : 30px; color: white; font-family: sans-serif; font-weight: bold;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> ${currentArtist.name}</title>
    </head>
    <body>

         <nav class="navbar navbar-inverse navbar-static-top">
            <ul class="nav navbar-nav pull-right" style="margin-right: 15%; font-size: 23px;">
                <c:choose>
                    
                    <c:when test="${loggedIn eq false}">
                <li>
                    <a class="nav-link" href="register.jsp" >Register <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="divider-vertical"> </li>
                  <li class="dropdown">
                            <a data-target="#" href="index" data-toggle="dropdown" class="dropdown-toggle">
                                <p class="">Sign in<b class="caret"></b></p>      
                            </a>
                            <div class="dropdown-menu" style="padding: 30px;">
                                <form class="SignInBox" action="SignIn" method="post" accept-charset="UTF-8">
                                    <input class="form-control" id="user_username" style="margin-bottom: 15px;" type="text" name="usernameSignIn" size="50" placeholder="Username/Email"/>
                                    <input class="form-control" id="user_password" style="margin-bottom: 15px;" type="password" name="passwordSignIn" size="50" placeholder="Password"/>
                                    <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit" name="commit" value="Sign In" />
                                 </form>
                            </div>
                        </li>
                    </c:when>
                    <c:when test="${loggedIn eq true}">
                        <div class="myJunction">
                            <a href="myJunction.do"><i class="fa fa-home fa-inverse fa-lg">
                            MyJunction
                        </i>
                            </a>
                        </div>
                    </c:when>
                </c:choose>
                </ul> 
        </nav>

        <div class="row">
            <div class="blue col-lg-12"> 
                <div id="logoImage">
                <a href="index.do">
                <img class="padding" src="images/Drawing.png">
                    </a>
                </div>
            </div>

        </div>

        <%-- Left top search bar --%>
        <div class="row">
            <div class="col-lg-3 leftSearch col-lg-offset-1">
                <div id="searchBarLeft"><div class="form-inline" >
                    <form class="form-inline">
                        <div class="form-group">
                            <select class="form-control" style="width: 12em" placeholder="Location">
                                <option value=plymouth">Plymouth</option>
                                 <option value=plymouth">Plymouth</option>
                                  <option value=plymouth">Plymouth</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control" style="width: 12em">
                                <option value=plymouth">Sports</option>
                                 <option value=plymouth">Music</option>
                                  <option value=plymouth">Pooplop</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                    </div>
                </div>
             </div>
        </div>



        <%-- content --%>
        <div class="container">
        <div class ="allEventData">


            <div class="row contentPosition">
                <div class="col-lg-12">
                    <div class="socialLinkBackground socialLinkTopRadius">
                     <div class="infoPageTitle"> ${currentArtist.name}</div>
                    </div>


             </div>
                <div class="col-lg-6">
                    <div class="largeImageBox">
                        <c:set value="largeImage" var="imageSize"/>
                    <img class="largeImage" src="Image?type=artist&id=${currentArtist.ID}&image=large">


                    </div>


                    <div class="socialLinkBackground">
                        <div class="col-lg-4">
                             <div class="">
                                 <a href="${facebook}" class="btn btn-group-justified">
                                    <i class="fa fa-facebook fa-2x"></i>
                                    
                                 </a>
                             </div>
                        </div>
                        <div class="col-lg-4">
                             <div class="">
                                <a href=" ${twitter}" class="btn btn-group-justified">
                                    <i class="fa fa-twitter fa-2x"> </i>
                                   
                                 </a>
                             </div>
                        </div>
                                 
                        <div class="col-lg-4">
                             <div class="">
                                <a href="" class="btn btn-group-justified">
                                    <i class="fa fa-plus-circle fa-2x"> Track</i>
                        
                                </a>
                            </div>
                        </div>
                    </div>



                </div>

                 <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span class="pageHeading">
                            <p>Artist Information</p>
                        </span>
                    </div>
                    <div class="panel-body panelBodyBox">
                        <span class="description">
                            <c:out value="${currentArtist.description}" default="No description for this artist"/>
                        </span>
                        <hr>
                        <span class="social">
                            <i class="fa fa-facebook fa-2x"></i> <c:out value="${facebook}" default="Not available for this artist"/><br>
                            <i class="fa fa-twitter fa-2x"></i> <c:out value="${twitter}" default="Not available for this artist"/> <br>
                                <i class="fa fa-spotify fa-2x"></i> <c:out value="${currentArtist.spotify}" default="Not available for this artist"/><br>
                                    <i class="fa fa-instagram fa-2x"></i> <c:out value="${currentArtist.instagram}" default="Not available for this artist"/><br>
                        </span>
                        <hr>
                          <span class="tags">
                              <c:set value="${currentArtist['tags']}" var="tagList"/>
                              <c:forEach items="${tagList}" var="tag">
                                  <c:out value="- ${tag}" default="No Tags"/> <br>
                              </c:forEach>
                        </span>

                    </div>
                </div>
            </div>

            </div>


            <%-- buy tickets --%>
            <div class="availableTickets">
                <div class="row" style ="margin-top: 20px;">
                    <div class="col-lg-12">
                        <div class="panel"> 
                                 <div class="panel-heading">
                                     Available Tickets

                                </div>
                             </div>
                    </div>
                </div>
            </div>

                <c:choose>
                    <c:when test="${multiple eq true}">

                         <div class="row" style="margin-top: 10px; padding-bottom: 100px;">
                        <c:forEach var="event" items="${childList}">
                            <%--<c:set var="venue" value="${event.venue}"/> --%>

                            <div class="col-lg-12 eventRow">
                                <c:set var="eventVenue" value="${event.venue}"/>
                                <div class="col-lg-3 eventRowSegment"> <c:out value="${event.startDateTime}"/></div>
                                <div class="col-lg-3 eventRowSegment"> <c:out value="${event.name}"/></div>
                                <div class="col-lg-3 eventRowSegment"> <c:out value="${eventVenue.name}."/></div>
                                <div class="col-lg-3 eventRowBuy"> <a href="event.do?eventdata=${event.parentEventID}"><img src="images/buyTicket.png"></a></div>

                            </div>

                        </c:forEach>
                    </div>





                    </c:when>

                    <c:when test="${multiple eq false}">

                         <div class="col-lg-12 noTickets">
                        Currently no scheduled events 
                        </div>  

                    </c:when>

                </c:choose>

            </div>
        </div>
      <%-- footer --%>          
    <div class="container">
        <nav class="navbar navbar-inverse navbar-fixed-bottom">

            <ul class="nav navbar-nav">
                <li><a href="">Contact us</a></li>
                <li class="divider"></li>
                <li><a href=""> API</a></li>
                <li class="divider"> </li>
                <li><a href=""> About</a></li>

            </ul>

        </nav>
    </div>



        <script src ="http://code.jquery.com/jquery.js"></script>
        <script src ="js/bootstrap.min.js"></script>
        <script src ="js/less.js"></script>
        <script src ="js/jQuery.js"></script>
    </body>
</html>



