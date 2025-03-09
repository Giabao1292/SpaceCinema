/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author lebao
 */
public class Snack {

    private String id;
    private String snack_type;
    private String snack_name;
    private double price;
    private String poster_image;

    public Snack() {
    }

    public Snack(String id, String snack_type, String snack_name, double price, String poster_image) {
        this.id = id;
        this.snack_type = snack_type;
        this.snack_name = snack_name;
        this.price = price;
        this.poster_image = poster_image;
    }

    public String getPoster_image() {
        return poster_image;
    }

    public void setPoster_image(String poster_image) {
        this.poster_image = poster_image;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSnack_type() {
        return snack_type;
    }

    public void setSnack_type(String snack_type) {
        this.snack_type = snack_type;
    }

    public String getSnack_name() {
        return snack_name;
    }

    public void setSnack_name(String snack_name) {
        this.snack_name = snack_name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
