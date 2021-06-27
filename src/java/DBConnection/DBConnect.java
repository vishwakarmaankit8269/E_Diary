/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author HP
 */
public class DBConnect {
    
    private static Connection conn;
    
    public static Connection getConn(){
        try{
            if(conn==null){
                Class.forName("oracle.jdbc.OracleDriver");
                System.out.println("Driver Loaded Successfully");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@//Ankit:1521/xe","enotes","enotes");
                System.out.println("Connected Success fully to DB");
            }
        }catch(Exception e ){
            e.printStackTrace();
        }
        
        return conn;
    }
    
    
}
