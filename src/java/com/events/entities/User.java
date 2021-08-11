
package com.events.entities;
import java.sql.*;


public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private Timestamp dateTime;

    public User(int id, String name, String email, String password, Timestamp dateTime) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.dateTime = dateTime;
    }

    public User() {
    }

    public User(String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;
    }
//    getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }
    
    
    
    
}
