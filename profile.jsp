
<%@page import="com.librarymanagement.entities.User" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("login.jsp");
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="css_js/profilecss.css" media="screen">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
   <title>profile</title>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #111;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>
    <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()" >&times;</a>
  <a href="#"><i class="fa fa-user-circle" aria-hidden="true"></i> My Profile</a>
  <a href="menu.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> Menu</a>
  <a href="LogoutServlet"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a>
  <a href="about.jsp"><i class="fa fa-file-text-o" aria-hidden="true"></i> About</a>
  
</div>
    <div style="background-color: #ff6666;">  <span style="font-size:30px;cursor:pointer ;margin-left: 10px;" onclick="openNav()" >&#9776; </span></div>

<div class="page-content page-container" id="page-content">
    <div class="padding">
        <div class="row container d-flex justify-content-center">
            <div class="col-xl-6 col-md-12">
                <div class="card user-card-full">
                    <div class="row m-l-0 m-r-0" style="padding-left: 200px;padding-top: 100px;padding-right: 200px;padding-bottom: 100px;">
                        <div class="col-sm-4 bg-c-lite-green user-profile" >
                            <div class="card-block text-center text-white" style="margin-left:350px;">
                                <div class="m-b-25"> <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image"> </div>
                                <p class="f-w-600" style="font-size:20px;">Your Details</p>
                                
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600" style="color:#ff3333;">Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Your Id</p>
                                        <h6 class="text-muted f-w-400"><%= user.getId() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Name</p>
                                        <h6 class="text-muted f-w-400"><%= user.getName() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Phone</p>
                                        <h6 class="text-muted f-w-400"><%= user.getMobile() %></h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600" style="color:#ff3333;">Login Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Username</p>
                                        <h6 class="text-muted f-w-400"><%= user.getUsername() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">password</p>
                                        <h6 class="text-muted f-w-400"><%= user.getPassword() %></h6>
                                    </div>
                           
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600" style="color:#ff3333;">Address</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">City</p>
                                        <h6 class="text-muted f-w-400"><%= user.getCity() %></h6>
                                    </div>
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">State</p>
                                        <h6 class="text-muted f-w-400"><%= user.getState() %></h6>
                                    </div>
                           
                                </div>
                                
                                <div style="background-color:red;width:65px;height: 20px; text-align: center;padding: 3px;margin-left: 450px;"><a href="editprofile.jsp" class="btn btn-warning" style="text-decoration: none;color: black;"><b>Edit</b></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function openNav() {
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
  document.getElementById("mySidenav").style.width = "0";
}
</script>
   </body>
</html>
