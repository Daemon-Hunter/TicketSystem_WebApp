<<%-- 
    Document   : buyTickets
    Created on : 13-Mar-2016, 20:45:01
    Author     : Ruth
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
            <ul class="nav navbar-nav pull-right" style="margin-right: 15%; font-size: 23px;">
                
                <li>
                    <a class="nav-link" href="register.jsp" >Register <span class="sr-only">(current)</span></a>
                  </li>
                  <li class="divider-vertical"> </li>
                  <li class="dropdown">
                            <a data-target="#" href="index.jsp" data-toggle="dropdown" class="dropdown-toggle">
                                <p class="">Sign in<b class="caret"></b></p>      
                            </a>
                            <div class="dropdown-menu" style="padding: 30px;">
                                <form action="[YOUR ACTION]" method="post" accept-charset="UTF-8">
                                    <input id="user_username" style="margin-bottom: 15px;" type="text" name="user[username]" size="35" />
                                    <input id="user_password" style="margin-bottom: 15px;" type="password" name="user[password]" size="35" />
                                    <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit" name="commit" value="Sign In" />
                                 </form>
                            </div>
                        </li>
                  
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
                                    <input type="submit" value="Checkout" class="btn btn-lg btn-primary" style="margin: 30px;">
                                    
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


 