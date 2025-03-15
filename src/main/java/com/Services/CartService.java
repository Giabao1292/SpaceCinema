/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Services;

import com.Model.Cart;
import com.Model.Seat;
import com.Model.Snack;

/**
 *
 * @author lebao
 */
public interface CartService {

    public void addSnack(Cart cart, Snack snack, int quantity, String cinema) ;

    public void updateSnack(Cart cart, String snackId, int quantity);

    public void deleteSnack(Cart cart, String snackId);
    public void addSeat(Cart cart, Seat seat, int quantity, String movie, String cinema, String time, String theatre);

    public void updateSeat(Cart cart, String seatId, int quantity);

    public void deleteSeat(Cart cart, String seatId);
}
