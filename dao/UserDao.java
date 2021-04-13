/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.librarymanagement.dao;
import com.librarymanagement.entities.User;
import java.sql.*;
public class UserDao {
   private Connection con;
   public UserDao(Connection con)
   {
       this.con=con;
   }
    public User getUserByidpass(String user,String pass)
    {
        User use=null;
        try
        {
            String s="select * from librarian_info where username=? and password=?";
            PreparedStatement p=con.prepareStatement(s);
            p.setString(1,user);
             p.setString(2,pass);
            ResultSet r= p.executeQuery();
            if(r.next())
            {
              use=new User();
              use.setId(r.getInt("lib_id"));
              use.setMobile(r.getString("mob_no"));
              use.setUsername(r.getString("username"));
              use.setPassword(r.getString("password"));
              use.setSec_qu(r.getString("sec_q"));
              use.setSec_ans(r.getString("sec_ans"));
              use.setCity(r.getString("l_city"));
              use.setState(r.getString("l_state"));
              use.setName(r.getString("name"));
            }
            
        }
        catch(Exception e)
        {
            
        }
        return use;
    }
}
