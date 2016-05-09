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
        <title>Artist</title>
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
        
        
        <div class="container topPadding" id="searchResultContainer">
            
           <h1 style="font-size: 60px; font-family: Impact, Charcoal, sans-serif;" id="searchBarLeft"><span class="label">Search Results</span></h1>
           
           <div class="searchResultArea">
               
               <div class="row" style="border: 2px #fff; padding-bottom: 100px;">
                   <div class="col-lg-3">
                       <form action="filter.do" method="post">
                       <div class="filterBox">
                           <p> Filter </p>
                           <hr>
                           <p> Search Term: "${user_search}" </p>
                           <hr>
                           <%-- Category filter --%>
                            <div class="checkbox">
                                   <label><input type="checkbox" value="artist" name="artist">Artist's </label>
                            </div> 
                            <div class="checkbox">
                                   <label><input type="checkbox" value="venue" name="venue"> Venue's </label>
                            </div>
                            <div class="checkbox">
                                   <label><input type="checkbox" value="event" name="event"> Event's </label>
                            </div>
                           <hr>
                           
                           <%-- Tag filter 
                           <p> Filter by Tag: </p>
                            <div class="checkbox">
                                   <label><input type="checkbox" value="event" name="event"> Event's </label>
                            </div>
                           
                           <hr>--%>
                           <%-- Date filter --%>
                           <p> Filter by Date: </p>
                           
                           <div class="dateFilter"> <input name="dater"></div>
                           
                           <hr>
                           
                           <input type="hidden" value="${user_search}" name="user_search"> 
                           <input type="submit" class="btn btn-sm" value="Apply Filter"> </input>
                          
                        </div>
                       </form>
                   </div>
                <div class="col-lg-9">
                    <c:choose> 
                        <c:when test="${displayArtist eq true}">
                             <div class="artist">
                    
                        <c:forEach items="${fArtists}" var="artist" varStatus="loop">

                                    <a href="artist?artistdata=${artist.ID}" >
                                        <div class="col-lg-3 newEventGallery" id="${loop.index}"> 
                                            <img class="eventImage" src="Image?type=artist&id=${artist.ID}">
                                            <div class="underImageInfo">
                                                <div class="boxName"> ${artist.name} </div> 

                                                <div class="boxChildren">  </div>
                                            </div>
                                        </div>
                                    </a>                 
                        </c:forEach> 
                      
                        </div>
                    </c:when>
                            
                             
                <c:when test="${displayVenue eq true}">
                    <div class="venue" style="color: red">
                        <c:forEach items="${fVenues}" var="venue" varStatus="loop">
                            <a href="venue.do?venuedata=${venue.ID}">
                                <div class="col-lg-3 newEventGallery" id="${loop.index}"> 
                                     <img class="eventImage" src="Image?type=venue&id=${venue.ID}">
                                     <div class="underImageInfo">
                                        <div class="boxName"> ${venue.name} </div> 

                                        <div class="boxChildren">  </div>
                                    </div>
                                </div>
                               
                                
                            </a>
                        </c:forEach>
                    </c:when>
                       
                        <c:when test="${displayEvent eq true}">
                            <div class="event">
                            <c:forEach items="${fEvents}" var="event" varStatus="loop">
                                <a href="event.do?eventdata=${event.ID}">
                                    <div class="col-lg-3 newEventGallery" id="${loop.index}"> 
                                         <img class="eventImage" src="Image?type=event&id=${event.ID}">

                                         <div class="underImageInfo">
                                            <div class="boxName"> ${event.name} </div> 

                                            <div class="boxChildren">  </div>
                                        </div>


                                    </div>
                                </a>
                            </c:forEach>
                        </c:when>
                                
                    </c:choose>
                        </div>
                    </div>
                  
                    
                    
                    
                    <%-- <a href="artist?artistdata=${artistList["1"].ID}" ><div class="col-lg-3 newEventGallery" id="2"> ${artistList["1"].name} </div></a>
                    <a href="artist?artistdata=${artistList["2"].ID}" ><div class="col-lg-3 newEventGallery" id="3"> ${artistList["2"].name} </div></a>
                    <a href="artist?artistdata=${artistList["3"].ID}" ><div class="col-lg-3 newEventGallery" id="4"> ${artistList["3"].name} </div></a>
                    
                    <a href="artist?artistdata=${artistList["4"].ID}" ><div class="col-lg-3 newEventGallery" id="5"> ${artistList["4"].name} </div></a>
                    <a href="artist?artistdata=${artistList["5"].ID}" ><div class="col-lg-3 newEventGallery" id="6"> ${artistList["5"].name} </div></a>
                    <a href="artist?artistdata=${artistList["6"].ID}" ><div class="col-lg-3 newEventGallery" id="7"> ${artistList["6"].name} </div></a>
                    <a href="artist?artistdata=${artistList["7"].ID}" ><div class="col-lg-3 newEventGallery" id="8"> ${artistList["7"].name} </div></a>
                    
                    <a href="artist?artistdata=${artistList["8"].ID}" ><div class="col-lg-3 newEventGallery" id="9"> ${artistList["8"].name} </div></a>
                    <a href="artist?artistdata=${artistList["9"].ID}" ><div class="col-lg-3 newEventGallery" id="10"> ${artistList["9"].name} </div></a>
                    <a href="artist?artistdata=${artistList["10"].ID}" ><div class="col-lg-3 newEventGallery" id="11"> ${artistList["10"].name} </div></a>
                    <a href="artist?artistdata=${artistList["11"].ID}" ><div class="col-lg-3 newEventGallery" id="12"> ${artistList["11"].name} </div></a>
                   --%>
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
        <script src ="js/myQuery.js"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

    </body>
</html>


 