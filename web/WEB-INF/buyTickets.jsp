<%-- 
    Document   : buyTickets
    Created on : 13-Mar-2016, 20:45:01
    Author     : Ruth
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
        <title>Buy Tickets</title>
    </head>
    <body>
        
         <nav class="navbar navbar-inverse navbar-static-top">
            <ul class="nav navbar-nav pull-right" style="margin-right: 15%; margin-top: 5px; font-size: 21px;">
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
                <img class="padding" src="images/logo/logologo.png">
               
                    </a>
                     <span class="logotext"> Function Junction </span>
                </div>
            </div>
                      
        </div>
        
        <%-- Left top search bar --%>
        <div class="row">
            <div class="col-lg-3 leftSearch col-lg-offset-1">
                <div id="searchBarLeft"><div class="form-inline" >
                        <form class="form-inline" action="SearchCategory.do" method="get">
                        <div class="form-group">
                            <select class="form-control" style="width: 12em" placeholder="Category" name="categories">
                                <option value="event">Event's</option>
                                 <option value="venue">Venue's</option>
                                  <option value="artist">Artist's</option>
                                  
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="form-control" style="width: 12em" name="locations" placeholdr="Location">
                                <option value="south-east">South East</option>
                                 <option value="london">London</option>
                                  <option value="north-west">North West</option>
                                  <option value="east-england">East of England</option>
                                  <option value="west-midlandst">West Midlands</option>
                                  <option value="south-west">South West</option>
                                  <option value="yorkshire">Yorkshire and Humber</option>
                                  <option value="east-midlands">East Midlands</option>
                                  <option value="north-east">North East</option>
                            </select>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                    </div>
                </div>
             </div>
        </div>
        
        
        
        <div class="container">
            
            <div class="row contentPosition">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading" style="font-size: 30px; font-family: Impact, Charcoal, sans-serif; "> Purchase Tickets </div>
                        <div class="panel-body">
                            
                            <%-- pull details of ticket --%>
                            <div class="row">
                                
                                <div class="col-lg-12">
                                    
                                    <div  class="ticketDetailText"> Event Name: </div> <span class="ticketActualDetails"> ${childEvent.name} </span> <hr>
                                    <div  class="ticketDetailText"> Start:</div> <span class="ticketActualDetails"> ${childEvent.startDateTime} </span>
                                    <div  class="ticketDetailText"> End: </div> <span class="ticketActualDetails"> ${childEvent.endDateTime} </span> <hr>
                                    <div  class="ticketDetailText"> Description:</div> <span class="ticketActualDetails"> ${childEvent.description}  </span>
                                    <hr>
                                </div>
                            </div>
                            
                            <%-- ticket option headings --%>
                            <div class="row" style="padding-bottom: 15px;">
                                
                                <div class="col-lg-4">
                                    <div class="ticketDetailText"> Ticket Type</div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="ticketDetailText"> Cost</div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="ticketDetailText"> Quantity</div>
                                    
                                </div>
                                <hr>
                            </div>
                            
                            <%-- Ticket options data --%>
                            <div class="row">
                                <form action="orderSummary.do" method="get">
                                    ${ticketError}
                                    <c:forEach items="${ticketList}" var="ticket" varStatus="loop">
                                        <div class="col-lg-4" class="ticketOptions">
                                            <div class="ticketDetailText">  ${ticket.type}</div>

                                        </div>
                                        <div class="col-lg-4" class="ticketOptions">
                                            <div class="ticketDetailText"> ${ticket.price}</div>
                                        </div>
                                        <div class="col-lg-4" class="ticketOptions">
                                            <select name="hello${loop.count}" class="form-control" style="width: 5em">

                                                <option value="0:${ticket.ID}">0</option>       
                                                <option value="1:${ticket.ID}">1</option>
                                                <option value="2:${ticket.ID}">2</option>
                                                <option value="3:${ticket.ID}">3</option>
                                                <option value="4:${ticket.ID}">4</option>
                                                <option value="5:${ticket.ID}">5</option>
                                                <option value="6:${ticket.ID}">6</option>
                                                <option value="7:${ticket.ID}">7</option>
                                                <option value="8:${ticket.ID}">8</option>
                                            </select>
                                        </div>
                                    </c:forEach>
                                    <input type="hidden"  value="${parentEvent.ID}"  name="parent"/>
                                    <input type="hidden" value="${childEvent.ID}" name="child"/>
                                    
                                    <c:if test="${noEvents eq true}">
                                        <div class="ticketDetailtext">
                                            <strong>No Tickets available for this event</strong>
                                        </div>
                                    </c:if>
                                    <c:if test="${noEvents eq false}">
                                    <input type="submit" value="Checkout" class="btn btn-lg btn-primary" style="margin: 30px;">
                                    </c:if>
                                </form>
                            </div>
                            
                            
                            
                        </div>
                    <div>
                </div>
            </div>
            
        </div> 
        
        
        
        <%-- footer --%>
    <container>
        <nav class="navbar navbar-inverse navbar-fixed-bottom">
            
            <ul class="nav navbar-nav">
                <li><a href="">Contact us</a></li>
                <li class="divider"></li>
                <li><a href=""> API</a></li>
                <li class="divider"> </li>
                <li><a href=""> About</a></li>
            
            </ul>
            
        </nav>
    </container>
        
       
       
        <script src ="http://code.jquery.com/jquery.js"></script>
        <script src ="js/bootstrap.min.js"></script>
        <script src ="js/less.js"></script>
        <script src ="js/jQuery.js"></script>
    </body>
</html>


 