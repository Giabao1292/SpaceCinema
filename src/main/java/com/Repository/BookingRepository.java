/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.Repository;

import com.DTO.Response.BookingResponse;
import com.Model.Booking;
import com.Model.Cart;
import com.Model.SeatItem;
import com.Model.User;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LAPTOP ASUS
 */
public interface BookingRepository {

    int getTotalPriceBooking();

    List<Booking> listUserBooking();

    public int createBooking(User user, Cart cart, double total);

    public boolean updateStatus(int bookingId, String status);

    public void addBookingShowtime(int booking_id, Map<String,SeatItem> seats);
    
    public Map<String, List<BookingResponse>> getBookingResponsesByUser(int userId);
}
