/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import java.util.List;

/**
 *
 * @author lebao
 */
public class User {

    private int id;
    private String userName;
    private String fullName;
    private String passWord;
    private String email;
    private String phone;
    private int status;
    private List<Role> role;
    
    public User(int id, String userName, String fullName, String passWord, String email, String phone, int status, List<Role> role) {
        this.id = id;
        this.userName = userName;
        this.fullName = fullName;
        this.passWord = passWord;
        this.email = email;
        this.phone = phone;
        this.status = status;
        this.role = role;
    }
    
    
    public User() {
    }

    public static boolean isAdmin(List<Role> role) {
        for (Role tmp : role) {
            if (tmp.getCode().equals("ADMIN")) {
                return true;
            }
        }
        return false;
    }

    public static boolean isUser(List<Role> role) {
        for (Role tmp : role) {
            if (tmp.getCode().equals("USER")) {
                return true;
            }
        }
        return false;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

   

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<Role> getRole() {
        return role;
    }

    public void setRole(List<Role> role) {
        this.role = role;
    }

}
