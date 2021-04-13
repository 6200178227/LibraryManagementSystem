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
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    

    <title>dashbar</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="css_js/templatemo-style.css" />
  
   <style>
             .grid{
             display: grid;
             grid-template-colums:auto auto auto;
             grid-template-row:auto auto;
             grid-gap:50px;
             paddind:10px;
             }
             .grid > div{
                 
             }
             </style>
  </head>
    
<body>
    <div id="page-wraper">
     
      <div class="responsive-nav">
        <i class="fa fa-bars" id="menu-toggle"></i>
        <div id="menu" class="menu">
          <i class="fa fa-times" id="menu-close"></i>
          <div class="container">
            
            <div class="author-content">
                <h4 style="font-size:20px;"><i class="fa fa-user-circle" aria-hidden="true"></i> <%= user.getName() %></h4>
            </div>
            <nav class="main-nav" role="navigation">
              <ul class="main-menu">
                <li><a href="profile.jsp">My profile</a></li>
                <li><a href="#jj">Entry</a></li>		
                <li><a href="#jj1">Record</a></li>
				 <li><a href="issuebook.jsp">Book Issue</a></li>
				  <li><a href="returnbook.jsp">Book Return </a></li>
				   <li><a href="#jj2">Statistics</a></li>
                                    <li><a href="LogoutServlet">Logout</a></li>
              </ul>
            </nav>
            
            <div class="copyright-text">
              <p>Copyright 2019 Reflux Design</p>
            </div>
          </div>
        </div>
      </div>

      <section class="section about-me" data-section="section1">
        <div class="container">
          <div class="section-heading">
            <h2 style="color:#cc0000;">WELCOME !</h2>
            <div class="line-dec"></div>
            <span style="color:#00ffff;font-size: 50px;">
                <b>
                    <%= user.getName() %> </b>
            </span>
            <p>To the  Library Management System.</p>
            <p>Now , you don't worry about how to manage registers.</p>
            <p>We are here to help you</p>
          </div>
          
         
        </div>
      </section>
            
      <section class="section my-services" data-section="section2" id="jj">
        <div class="container">
          <div class="section-heading">
              <p style="margin-left:150px;color: #333333;font-size: 35px;font-weight: 20px;"><b>Data Entry</b></p>
            <div class="grid" style="grid-auto-flow: column;">
                <a href="addBook.jsp"><div style="background-color:#999999;opacity: 0.6;width:210px;height: 110px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                <figure>
                     <img src="css_js/second.png" style="width: 40px;height: 40px;">
                    <figcaption> <p style="color:black;"><b>Add Book</b></p></figcaption>
                </figure>
                    </div></a>
                   <a href="addshelf.jsp"><div style="background-color:#3366ff;opacity: 0.6;width:210px;height: 110px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                 <figure>
                    <img src="css_js/cbook.jpg" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"><b>Add Shelf</b></p></figcaption>
                    </figure>
                    </div></a>
                 
                
            </div>
            <div class="grid" style="grid-auto-flow: column; margin-top: 20px;" >
                <a href="addstudent.jsp"><div style="background-color:#cc0099;opacity: 0.6;width:210px;height: 110px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                    <figure>
                    <img src="css_js/fourth.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"> <b>Add Student</b></p></figcaption>
                    </figure>
                    </div></a>
                     <a href="addfaculty.jsp"> <div style="background-color:#009999;opacity: 0.6;width:210px;height: 110px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                   <figure>
                    <img src="css_js/fourth.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"> <b>Add Faculty</b></p></figcaption>
                    </figure>
                </div>
            </div>
               <div class="grid" style="grid-auto-flow: column;margin-top: 20px; margin-left: 220px;">
                   <a href="addsupplier.jsp"> <div style="background-color:#b8ad63;opacity: 0.6;width:210px;height: 110px; text-align: center;padding: 3px;margin-left: -120px;margin-top: 25px;">
                    <figure>
                    <img src="css_js/fourth.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"> <b>Add Suppliers</b></p></figcaption>
                    </figure>
                       </div></a>
                 
            </div>
          </div>
        </div>
      </section>

      
<section class="section my-services" data-section="section2" id="jj1">
        <div class="container">
          <div class="section-heading">
              <p style="margin-left:120px;color: #003333;font-size: 35px;font-weight: 20;"><b>Records</b></p>
            <div class="grid" style="grid-auto-flow: column;">
                <a href="bookdetails.jsp"><div style="background-color:#00cccc;opacity: 0.6;width:210px;height: 105px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                <figure>
                     <img src="css_js/fifth.png" style="width: 40px;height: 40px;">
                    <figcaption> <p style="color:black;"><b>Book</b></p></figcaption>
                </figure>
                    </div></a>
                <a href="shelfdetails.jsp"><div style="background-color:#990099;opacity: 0.6;width:210px;height: 105px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                 <figure>
                    <img src="css_js/cbook.jpg" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"><b>Shelf</b></p></figcaption>
                    </figure>
                    </div></a>
                 
                
            </div>
            <div class="grid" style="grid-auto-flow: column; margin-top: 20px;" >
                <a href="studentdetails.jsp"><div style="background-color:#666600;opacity: 0.6;width:210px;height: 105px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                    <figure>
                    <img src="css_js/seventh.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"> <b>Student</b></p></figcaption>
                    </figure>
                    </div></a>
                <a href="facultydetails.jsp"> <div style="background-color:#009966;opacity: 0.6;width:210px;height: 105px; text-align: center;padding: 3px;margin-left: 150px;margin-top: 25px;">
                   <figure>
                    <img src="css_js/seventh.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"> <b>Faculty</b></p></figcaption>
                    </figure>
                </div>
            </div>
               <div class="grid" style="grid-auto-flow: column;margin-top: 20px; margin-left: 220px;">
                   <a href="supplierdetails.jsp"> <div style="background-color:#ff6666;opacity: 0.6;width:210px;height: 105px; text-align: center;padding: 3px;margin-left: -120px;margin-top: 25px;">
                    <figure>
                    <img src="css_js/seventh.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"> <b>Suppliers</b></p></figcaption>
                    </figure>
                       </div></a>
                 
            </div>
        </div>
        </div>
      </section>

      
            <section class="section my-services" data-section="section2" id="jj2">
        <div class="container">
          <div class="section-heading">
              <p style="margin-left:100px;color: #006666;font-size: 45px; font-weight: 20px;"><b>Records</b></p>
            <div class="grid" style="grid-auto-flow: column;">
                <figure> <a href="issuedetails.jsp"><div style="background-color:#ff6666;opacity: 0.6;width:400px;height: 130px; text-align: center;padding: 3px;margin-left: 200px;margin-top: 25px;">
                
                     <img src="css_js/rbook.png" style="width: 40px;height: 40px;">
                     
                    <figcaption> <p style="color:black;"><b>Issue Book Details</b></p></figcaption>
                </figure>
                    </div></a>
                    <a href="returndetails.jsp"><div style="background-color:#339900;opacity: 0.6;width:400px;height: 130px; text-align: center;padding:3px; margin-left: 240px;margin-top: 25px;">
                 <figure>
                    <img src="css_js/tenth.png" style="width: 40px;height: 40px;">
                    <figcaption><p style="color:black;"><b>Return Book Details</b></p></figcaption>
                    </figure>
                    </div></a>
                 
                
            </div>
           
               
        </div>
        </div>
      </section>


            
            
      </div>  
  
  </body>