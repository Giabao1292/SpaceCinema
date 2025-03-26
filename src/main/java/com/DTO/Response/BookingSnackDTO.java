/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DTO.Response;

/**
 *
 * @author lebao
 */
public class BookingSnackDTO {
    private String cinemaName;
    private String snackName;
    private int quantity;
    private double price;

    public BookingSnackDTO() {
    }

    public BookingSnackDTO(String cinemaName, String snackName, int quantity, double price) {
        this.cinemaName = cinemaName;
        this.snackName = snackName;
        this.quantity = quantity;
        this.price = price;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    
    public String getSnackName() {
        return snackName;
    }

    public void setSnackName(String snackName) {
        this.snackName = snackName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
