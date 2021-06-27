/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Pojo_User_Details.UserDetails;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author HP
 */
public class UserDAO {
     private Connection conn;
    
    public UserDAO(Connection conn){
        super();
        this.conn = conn;
    }
    
    public boolean addUser(UserDetails user){
        boolean f = false;
        int i ;
        try{
            //String query = "insert into users(name,email,password) VALUES (?,?,?)";
            PreparedStatement ps = conn.prepareStatement("insert into users(name,email,password) VALUES (?,?,?)");
//            ps.setInt(0,user.getUserId());
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            i = ps.executeUpdate();
            
            if(i==1){
                f = true;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    public UserDetails loginUser(UserDetails user){
       UserDetails us = null;
        try{
        PreparedStatement ps = conn.prepareStatement("select * from users where email=? and password= ?");
        ps.setString(1, user.getEmail());
        ps.setString(2, user.getPassword());
        ResultSet rs = ps.executeQuery();
        
        if(rs.next()){
            us = new UserDetails();
            us.setId(rs.getInt("id"));
            us.setName(rs.getString("name"));
            us.setEmail(rs.getString("email"));
            us.setPassword("password");
            
        }
       
        

        
        }catch(Exception e){
            e.printStackTrace();
        }
        return us;
        
    }
     
    
}
