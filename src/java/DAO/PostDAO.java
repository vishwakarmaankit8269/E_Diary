/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Pojo_User_Details.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author HP
 */
public class PostDAO {
    
    private Connection conn;
    
    public PostDAO(Connection conn){
        super();
        this.conn=conn;
    }
    
    public  boolean addNotes(String title,String content,int userid){
        boolean f = false;
        try{
            PreparedStatement ps = conn.prepareStatement("insert into post(title,content,userid) values(?,?,?)");
            ps.setString(1,title);
            ps.setString(2,content);
            ps.setInt(3, userid);
            
            int i = ps.executeUpdate();
            
            if(i==1){
                f = true;
                System.out.println("Inserted post");
            }
            
        }catch(Exception e){
            System.out.println("Kuch to gadbad h");
            e.printStackTrace();
        }
        return f;
    }
    
    public ArrayList<Post> getData(int id){
        ArrayList<Post> list = new ArrayList<Post>();
        Post po = null;
        try{
            String que ="select * from post where userid = ? order by postid desc";
            PreparedStatement ps = conn.prepareStatement(que);
            ps.setInt(1, id);
            
            ResultSet rs =ps.executeQuery();
            while(rs.next()){
                po = new Post();
                po.setId(rs.getInt(1));
                po.setTitle(rs.getString(2));
                po.setContent(rs.getString(3));
                po.setPdate(rs.getDate(4));
                po.setPostId(rs.getInt(5));
                
                list.add(po);
            }
        }catch(Exception e){
            
        }
        System.out.println(list);
        
        return list;
    }
    
    public Post getDatabyId(int noteid){
        Post p=null;
        try{
            PreparedStatement ps = conn.prepareStatement("select * from post where postid=?");
            ps.setInt(1, noteid);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                p.setId(rs.getInt(5));
                p.setTitle(rs.getString(2));
                p.setContent(rs.getString(3));
            }
            
        }catch(Exception e){
            
        }
        
        return p;
    }
    public boolean PostUpdate(int nid,String title,String content){
        boolean f = false;
        try{
            PreparedStatement ps =conn.prepareStatement("update post set title=?,content=? where postid=?");
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setInt(3, nid);
          int i =  ps.executeUpdate();
          if(i==1){
              f=true;
          }
          
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return f;
    }
      
    public boolean deleteNotes(int nid){
        boolean f = false;
        try{
            PreparedStatement ps = conn.prepareStatement("delete from post where postid =?");
            ps.setInt(1, nid);
            int i = ps.executeUpdate();
            if(i==1){
                f = true;
                System.out.println("Post deleted successfully!!");
            }
            return f;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    
}
