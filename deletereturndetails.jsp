<%-- 
    Document   : deletereturndetails
    Created on : 21 Mar, 2021, 5:07:19 PM
    Author     : user
--%>


<%@page import="java.sql.*" %>
<%@page import="com.librarymanagement.helper.connectionprovider" %>
<%
     Connection c=connectionprovider.getConnection();
        Statement st=c.createStatement();
                  String  u1=request.getParameter("u1");                   
            String s="delete from returnbook where return_id='"+u1+"'";
          
            st.executeUpdate(s);
            response.sendRedirect("returndetails.jsp");
    %>