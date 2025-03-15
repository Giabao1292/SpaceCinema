/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author lebao
 */
public class SnackItem {
    private Snack snack;
    private int quantity;
    private String cinema;

    public SnackItem() {
    }

    public String getCinema() {
        return cinema;
    }

    public void setCinema(String cinema) {
        this.cinema = cinema;
    }

    public SnackItem(Snack snack, int quantity, String cinema) {
        this.snack = snack;
        this.quantity = quantity;
        this.cinema = cinema;
    }

    public SnackItem(Snack snack, int quantity) {
        this.snack = snack;
        this.quantity = quantity;
    }

    public Snack getSnack() {
        return snack;
    }

    public void setSnack(Snack snack) {
        this.snack = snack;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public void increaseQuantity(int quantity){
        this.quantity += quantity;
    }
}
