
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
        <link href="css_js/signupcss.css" rel="stylesheet" type="text/css" media="all" />
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Issue Book</title>
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
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
      <li><a href="menu.jsp"><i class="fa fa-list-alt" aria-hidden="true"></i> Menu</a></li>
     
      <li><a href="LogoutServlet"><i class="fa fa-sign-in" aria-hidden="true"></i> Logout</a></li>
    
    </ul>
</div>
       </header>
         <div class="main-w3layouts wrapper">
		
		<div class="main-agileinfo">
			<div class="agileits-top">
                           <h1 style="margin-bottom: 20px;text-shadow:6px 2px gray; font-size:45px">Issue Book</h1>
				<form action="" method="post">
					<input class="text" type="text" name="acc" placeholder="Book Accession Number" required="">
                                        <span style="color: white;margin-right: 10px;">Select Member Type</span><select class="tex" name="tp" style="width: 150px; margin-top: 20px;">
							<option>faculty</option>
                                                        <option>student</option>	
				        </select>
                                        <input class="text" type="text" name="mid" placeholder="Member Id" required="" style="margin-top: 20px;">
					<input class="text" type="text" name="mnm" placeholder="Member Name" required="" style="margin-top: 20px;">
                                        <input class="text" type="text" name="uid" placeholder="Your Id" required="" style="margin-top: 20px;">
                                        <span style="color: white;padding-right: 1em">Date of Issue </span> <input class="text" type="date" name="dt"  required="" style="margin-top: 20px;">
                                       
                                        <input type="submit" value="Submit" onclick="{return confirm('Are you sure all information are crrectly filled');}">
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
         String a5=request.getParameter("dt");
         String chk="1";
         String cnt="0";
         if(a2!=null)
         {
             String s5="select count(acc_no) from issuebook where mem_id='"+a2+"'";
             PreparedStatement ph=c.prepareStatement(s5);
             ResultSet rc=ph.executeQuery();
            if(rc.next())
            {
              cnt=rc.getString("count(acc_no)");
             
            }
            
         }  
         if(!cnt.equals("4"))
         {
         if(a!=null)
         {
             String s3="select * from book_details where acc_no='"+a+"'";
             PreparedStatement pp=c.prepareStatement(s3);
             ResultSet r=pp.executeQuery();
             while(r.next())
             {
                chk=r.getString("status");
             }
             
             if(chk.equals("0"))  
               response.sendRedirect("errorpage.jsp");
           
         }
         String q;
           if(a!=null  && a1!=null && a2!=null && a3!=null && a4!=null && a5!=null && chk.equals("1"))
           {
            
            String s="insert into issuebook(mem_id,mem_name,acc_no,lib_id,mem_type,issue_date) values(?,?,?,?,?,?)";
            PreparedStatement p=c.prepareStatement(s);
            p.setString(1, a2);
            p.setString(2, a3);
             p.setString(3, a);
              p.setString(4, a4);
               p.setString(5, a1);
                p.setString(6, a5);
                  int m=p.executeUpdate();
                  if(m>0)
                  {
                      String d="update book_details set status=0 where acc_no='"+a+"'";
                      PreparedStatement p1=c.prepareStatement(d);
                       int m1= p1.executeUpdate();
                       if(m1>0)
                    response.sendRedirect("issuesuccess.jsp");
                  }
           }
         
         }
         else
         {
             response.sendRedirect("max_book_issue_error.jsp");
         }
    
%>



