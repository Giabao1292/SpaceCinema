/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.Repository;

import com.Model.Booking;
import com.Model.Cart;
import com.Model.User;
import java.util.List;

/**
 *
 * @author LAPTOP ASUS
 */
public interface BookingRepository {

    int getTotalPriceBooking();

    List<Booking> listUserBooking();

    public int createBooking(User user, Cart cart, double total);

    public boolean updateStatus(int bookingId, String status);
}
