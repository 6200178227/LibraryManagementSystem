<%-- 
    Document   : login
    Created on : 23 Feb, 2021, 1:37:41 AM
    Author     : user
--%>
<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign in</title>
          <link rel="stylesheet" type="text/css" href="css_js/loginst.css"> 
           <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        
    </head>
    <body>
       <header>
<div >

    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
      <li><a href="#"><i class="fa fa-sign-in" aria-hidden="true"> </i>Login</a></li>
      <li><a href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"> </i>Sign-Up</a></li>
      <li><a href=""><i class="fa fa-file-text-o" aria-hidden="true"></i> About</a></li>
    
    </ul>
</div>
       </header>
      
<form action="Loginservelet" method="post">
  <div class="imgcontainer">
    <img src="css_js/icon1.png" alt="Avatar" class="avatar">
     <% 
           String d=null;
                  d=(String)request.getAttribute("errmsg");
           if(d!=null)
           {
           %>
          <h5 style="text-align:center;"><span style="color:red"><%=d%></span></h5>
          <%
              d=null;
              }
              %>
  </div>

  <div class="container">
    
    <label for="uname" style=" margin-left: 50px;"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="uname" required style=" margin-left: 50px;">
    <br>
    <label for="psw"  style=" margin-left: 50px;"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required style=" margin-left: 53px;">
    <br>
    
    <button type="submit"  style=" margin-left: 250px;">Login</button>
    
  </div>

  <div class="container" style="background-color:#f1f1f1">
      <a href="index.jsp">  <button type="button" class="cancelbtn">Cancel</button></a>
   <span class="psw">Forgot <a href="forgetpassword.jsp">password?</a></span>
  </div>
</form>
    

  <footer style=" font-size: 20px;background-color: black;color: white;height:30px;">
    <p><span style="margin-left:180px;"><i class="fa fa-phone" aria-hidden="true"></i>  Contact us :  1121284516</span>
<mail style="margin-left:500px;"><i class="fa fa-envelope" aria-hidden="true"></i>  centrallibrary@gamil.com</mail></p>
</footer>

    </body>
</html>
