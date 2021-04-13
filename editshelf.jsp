<%@page import="com.librarymanagement.entities.User" %>
<%@page import="java.sql.*" %>
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
        <title>Edit Shelf</title>
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
      <li><a href="shelfdetails.jsp"><i class="fa fa-file-text-o" aria-hidden="true"></i> back</a></li>
      <li><a href="LogoutServlet"><i class="fa fa-sign-in" aria-hidden="true"></i> Logout</a></li>
    
    </ul>
</div>
       </header>
        <div class="container-contact100">
            
          
		<div class="wrap-contact100">
                    
                    <form class="contact100-form validate-form" action="" method="post">
                          
				<span class="contact100-form-title">
					Edit Book Information
				</span>
                                <%
                                     Connection c=connectionprovider.getConnection();
                                       Statement st=c.createStatement();
                                     String  u=request.getParameter("u");
                                   
            String s="select * from shelf_info where shelf_no='"+u+"'";
          
           ResultSet r= st.executeQuery(s);
           while(r.next())
           {
                                    %>

                                    <input type="hidden" name="sid" value='<%=r.getString("shelf_no")%>'>
			

				<div class="wrap-input100 validate-input" >
					<span class="label-input100">Section</span>
					<input class="input100" type="text" name="sc" value='<%=r.getString("shelf_section")%>'>
					<span class="focus-input100"></span>
				</div>
                           
                           
                        <%
                            }
                            %>
                            
				<div class="container-contact100-form-btn">
					<div class="wrap-contact100-form-btn">
						<div class="contact100-form-bgbtn"></div>
                                                <button type="submit" class="contact100-form-btn" >
							<span>
								Update
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
    String a1=request.getParameter("sid");
    String a2=request.getParameter("sc");
   
    
    if(a1!=null && a2!=null )
    {
        String  q="update shelf_info set shelf_section=? where shelf_no='"+a1+"'";
         
        PreparedStatement p1=c.prepareStatement(q);
           
            p1.setString(1, a2);
             
              
               
                  int m1= p1.executeUpdate();
                   response.sendRedirect("success2.jsp");
    }
%>
    