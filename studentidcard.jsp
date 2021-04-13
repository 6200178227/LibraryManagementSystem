<%@page import="com.librarymanagement.entities.User" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("login.jsp");
    }
    %>
<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Id Card</title>
          <style>
  header ul
{
float:right;
list-style-type: none;
margin-top:25px;
}

header{
background-color:black;
	height:60px;
}
header ul li
{
display: inline-block;
}
header ul li a
{
text-decoration: none;
color: white;
font-weight:bold;
padding: 5px 30px;
transition :0.6s ease;
}
header ul li a:hover
{
background-color:#2f4f4f;
color:#fff;
}

 
header ul li a:active
{
color:blue;
}

        </style>
    </head>
    
     <body style="background-color:white;">
         <header>
<div >

    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
      <li><a href="menu.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Menu</a></li>
     <li><a href="studentdetails.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>  Back</a></li>
      <li><a href="LogoutServlet"><i class="fa fa-sign-in" aria-hidden="true"></i> Logout</a></li>
    
    </ul>
</div>
       </header>
        <div style="box-shadow: 10px 5px #003333;width: 400px;height: 350px;background-color:rgba(1,1,0,0.1) ;border: black solid 10px;padding: 30px;margin-left: 450px;margin-top: 100px">
            <img src="css_js/libb.png" style="width:70px;hight:40px;margin-left: 170px;">
        
            <h2 style="text-align:center;color: #666600;"> LIBRARY MEMBERSHIP CARD</h2>
                
            <%
                                     Connection c=connectionprovider.getConnection();
                                       Statement st=c.createStatement();
                                     String  u=request.getParameter("id");
                                   
            String s="select * from student_info where sch_no='"+u+"'";
          
           ResultSet r= st.executeQuery(s);
           while(r.next())
           {
               %>
               <table style="margin-left:70px; font-size: 20px;line-height: 30px;">
                   <tr><th style="text-align:center;">Name : </th><td><span style="color:#084cc3"><%=r.getString("sname")%></span></td></tr>
                   <tr><th style="text-align:center;">Member Id :</th><td><span style="color:#084cc3"><%=r.getString("sch_no")%></span></td></tr>
                   <tr><th style="text-align:center;">Course :</th><td><span style="color:#084cc3"><%=r.getString("course")%></span></td></tr>
                   <tr><th style="text-align:center;">Session :</th><td><span style="color:#084cc3"><%=r.getString("session_start")%>-<%=r.getString("session_end")%></span></td></tr>
                   <tr><th style="text-align:center;">Mobile : </th><td><span style="color:#084cc3"><%=r.getString("mob")%></td></tr>
               </table>
               <%
                   }
            %> 
            <br>
<h5>Librarian(Signature)</h5>
        </div>
    </body>
</html>
