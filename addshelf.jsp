<%-- 
    Document   : addshelf
    Created on : 7 Mar, 2021, 12:36:43 PM
    Author     : user
--%>
<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.entities.User" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>
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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css_js/addinformationcss1.css">
	<link rel="stylesheet" type="text/css" href="css_js/addinformationcss2.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>add shelf info</title>
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
         <div class="container-contact100">
            
          
		<div class="wrap-contact100">
              
                    <form class="contact100-form validate-form" action="" method="post">
                          
				<span class="contact100-form-title">
					Add Shelf Information
				</span>
                           
                            <div class="wrap-input100 input100-select">
					<span class="label-input100">Section</span>
					<div>
						<select class="selection-2" name="sc">
							<option>Select Section</option>
							<option>A</option>
							<option>B</option>
							<option>C</option>
                                                        <option>D</option>
                                                        <option>E</option>
                                                        <option>F</option>
                                                        <option>G</option>
                                                        <option>H</option>
						</select>
					</div>
					<span class="focus-input100"></span>
				</div>
				
                              

				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						<button type="submit" class="contact100-form-btn">
							<span>
								Submit
								<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
							</span>
						</button>
					</div>
				</div>
                            <div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
						
                                                    <a href="menu.jsp" ><span class="contact100-form-btn">
								Back
								<i class="fa fa-long-arrow-right m-l-7" aria-hidden="true"></i>
                                                        </span></a>
						
					</div>
				</div>
			</form>
		</div>
	</div>
    </body>
</html>
<%
    String a=request.getParameter("sc");
    
           if(a!=null)
           {
            Connection c=connectionprovider.getConnection();
            String s="insert into shelf_info(shelf_section) values(?)";
            PreparedStatement p=c.prepareStatement(s);
           
            p.setString(1, a);
            
                  int m=p.executeUpdate();
                  if(m>0)
                  {
                    response.sendRedirect("success2.jsp");
                  }
           }
    
%>