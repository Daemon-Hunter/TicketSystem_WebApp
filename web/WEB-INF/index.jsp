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
        <title>Home</title>
        
        <script src ="http://code.jquery.com/jquery.js"></script>
        <script src ="js/bootstrap.min.js"></script>
        <script src ="js/less.js"></script>
        <script src="js/load.js"> </script>
    </head>
    <body>
        
        <nav class="navbar navbar-inverse navbar-static-top mynav">
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
                                <form action="SignIn" method="post" accept-charset="UTF-8" class="SignInBox">
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
        
        <%-- Main search bar --%>
        <div class="container">
             <div class="row topPadding" style="margin-bottom: 210px;">
                 
                <div class="col-lg-12 "> 
                    <form action="searchResult" method="POST" class="topPadding form-inline">
                        <lavel class="errorMessage">${ErrorMessage}</label>
                        <h1 style="font-size: 75px; font-family: Impact, Charcoal, sans-serif;" id="searchBarMain"><span class="label">Complete Listings</span></h1>    
                                
                                <div class="input-group-addon" id="mainSearchBar">    
                                    <input type="text" name="user_search" class="form-control" placeholder="Artist/Venue/Event/Tag" style="height:70px; font-size: 30px; width:96%" >
                                    <button class="btn btn-lg" style="height:70px;"><span class="glyphicon glyphicon-search" type="submit"></span></button>
                                </div>
                                
                         
                    </form>
                </div>
             </div>
            
            
            
            <%-- tabbed pane --%>
            <div class="row " style="border: 2px #fff; padding-bottom: 100px;">
                <div class="col-lg-12">
                    <div class="newEventHeader"> Latest Events <hr></div>
                    <div class="galleryContainer">
                    <c:forEach items="${eventList}" var="event" varStatus="loop">
                        
                        <div class="col-lg-2  newEventGallery"> 
                            <a href="event.do?eventdata=${event.ID}">
                                <img class="eventImage" src="Image?type=event&id=${event.ID}">
                                 <div class="underImageInfo">
                                     <div class="boxName"> ${event.name} </div> 

                                <div class="boxChildren"> 
                                    ${childAmount[loop.index]} Shows
            
                                </div>
                                </div>
                            </a>  
                        </div>
                    </c:forEach>
                    </div>
                    
                    
                    <div id="moreData"> 
                    </div>
                    
                     
                </div> <div class="eventData">
                    <button id="loadMoreButton"> Load more </button> 
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
        
    
        
    </body>
</html>


 