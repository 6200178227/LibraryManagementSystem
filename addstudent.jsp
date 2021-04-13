
<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>

<%@page import="com.librarymanagement.entities.User" %>
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
        <title>Add Member</title>
        <link rel="stylesheet" type="text/css" href="css_js/addinformationcss1.css">
	<link rel="stylesheet" type="text/css" href="css_js/addinformationcss2.css">
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
                 
			<form class="contact100-form validate-form">
                          
				<span class="contact100-form-title">
					Add Student Information
				</span>

				<div class="wrap-input100 validate-input" >
					<span class="label-input100">Name</span>
					<input class="input100" type="text" name="name" placeholder="Enter name" required="">
					<span class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input" >
					<span class="label-input100">Scholar Number</span>
					<input class="input100" type="text" name="sch" placeholder="Enter scholar number" required="">
					<span class="focus-input100"></span>
				</div>
                              <div class="wrap-input100 validate-input" >
					<span class="label-input100">Course</span>
					<input class="input100" type="text" name="crs" placeholder="Enter course" required="">
					<span class="focus-input100"></span>
				</div>
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">Session Start Year</span>
					<input class="input100" type="text" name="ssn" placeholder="Enter start of the session" required="">
					<span class="focus-input100"></span>
				</div>
                           <div class="wrap-input100 validate-input" >
					<span class="label-input100">Session End Year</span>
					<input class="input100" type="text" name="esn" placeholder="Enter  end of the session" required="">
					<span class="focus-input100"></span>
				</div>
				<div class="wrap-input100 validate-input" >
					<span class="label-input100">Mobile Number</span>
					<input class="input100" type="text" name="mob" placeholder="Enter mobile number" required="">
					<span class="focus-input100"></span>
				</div>
                            <h5> PERMANENT ADDRESS</h5><br>
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">City</span>
					<input class="input100" type="text" name="ct" placeholder="Enter city name" required="">
					<span class="focus-input100"></span>
				</div>
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">State</span>
					<input class="input100" type="text" name="st" placeholder="Enter state name" required="">
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
        String a=request.getParameter("sch");
    String a1=request.getParameter("name");
 
      String a2=request.getParameter("crs");
       String a3=request.getParameter("ssn");
        String a4=request.getParameter("esn");
         
          String a5=request.getParameter("ct");
           String a6=request.getParameter("st");
           String a7=request.getParameter("mob");
           if(a!=null  && a1!=null && a2!=null && a3!=null && a4!=null && a5!=null && a6!=null && a7!=null)
           {
            Connection c=connectionprovider.getConnection();
            String s="insert into student_info(sch_no,sname,course,session_start,session_end,s_city,s_state,mob) values(?,?,?,?,?,?,?,?)";
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
                    response.sendRedirect("success2.jsp");
                  }
           }
    
%>