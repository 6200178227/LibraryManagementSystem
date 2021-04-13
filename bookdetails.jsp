
<%@page import="com.librarymanagement.entities.User" %>
<%
    User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
        response.sendRedirect("login.jsp");
    }
    %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>
<!DOCTYPE html>

<html>
     <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Book Information</title>
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
                      <li style="color:white;font-size: 20px"> <b>Book Details</b></li>
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
                    <th>Acc. No.</th>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Edition</th>
                    <th>publication </th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Shelf Id</th>
                    <th>Status</th>
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
                     s="select * from book_details order by acc_no";
                            }
                    else
                    {
                        s="select * from book_details where acc_no like '"+data+"'or isbn like '"+data+"' or title like '"+data+"' or author  like '"+data+"' or edition like '"+data+"' or publication_date like '"+data+"' or category like '"+data+"' or price like '"+data+"' or shelf_id like '"+data+"' or status like '"+data+"' order by acc_no";
                    }
                    
                    r=p.executeQuery(s);
                    while(r.next())
                    { 
                %>
                    <tr>
                        <td><%=r.getString("acc_no")%></td> 
                      <td><%=r.getString("isbn")%></td> 
                      <td><%=r.getString("title")%></td> 
                      <td><%=r.getString("author")%></td> 
                      <td><%=r.getString("edition")%></td> 
                      <td><%=r.getString("publication_date")%></td> 
                      <td><%=r.getString("category")%></td> 
                      <td><%=r.getString("price")%></td> 
                      <td><%=r.getString("shelf_id")%></td> 
                       <td><%=r.getString("status")%></td> 
                       <td>
                           <a href="editbook.jsp?u=<%=r.getString("acc_no")%>" class="btn btn-warning">Edit</a>
                       </td>
                       <td>
                           <a href="deletebook.jsp?u1=<%=r.getString("acc_no")%>" class="btn btn-warning">Delete</a>
                       </td>
                       
                       
                    </tr>
                    <%
                        }
                        %>
            </tbody>
        </table>
</body>
</html>
