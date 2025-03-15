/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import java.util.HashMap;
import java.util.Map;

public class Cart {

    private Map<String, SeatItem> seats = new HashMap<>();
    private Map<String, SnackItem> snacks = new HashMap<>();

    public Map<String, SeatItem> getSeats() {
        return seats;
    }

    public void setSeats(Map<String, SeatItem> seats) {
        this.seats = seats;
    }

    public Map<String, SnackItem> getSnacks() {
        return snacks;
    }

    public void setSnacks(Map<String, SnackItem> snacks) {
        this.snacks = snacks;
    }

    public Cart() {
        this.seats = new HashMap<>();
    }

    public void addSeat(Seat seat, int quantity, String cinema, String movie, String theatre, String time) {
        String seatId = seat.getId();
        if (seats.containsKey(seatId)) {
            seats.get(seatId).increaseQuantity(quantity);
        } else {
            seats.put(seatId, new SeatItem(seat, quantity, cinema, theatre, movie, time));
        }
    }

    public void updateSeat(String seatId, int quantity) {
        if (seats.containsKey(seatId)) {
            if (quantity > 0) {
                seats.get(seatId).setQuantity(quantity);
            } else {
                seats.remove(seatId);
            }
        }
    }

    public void clearSeat(String seatId) {
        seats.remove(seatId);
    }

    public double getTotalPriceSeat() {
        double total = 0.0;
        for (SeatItem item : seats.values()) {
            total += item.getSeat().getPrice() * item.getQuantity();
        }
        return total;
    }

    public Map<String, SeatItem> getSeat() {
        return seats;
    }

    public void addSnack(Snack snack, int quantity, String cinema) {
        String snackId = snack.getId();
        if (snacks.containsKey(snackId)) {
            snacks.get(snackId).increaseQuantity(quantity);
        } else {
            snacks.put(snackId, new SnackItem(snack, quantity, cinema));
        }
    }

    public void updateSnack(String snackId, int quantity) {
        if (snacks.containsKey(snackId)) {
            if (quantity > 0) {
                snacks.get(snackId).setQuantity(quantity);
            } else {
                snacks.remove(snackId);
            }
        }
    }

    public void clearSnack(String snackId) {
        snacks.remove(snackId);
    }

    public double getTotalPriceSnack() {
        double total = 0.0;
        for (SnackItem item : snacks.values()) {
            total += item.getSnack().getPrice() * item.getQuantity();
        }
        return total;
    }

    public Map<String, SnackItem> getSnack() {
        return snacks;
    }
}
