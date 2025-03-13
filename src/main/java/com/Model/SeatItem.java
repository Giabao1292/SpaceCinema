/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

/**
 *
 * @author lebao
 */
public class SeatItem {

    private Seat seat;
    private int quantity;
    private String cinema;
    private String theatre;
    private String movie;
    private String time;
    
    public SeatItem() {
    }

    public SeatItem(Seat seat, int quantity, String cinema, String theatre, String movie, String time) {
        this.seat = seat;
        this.quantity = quantity;
        this.cinema = cinema;
        this.theatre = theatre;
        this.movie = movie;
        this.time = time;
    }

    public SeatItem(Seat seat, int quantity) {
        this.seat = seat;
        this.quantity = quantity;
    }

    public String getCinema() {
        return cinema;
    }

    public void setCinema(String cinema) {
        this.cinema = cinema;
    }

    public String getTheatre() {
        return theatre;
    }

    public void setTheatre(String theatre) {
        this.theatre = theatre;
    }

    public String getMovie() {
        return movie;
    }

    public void setMovie(String movie) {
        this.movie = movie;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Seat getSeat() {
        return seat;
    }

    public void setSeat(Seat seat) {
        this.seat = seat;
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
