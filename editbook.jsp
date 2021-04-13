
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
        <title>Edit Book</title>
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
      <li><a href="bookdetails.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i> back</a></li>
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
                                   
            String s="select * from book_details where acc_no='"+u+"'";
          
           ResultSet r= st.executeQuery(s);
           while(r.next())
           {
                                    %>

                                    <input type="hidden" name="acc" value='<%=r.getString("acc_no")%>'>
			

				<div class="wrap-input100 validate-input" >
					<span class="label-input100">ISBN</span>
					<input class="input100" type="text" name="isbn" value='<%=r.getString("isbn")%>'>
					<span class="focus-input100"></span>
				</div>
                           
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">Title</span>
					<input class="input100" type="text" name="tit" value='<%=r.getString("title")%>'>
					<span class="focus-input100"></span>
				</div>
                          
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">Author
                                        </span>
					<input class="input100" type="text" name="aut" value='<%=r.getString("author")%>'>
					<span class="focus-input100"></span>
				</div>
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">Edition</span>
					<input class="input100" type="text" name="ed" value='<%=r.getString("edition")%>'>
					<span class="focus-input100"></span>
				</div>
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">Publication Year</span>
					<input class="input100" type="text" name="pub" value='<%=r.getString("publication_date")%>'>
					<span class="focus-input100"></span>
				</div>
                            <div class="wrap-input100 validate-input" >
					<span class="label-input100">Category</span>
					<input class="input100" type="text" name="cat" value='<%=r.getString("category")%>'>
					<span class="focus-input100"></span>
				</div>
                             <div class="wrap-input100 validate-input" >
					<span class="label-input100">Price</span>
					<input class="input100" type="text" name="prc" value='<%=r.getString("price")%>'>
					<span class="focus-input100"></span>
				</div>
                                        
                              <div class="wrap-input100 validate-input" >
					<span class="label-input100">Shelf Id</span>
					<input class="input100" type="text" name="sid" value='<%=r.getString("shelf_id")%>'>
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
    String a1=request.getParameter("acc");
    String a2=request.getParameter("isbn");
    String a3=request.getParameter("tit");
    String a4=request.getParameter("aut");
    String a5=request.getParameter("ed");
    String a6=request.getParameter("pub");
    String a7=request.getParameter("cat");
      String a8=request.getParameter("prc");
    String a9=request.getParameter("sid");
   
    
    if(a1!=null && a2!=null && a3!=null && a4!=null && a5!=null && a6!=null && a7!=null  && a8!=null && a9!=null   )
    {
        String  q="update book_details set isbn=?,title=?,author=?,edition=?,publication_date=?,category=?,price=?,shelf_id=? where acc_no='"+a1+"'";
         
        PreparedStatement p1=c.prepareStatement(q);
           
            p1.setString(1, a2);
             p1.setString(2, a3);
              p1.setString(3, a4);
               p1.setString(4, a5);
                p1.setString(5, a6);
                 p1.setString(6, a7);
                  p1.setString(7, a8);
                   p1.setString(8, a9);
                  int m1= p1.executeUpdate();
                   response.sendRedirect("edsuccessb.jsp");
    }
%>
    