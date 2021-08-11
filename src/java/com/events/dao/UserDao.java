
package com.events.dao;
import java.sql.*;
import com.events.entities.User;

public class UserDao {
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
//to insert data to database

public boolean saveUser(User user){
    boolean f=false;
    try{
        //user-------->database
        
        String query="insert into user(name,email,password) values(?,?,?)";
        PreparedStatement pstmt=this.con.prepareStatement(query);
        pstmt.setString(1, user.getName());
        pstmt.setString(2,user.getEmail());
        pstmt.setString(3,user.getPassword());
        
        pstmt.executeUpdate();
        f=true;
        
    
    }catch(Exception e){
        e.printStackTrace();
    }
    return f;
    
}    
    
}
