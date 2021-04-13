/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.librarymanagement.helper;

import java.sql.*;
public class connectionprovider {
   public static Connection con;
   public static Connection getConnection()
   {
      
       try
       {
           
         Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql:///library_management","root","");
           
       }
       catch(Exception e)
               {
                 e.printStackTrace();
               }
              return con;
   }
}
