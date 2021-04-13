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
        <title>fine</title>
    </head>
    <body style="background-color: #cccccc">
        <div style="box-shadow: 10px 5px #003333;width: 400px;height: 200px;background-color:rgba(1,1,0,0.1) ;border: black solid 10px;padding: 30px;margin-left: 450px;margin-top: 150px">
            <h1 style="text-align:center;text-decoration: underline">Fine!</h1>
            <h2 style="text-align:center;"><span style="color:#084cc3"><%=request.getAttribute("name")%></span> has to Pay</h2>
            <h3 style="text-align:center;">Rs. <span style="color:#084cc3"><%=request.getAttribute("fine")%></span></h3>
            <p style="margin-left:160px;background-color:red;width: 80px;height: 23px;border: black solid 3px;text-align: center;"><a href="menu.jsp" style="text-decoration:none;color: black;"> Back</a></p>
        </div>
    </body>
</html>
