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
public class Voucher {

    private int id;
    private String name;
    private String description;
    private int discount;
    private List<User> users;
    private int numUsers;
    
    public Voucher() {
    }

    public Voucher(int id, String name, String description, int discount) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.discount = discount;
    }

    public Voucher(int id, String name, String description, int discount, List<User> users, int numUsers) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.discount = discount;
        this.users = users;
        this.numUsers = numUsers;
    }

    

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public int getNumUsers() {
        return numUsers;
    }

    public void setNumUsers(int numUsers) {
        this.numUsers = numUsers;
    }
}
