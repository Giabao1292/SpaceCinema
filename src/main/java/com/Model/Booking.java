/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author LAPTOP ASUS
 */
public class Booking {
    private int id;
    private int user_id;
    private String user_name;
    private String email;
    private int price;
    private int numBooking;

    public Booking() {
    }

    public Booking(int id, int user_id, String email, int price) {
        this.id = id;
        this.user_id = user_id;
        this.email = email;
        this.price = price;
    }

    public Booking(int id, int user_id, String user_name, String email, int price, int numBooking) {
        this.id = id;
        this.user_id = user_id;
        this.user_name = user_name;
        this.email = email;
        this.price = price;
        this.numBooking = numBooking;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getNumBooking() {
        return numBooking;
    }

    public void setNumBooking(int numBooking) {
        this.numBooking = numBooking;
    }
    
    
}
