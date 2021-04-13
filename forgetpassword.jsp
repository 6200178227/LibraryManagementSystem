<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="css_js/signupcss.css" rel="stylesheet" type="text/css" media="all" />
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>forget password</title>
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
      <li><a href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
      <li><a href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign-Up</a></li>
      <li><a href=""><i class="fa fa-file-text-o" aria-hidden="true"></i> About</a></li>
    
    </ul>
</div>
       </header>
         <div class="main-w3layouts wrapper">
		<h1>Get Password</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
                            
				<form action="" method="post">
					<input class="text" type="text" name="usn" placeholder="Username" required="" style="margin-top: 20px;margin-bottom: 20px">
                                         <span style="color:white;">Select Security Question  </span><select class="tex" name="secq" >
							
							<option>Your NickName?</option>
							<option>Your Lucky Number?</option>
							<option>Your child SuperHero?</option>
                                                        <option>Your childhood Name?</option>
				        </select>
                                        <input class="text" type="text" name="san" placeholder="Security answer" required="" style="margin-top: 20px;">
                                       
					<input type="submit" value="Submit" >
                                        <%
    Connection c=connectionprovider.getConnection();
    String a=request.getParameter("usn");
     String a1=request.getParameter("secq");
      String a2=request.getParameter("san");
      
       Statement p=null;
                     ResultSet r=null;
                     p=c.createStatement();
                     String s1;
           if(a!=null  && a1!=null && a2!=null)
           {
            
            String s="select * from librarian_info where username='"+a+"' and sec_q='"+a1+"' and sec_ans='"+a2+"'";
             r=p.executeQuery(s);
            
                  if(r.next())
                  {
                   %> 
                     
                   <span style="color: white;">Your Password is :-</span><input type="text" value='<%=r.getString("password")%>'>
                  
                   <%
                       }
                       else
                       {
                       %>
                 <h5 style="text-align:center;"><span style="color:maroon">Please enter correct data..</span></h5>
                 <%
                     }
}
%>

				</form>
                       <br><br><br> <p><a href="login.jsp"> <span style="font-size: 30px">Login Now?</span></a></p><br><br>
                               
			</div>
		</div>
                
    </body>
</html>

