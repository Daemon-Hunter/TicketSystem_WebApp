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
        <title>Venue</title>
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
        
         
        
        <%-- content --%>
        <div class="container" style="position:relative;">
           
           
            
            <div class="row contentPosition">
                <div class="col-lg-8">
                    <div class="socialLinkBackground socialLinkTopRadius">
                    <a href="" class="btn btn-group-justified">
                        <i class="fa fa-plus-circle fa-2x"> Track</i>
                        <span class=""> and receive updates</span>
                    </a>
                    </div>
                    
                   
             </div>
                <div class="col-lg-8">
                    <img src="/Images?type=venue$id=${venue.ID}" class="imgSize">
                    
                    
                    
                    <div class="row">
                        <div class="col-lg-6">
                             <div class="socialLinkBackground">
                                 <a href="${facebook}" class="btn btn-group-justified">
                                    <i class="fa fa-facebook fa-2x"></i>
                                    ${facebook}
                                 </a>
                             </div>
                        </div>
                        <div class="col-lg-6">
                             <div class="socialLinkBackground">
                                <a href="${twitter}" class="btn btn-group-justified" style="background-color: white;">
                                    <i class="fa fa-twitter fa-2x"> </i>
                                    ${twitter}
                                 </a>
                             </div>
                        </div>
                    </div>
                    
                    
                     <%-- soundCloud 
                <div class="col-lg-2">
                     <a href="" class="btn btn-group-justified" style="background-color: white;">
                        <i class="fa fa-soundcloud fa-2x"> </i>
                    </a>
                </div>
                --%>
                </div>
                
                 <div class="col-lg-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <span id="heading">
                            ${venue.name}
                        </span>
                    </div>
                    <div class="panel-body panelBodyBox">
                        <span class="description">
                            ${venue.description}
                        </span>
                        <hr>
                        <span class="googleMap">
                            
                            <iframe
                                width="600"
                                height="450"
                                frameborder="0" style="border:0"
                                src="https://www.google.com/maps/embed/v1/place?key=AIzaSyCnCjhuB-7cFDL9ZdArYQSq1qlOEtU1IOQ&q=${venue.name}+${venue.postcode}
                                  &q=Space+Needle,Seattle+WA" allowfullscreen>
                            </iframe>

                            
                        </span>
                        <hr>
                        <span class="contactDetails">
                            ${venue.address}
                            ${venue.postcode}
                           
                        </span>

                    </div>
                </div>
            </div>
                
            </div>
                
                    
            <%-- buy tickets --%>
            <div class="availableTickets">
                <div class="row" style ="margin-top: 20px;">
                    <div class="col-lg-8">
                        <div class="panel" style="font-family: Impact, Charcoal, sans-serif; font-size: 25px;"> 
                                 <div class="panel-heading">
                                     Available Tickets

                                </div>
                             </div>
                    </div>
                </div>
                    <div class="row" style="margin-top: 10px; padding-bottom: 100px;">
                        

                        
                        <div class="col-lg-8">
            
                            <div class="eventRow" style="border: 4px; border-color: red;">
                                           <div class="col-lg-1" style="background-color: white; padding: 10px; font-family: Impact, Charcoal, sans-serif; font-size: 20px;"> Date</div>
                                           <div class="col-lg-3" style="background-color: white; padding: 10px; font-family: Impact, Charcoal, sans-serif; font-size: 20px;"> Title </div>
                                           <div class="col-lg-3" style="background-color: white; padding: 10px; font-family: Impact, Charcoal, sans-serif; font-size: 20px;"> Location/Venue </div>
                                           <div class="col-lg-2" style="background-color: white; padding: 10px; font-family: Impact, Charcoal, sans-serif; font-size: 20px;"> Buy</div>
                                        </div>

                        </div>
                    </div>

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


 
