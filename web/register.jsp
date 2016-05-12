<%-- 
    Document   : index
    Created on : 25-Feb-2016, 12:21:22
    Author     : Nick
--%>

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
        <title>Register</title>
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
                        <div class="panel-heading" style="font-size: 30px; font-family: Impact, Charcoal, sans-serif; "> Register </div>
                        <div class="panel-body">
                            <form class="form-horizontal" action="RegisterServlet" method="post">
                                <div class="formContainer">
                                    <div class="form-group">
                                        <label class="errorMessage"> ${errorMessage} </label>
                                        <hr>
                                        
                                        <label for="firstName"> First Name: </label>
                                        <input type="text" class="form-control" name="firstName" placeholder="Enter First Name">
                                    </div>

                                    <div class="form-group">
                                        <label for="lastName"> Surname: </label>
                                        <input type="text" class="form-control" name="surname" placeholder="Enter Surname">
                                    </div>

                                    <div class="form-group">
                                        <label for="email"> Email: </label>
                                        <input type="text" class="form-control" name="email" placeholder="Enter email">
                                    </div>
                                    
                                     <div class="form-group">
                                        <label for="address"> Address: </label>
                                        <input type="text" class="form-control" name="address" placeholder="Enter address">
                                    </div>
                                    
                                     <div class="form-group">
                                        <label for="postcode"> Postcode </label>
                                        <input type="text" class="form-control" name="postcode" placeholder="Enter postcode">
                                    </div>

                                    <div class="form-group">
                                        <label for="password"> Password: </label>
                                        <input type="password" class="form-control" name="password" placeholder="Enter Password">
                                    </div>

                                    <div class="form-group">
                                        <label for="lastName:"> Confirm Password: </label>
                                        <input type="password" class="form-control" name="passwordConfirm" placeholder="Enter Password">
                                    </div>
                                    
                                    <div style="padding-top: 20px;">
                                        <button type="submit" class="btn btn-primary btn-lg" id="registerSubmit">
                                            Register
                                        </button>
                                    </div>


                                </div>
                            </form>
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


 