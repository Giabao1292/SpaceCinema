/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Services.impl;

import com.Model.Cart;
import com.Model.Seat;
import com.Model.Snack;
import com.Services.CartService;

/**
 *
 * @author lebao
 */
public class CartServiceImpl implements CartService {

    @Override
    public void addSnack(Cart cart, Snack snack, int quantity, String cinema) {
        cart.addSnack(snack, quantity, cinema);
    }

    @Override
    public void updateSnack(Cart cart, String snackId, int quantity) {
        cart.updateSnack(snackId, quantity);
    }

    @Override
    public void deleteSnack(Cart cart, String snackId) {
        cart.clearSnack(snackId);
    }

    @Override
    public void addSeat(Cart cart, Seat seat, int quantity, String movie, String cinema, String time, String theatre){
        cart.addSeat(seat, quantity, cinema, movie, theatre, time);
    }

    @Override
    public void updateSeat(Cart cart, String seatId, int quantity){
        cart.updateSeat(seatId, quantity);
    }

    @Override
    public void deleteSeat(Cart cart, String seatId){
        cart.clearSeat(seatId);
    }
}
