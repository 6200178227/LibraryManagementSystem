

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
          <link rel="stylesheet" type="text/css" href="css_js/indcss.css"> 
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <style>
* {box-sizing: border-box;}
body {font-family: Verdana, sans-serif;}
.mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .text {font-size: 11px}
}

        
        </style>
    </head>
    <body>
        <header>
<div >
    <ul style="float: left">
        <li style="color:white;"><i class="fa fa-book" aria-hidden="true"></i><b>  Library Management System</b></li>
            </ul>
    <ul>
      <li><a href="index.jsp"><i class="fa fa-home" aria-hidden="true"></i> Home</a></li>
      <li><a href="login.jsp"><i class="fa fa-sign-in" aria-hidden="true"></i> Login</a></li>
      <li><a href="signup.jsp"><i class="fa fa-user-plus" aria-hidden="true"></i> Sign-Up</a></li>
      <li><a href="about.jsp"><i class="fa fa-file-text-o" aria-hidden="true"></i> About</a></li>
    
    </ul>
</div>
       </header>
        <br><br>
 <div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="css_js/hd33.jpg" style="width:100%;hight:50%;">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="css_js/slide4.jpg" style="width:100%;hight:50%;">
  
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="css_js/slide55.jpg" style="width:100%;hight:50%;">
  
</div>
</div>
        
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>
<h3 class="h11" style="color:#666666;margin-left: 30px;">Why Need A Library Management System?</h3>
<hr style="width:800px;margin-left: 30px;">

<div class="contt" >
 
    <p style="margin-left:30px;word-spacing: 1.3px;line-height: 25px;font-family: sans-serif;border-left:1px solid black;padding: 14px;">
        
     Libraries are a critical part of an educational institute. Usually, it has to roll out fine but complex tasks to maintain records of the books. When the institute is focusing 
     on delivering quality educational services, a well- managed library is part of the service.
     <br>
     The library management system is a software to manage manual functions of a library. The software helps to manage the entire library operations from maintaining book records 
     to issue a book. In addition, it allows streamlined management of fine details of books such as author name, edition, and many other important details.<br>
     So, it is easier to search for books and find the right materials for students and the librarian.
     The electronic management via the software is essential to track information like issue date, due date, who has borrowed any material, etc. The system is developed and designed with an aim to facilitate efficient management to the schools to manage a modern library with accurate data management. Thus, school management or library head can get all the necessary details electronically without
     A Library management system is a software that uses to maintain the record of the library. It contains work like the number of available books in the library, the number of books are issued or returning or renewing a book or late fine charge record, etc. Library Management Systems is software that helps to maintain a database that is useful to enter new books & record books borrowed by the members, with the respective submission dates. Moreover, it also reduces the manual record burden of the librarian.

     Library management system allows the librarian to maintain library resources in a more operative manner that will help to save their time. It is also convenient for the librarian to manage the process of books allotting and making payment. Library management system is also useful for students as well as a librarian to keep the constant track of the availability of all books in a store.
</p>
</div>



<script>
var slideIndex = 0;
showSlides();

function showSlides() {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>

<footer >
    <p><span style="margin-left:180px;"><i class="fa fa-phone" aria-hidden="true"></i>  Contact us :  1121284516</span>
<mail style="margin-left:500px;"><i class="fa fa-envelope" aria-hidden="true"></i>  ABC@gamil.com</mail></p>
</footer>
  </body>
</html>
