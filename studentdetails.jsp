<%-- 
    Document   : studentdetails
    Created on : 6 Mar, 2021, 10:35:41 PM
    Author     : user
--%>
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
        <title>Student Information</title>
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
                      <li style="color:white;font-size: 20px"> <b>Student Details</b></li>
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
                    <th>Scholar No.</th>
                    <th>Name</th>
                    <th>Course</th>
                    <th>Session Start</th>
                    <th>Session End</th>
                    <th>City</th>
                    <th>State</th>
                    <th>Mobile</th>
                   
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
                   
                     s="select * from student_info order by sch_no";
                            }
                    else
                    {
                        s="select * from student_info where sch_no like '"+data+"'or mem_type like '"+data+"' or sname like '"+data+"' or course  like '"+data+"' or session_start like '"+data+"' or session_end like '"+data+"' or s_city like '"+data+"' or s_state like '"+data+"' or mob like '"+data+"' order by sch_no";
                    }
                    r=p.executeQuery(s);
                    while(r.next())
                    { 
                %>
                    <tr>
                        <td><%=r.getString("sch_no")%></td> 
                     
                      <td><%=r.getString("sname")%></td> 
                      <td><%=r.getString("course")%></td> 
                      <td><%=r.getString("session_start")%></td> 
                      <td><%=r.getString("session_end")%></td> 
                      <td><%=r.getString("s_city")%></td> 
                      <td><%=r.getString("s_state")%></td> 
                      <td><%=r.getString("mob")%></td> 
                       
                       <td>
                           <a href="editstudent.jsp?u=<%=r.getString("sch_no")%>" class="btn btn-warning">Edit</a>
                       </td>
                       <td>
                           <a href="deletestudent.jsp?u1=<%=r.getString("sch_no")%>" class="btn btn-warning">Delete</a>
                       </td>
                        <td>
                           <a href="studentidcard.jsp?id=<%=r.getString("sch_no")%>" class="btn btn-warning">Id Card</a>
                       </td>
                    </tr>
                    <%
                        }
                        %>
            </tbody>
        </table>
</body>
</html>
