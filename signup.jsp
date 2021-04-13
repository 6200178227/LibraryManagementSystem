
<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css_js/signupcss.css" rel="stylesheet" type="text/css" media="all" />
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
font-weight: bold;
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
        <title>signup page</title>
    </head>
    <body>
        <header>
<div >

    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
      <li><a href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i>  Login</a></li>
      <li><a href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign-Up</a></li>
      <li><a href=""><i class="fa fa-file-text-o" aria-hidden="true"></i> About</a></li>
    
    </ul>
</div>
       </header>
        
        <div class="main-w3layouts wrapper">
		<h1>SignUp</h1>
		<div class="main-agileinfo">
			<div class="agileits-top">
                               <%
                        String code=request.getParameter("cod");
    String a=request.getParameter("nm");
     String a1=request.getParameter("mob");
      String a2=request.getParameter("usn");
       String a3=request.getParameter("pass");
        String a4=request.getParameter("secq");
         String a5=request.getParameter("san");
          String a6=request.getParameter("ct");
           String a7=request.getParameter("st");
           
                                         if(a2!=null)
                                         {
                                             Connection c1=connectionprovider.getConnection();
                                     String sr="select * from librarian_info where username='"+a2+"'";
                                   PreparedStatement pp=c1.prepareStatement(sr);  
                                   ResultSet rs=pp.executeQuery();
                                         
           if(!(rs.next()) && a!=null  && a1!=null && a2!=null && a3!=null && a4!=null && a5!=null && a6!=null && a7!=null && code.equals("1921"))
           {
            Connection c=connectionprovider.getConnection();
            String s="insert into librarian_info(name,mob_no,username,password,sec_q,sec_ans,l_city,l_state) values(?,?,?,?,?,?,?,?)";
            PreparedStatement p=c.prepareStatement(s);
            p.setString(1, a);
            p.setString(2, a1);
             p.setString(3, a2);
              p.setString(4, a3);
               p.setString(5, a4);
                p.setString(6, a5);
                 p.setString(7, a6);
                  p.setString(8, a7);
                  int m=p.executeUpdate();
                  if(m>0)
                  {
                    response.sendRedirect("success.jsp");
                  }
           }
           else if(code!=null && !code.equals("1921"))
           {
              
            %>
             <h5 id="msg" style="color: maroon;margin-left: 10px;margin-bottom: 5px;font-size: 20px;">please enter correct code...</h5>    
         <%
           }
         
           else
           {
              
            %>
             <h5 id="msg" style="color: maroon;margin-left: 10px;margin-bottom: 5px;font-size: 20px;">This Username has already registered</h5>    
     <%
           }

           }
    
%>
				<form action="" method="post">
                                       <input class="text" type="text" name="cod" placeholder="Code Provided by Institute..." required="">
					<input class="text" type="text" name="nm" placeholder="Name" required="" style="margin-top: 20px;">
                                        <input class="text" type="text" name="mob" placeholder="Mobile Number" required="" style="margin-top: 20px;">
					<input class="text" type="text" name="usn" placeholder="Username" required="" style="margin-top: 20px;">
                                       
					<input class="text w3lpass" type="password" name="pass" placeholder="Password" required="" style="margin-top: 20px;">
                                        <span style="color:white;">Select Security Question  </span><select class="tex" name="secq" >
							
							<option>Your NickName?</option>
							<option>Your Lucky Number?</option>
							<option>Your child SuperHero?</option>
                                                        <option>Your childhood Name?</option>
				        </select>
                                        <input class="text" type="text" name="san" placeholder="Security answer" required="" style="margin-top: 20px;">
                                        <input class="text" type="text" name="ct" placeholder="City" required="" style="margin-top: 20px;">
                                        <input class="text" type="text" name="st" placeholder="State" required="" style="margin-top: 20px;">
					<input type="submit" value="SIGNUP" onclick="{return confirm('Are you sure all information are crrectly filled');}">
				</form>
                            <p><a href="login.jsp"> Login Now!</a></p><br><br>
                                <p><a href="index.jsp"> Back To Home</a></p>
			
  


</div>
		</div>
  </body>
</html>


