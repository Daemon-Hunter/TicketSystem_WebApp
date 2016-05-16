<%-- 
    Document   : orderConfirm
    Created on : 16-Mar-2016, 18:19:41
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
        <title>Home</title>
        
       
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
        
       
        
       <div class="container">
           <div class="paymentBox">
               <div class="completeInfo"> 
               <legend> Thank you for your order! </legend><br>
               <c:choose>
                   <c:when test="${loggedIn eq false}">
                        
                        Booking reference number(s):
                        <c:forEach items="${bookingList}" var="booking">
                             <strong>${booking.bookingID}</strong> </p>
                        </c:forEach>

                        <p>Your E-Ticket will be sent to the following email address: <strong>${user.email}</strong> </p>
               </div>
                    </c:when>
                   
                   <c:when test="${loggedIn eq true}">
                        <div class="completeInfo"> 
                        Order ID:
                        
                             <strong>${order.orderID}</strong> 
                        

                        <p>Your E-Ticket will be sent to the following email address: <strong>${currentUser.email}</strong> </p>
                   </c:when>
               </c:choose>
               <hr>
               <div id="completeInfo">
               <legend> Order Summary </legend>
                
               Event name: ${child.name}<hr>
               
               <c:forEach items="${ticketList}" var="ticket">
                   
                   <c:out value="${ticket}" default="None"/><br>
                   
               </c:forEach>
                   </div>
               
              
           </div>
</div> 
        
       
                
               
                
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
        <script src ="js/myQuery.js"></script>
    </body>
</html>


 