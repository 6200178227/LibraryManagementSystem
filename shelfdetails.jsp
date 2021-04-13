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
        <title>Shelf Details</title>
              <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
       
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
    <body>
         <header>
                  <ul style="float: left">
                      <li style="color:white;font-size: 20px"> <b>Shelf Details</b></li>
            </ul>
<div >

    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>  Home</a></li>
      <li><a href="menu.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> Menu</a></li>
     
      <li><a href="LogoutServlet"><i class="fa fa-sign-in" aria-hidden="true"></i>  Logout</a></li>
    
    </ul>
</div>
       </header>
         <p> <br/></p>
    <div class="row" style="margin-left: 50px;">
        <div class="col-md-6"></div>
       
        <div class="col-md-6"></div>  
        </div>
    </div>
    <div class="col-md-4" >
        <form action="" method="get">
            <input type="text" class="form-control" name="qu" placeholder="search here.." style="margin-left: 500px">
           
        </form>
        
    </div>
   
    <%@include file="header.jsp" %>
        <table class="table table-bordered table-striped table-hover" >
            <thead>
                <tr>
                    <th>Shelf Id</th>
                    <th>Section</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    Connection c=connectionprovider.getConnection();
                     Statement p=null;
                     ResultSet r=null;
                     p=c.createStatement();
                    String data=request.getParameter("qu");
                    String s;
                    if(data==null)
                            {
                     s="select * from shelf_info order by shelf_no";
                            }
                    else
                    {
                        s="select * from shelf_info where shelf_no like '"+data+"'or shelf_section like '"+data+"' order by shelf_no";
                    }
                    
                    r=p.executeQuery(s);
                    while(r.next())
                    { 
                %>
                    <tr>
                        <td><%=r.getString("shelf_no")%></td> 
                      <td><%=r.getString("shelf_section")%></td> 
                      
                       
                       <td>
                           <a href="deleteshelf.jsp?u1=<%=r.getString("shelf_no")%>" class="btn btn-warning">Delete</a>
                       </td>
                    </tr>
                    <%
                        }
                        %>
            </tbody>
        </table>
    </body>
</html>
