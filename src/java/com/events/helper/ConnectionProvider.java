
package com.events.helper;
import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if (con==null)
            {
                //driver class load
            Class.forName("com.mysql.jdbc.Driver");
            //cretae connection
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/eventportal","root","Mayankumarai@89");
            }
            
            
            
            
            
        }catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
    
 }
    
