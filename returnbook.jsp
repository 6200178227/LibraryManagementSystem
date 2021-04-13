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

<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css_js/signupcss.css" rel="stylesheet" type="text/css" media="all" />
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Return Book</title>
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
<div >

    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i>  Home</a></li>
      <li><a href="menu.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i>  Menu</a></li>
     
      <li><a href="LogoutServlet"><i class="fa fa-sign-in" aria-hidden="true"></i>  Logout</a></li>
    
    </ul>
</div>
       </header>
        <div class="main-w3layouts wrapper">
		
		<div class="main-agileinfo">
			<div class="agileits-top">
                         <h1 style="margin-bottom: 20px;text-shadow:6px 2px gray; font-size:45px">Return Book</h1>
				<form action="" method="post">
					<input class="text" type="text" name="acc" placeholder="Book Accession Number" required="">
                                       
                                        <span style="color: white;margin-right: 10px;">Select Member Type</span><select class="tex" name="tp"  style="width: 150px;margin-top: 20px;">
							
							<option>faculty</option>
                                                        <option>student</option>	
				        </select>
                                        <input class="text" type="text" name="mid" placeholder="Member Id" required="" style="margin-top: 20px;">
					<input class="text" type="text" name="mnm" placeholder="Member Name" required="" style="margin-top: 20px;">
                                        <input class="text" type="text" name="uid" placeholder="Your Id" required="" style="margin-top: 20px;">
                                       
                                       <span style="color: white;padding-right: 1em">Date of Return </span> <input class="text" type="date" name="rdt"  required="" style="margin-top: 20px;">
					<input type="submit" value="Submit">
                                 
				</form>
                            
                                <p><a href="menu.jsp"> Back</a></p>
			</div>
		</div>
    
    </body>
</html>
 <%
                                            Connection c=connectionprovider.getConnection();
                                            String a=request.getParameter("acc");
                                            String a1=request.getParameter("tp");
                                            String a2=request.getParameter("mid");
                                            String a3=request.getParameter("mnm");
                                            String a4=request.getParameter("uid");
                                            String a5=request.getParameter("rdt");
                                            String x="2000-01-01";
                                             if(a!=null)
                                            {
                                                String s3="select * from issuebook where acc_no='"+a+"'";
                                                 PreparedStatement p3=c.prepareStatement(s3);
                                               ResultSet r= p3.executeQuery();
                                                while(r.next())
                                                {
                                                  x=r.getString("issue_date");
                                                }
                                            }
                                             
              if(a!=null && a1!=null && a2!=null && a3!=null && a4!=null && a5!=null )
              {
                  String s4="insert into returnbook(mem_id,mem_name,acc_no,lib_id,mem_type,issue_date,return_date) values(?,?,?,?,?,?,?)";
                  PreparedStatement p4=c.prepareStatement(s4);
                  p4.setString(1, a2);
                  p4.setString(2, a3);
                  p4.setString(3, a);
                  p4.setString(4, a4);
                  p4.setString(5, a1);
                  p4.setString(6, x);
                  p4.setString(7, a5);
             int g= p4.executeUpdate();
             
              }
              
                 if(a!=null)
                     {
                        String s="delete from issuebook where acc_no='"+a+"'";
                           PreparedStatement p=c.prepareStatement(s);
                           p.executeUpdate();
                          String s1="update book_details set status=1 where acc_no='"+a+"'";
                           PreparedStatement p1=c.prepareStatement(s1);
                            p1.executeUpdate();
                      }
                         String rd="2000-01-01";                 
                        if(a!=null)
                          {
                              String s6="select * from returnbook where acc_no='"+a+"' and issue_date='"+x+"'";
                                PreparedStatement p3=c.prepareStatement(s6);
                                ResultSet r= p3.executeQuery();
                                  while(r.next())
                                     {
                                        rd=r.getString("return_date");
                                      }
                                  }                    
                 SimpleDateFormat f1=new SimpleDateFormat("yyyy-MM-dd");
              java.util.Date d2=f1.parse(rd);                           
               SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
              java.util.Date d1=f.parse(x);
               
               long d=d2.getTime()-d1.getTime();
              long m11=d/(1000*60*60*24);
              long count=-1;
              if(m11>90)
                 count=m11-90;
               if(m11>0 && m11<=90)
                count=0;
              if(a!=null && x!=null)
              {
                   String qe="update returnbook set fine='"+count+"' where acc_no='"+a+"'and issue_date='"+x+"'";
                           PreparedStatement pq=c.prepareStatement(qe);
                            pq.executeUpdate();
              }
              String co=Long.toString(count);
             if(count>0)
             {
           request.setAttribute("fine",co);
              request.setAttribute("name",a3);
             RequestDispatcher rqd=request.getRequestDispatcher("fine.jsp");
             rqd.forward(request, response);
                 }
             else if(count==0)
             {
                 response.sendRedirect("returnsuccess.jsp");
             }
    %>
    