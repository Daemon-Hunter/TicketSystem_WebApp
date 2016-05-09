<%-- 
    Document   : MyJunction
    Created on : 07-May-2016, 21:46:43
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
        <title>Payment</title>
        
        
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
                                <form action="SignIn" method="post" accept-charset="UTF-8">
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
                <img class="padding" src="images/LogoWhite.png">
                    </a>
                </div>
            </div>
                      
        </div>
        
       
        
       <div class="container">
           <div class="paymentBox">
               <legend> Welcome to your Junction ${currentUser.firstName} </legend>
            <ul class="nav nav-tabs nav-justified">
                  <li role="navigation" class="active"><a href="#profile" data-toggle="tab">Profile</a></li>
                  <li role="navigation"><a href="#subscriptions" data-toggle="tab">Subscriptions</a></li>
                  <li role="navigation"><a href="#orders" data-toggle="tab">Orders</a></li>
            </ul>
            
            <div class="tab-pane active" id="profile">
            <h2>Profile</h2>
            <hr>
            <label for="firstName"> First name: </label>
            <input type="text" class="form-control" name="firstName" id="firstName" placeholder="${currentUser.firstName}" disabled="true">
            
            <label for="lastName"> Last name: </label>
            <input type="text" class="form-control" name="lastName" id="lastName" placeholder="${currentUser.lastName}" disabled="true">
            
            <label for="email"> Email: </label>
            <input type="text" class="form-control" name="email" id="email" placeholder="${currentUser.email}" disabled="true">
            
            <label for="address"> Address: </label>
            <input type="text" class="form-control" name="address" id="address" placeholder="${currentUser.address}" disabled="true">
            
             <label for="postcode"> Postcode: </label>
            <input type="text" class="form-control" name="postcode" id="postcode" placeholder="${currentUser.postcode}" disabled="true">
             <button id="profileEditButton">  Edit  </button>
                </div>
            </div>
            
           
</div> 
            
            <div class="tab-pane active" id="orders">
                <h2> Your Orders </h2>
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


 