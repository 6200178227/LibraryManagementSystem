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
<%
     Connection c=connectionprovider.getConnection();
        Statement st=c.createStatement();
                  String  u1=request.getParameter("u1");                   
            String s="delete from book_details where acc_no='"+u1+"'";
          
            st.executeUpdate(s);
            response.sendRedirect("bookdetails.jsp");
    %>