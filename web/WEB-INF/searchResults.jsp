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
                <a href="index.jsp">
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
                    <div class="artist">
                        
                     <c:forEach items="${artistList}" var="artist" varStatus="loop">
                         
                                <a href="artist?artistdata=${artist.ID}" >
                                    <div class="col-lg-3 newEventGallery" id="${loop.index}"> 
                                        <img src="/Image?type=artist&id=${artist.ID}">
                                        <div>  ${artist.name} </div>
                                    </div>
                                </a>                 
                    </c:forEach> 
                        
                    </div>
                    <div class="venue" style="color: red">
                        <c:forEach items="${venueList}" var="venue" varStatus="loop">
                            <a href="venue.do?venuedata=${venue.ID}">
                                <div class="col-lg-3 newEventGallery" id="${loop.index}"> 
                                     <img src="/Image?type=venue&id=${venue.ID}">
                                     <div>${venue.name} </div>
                                </div>
                               
                                
                            </a>
                        </c:forEach>
                        <div class="event">
                        <c:forEach items="${eventList}" var="event" varStatus="loop">
                            <a href="event.do?eventdata=${event.ID}">
                                <div class="col-lg-3 newEventGallery" id="${loop.index}"> 
                                     <img src="/Image?type=event&id=${event.ID}">
                                           
                                     <div>${event.name} </div>
                                     
                                    
                                </div>
                            </a>
                        </c:forEach>
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


 