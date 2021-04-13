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
        <title>Book issue details</title>
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
                      <li style="color:white;font-size: 20px"> <b>Issued Book Details</b></li>
            </ul>
<div >

    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>  Home</a></li>
      <li><a href="menu.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i>  Menu</a></li>
     
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
                    <th>Member Id</th>
                    <th>Name</th>
                    <th>Acc. No.</th>
                    <th>Librarian Id</th>
                    <th>Member Type</th>
                    <th>Issue Date</th>
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
                     s="select * from issuebook";
                            }
                    else
                    {
                        s="select * from issuebook where mem_id like '%"+data+"%'or mem_name like '%"+data+"%' or acc_no like '%"+data+"%' or lib_id  like '%"+data+"%' or mem_type like '%"+data+"%' or issue_date like '%"+data+"%'";
                    }
                    
                    r=p.executeQuery(s);
                    while(r.next())
                    { 
                %>
                    <tr>
                        <td><%=r.getString("mem_id")%></td> 
                      <td><%=r.getString("mem_name")%></td> 
                      <td><%=r.getString("acc_no")%></td> 
                      <td><%=r.getString("lib_id")%></td> 
                      <td><%=r.getString("mem_type")%></td> 
                      <td><%=r.getString("issue_date")%></td> 
                    </tr>
                    <%
                        }
                        %>
            </tbody>
        </table>
    </body>
</html>
