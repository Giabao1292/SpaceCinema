/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DTO.Response;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class BookingResponse {
    private List<BookingSeatDTO> bookingSeats;
    private List<BookingSnackDTO> bookingSnacks;

    public BookingResponse() {
        bookingSeats = new ArrayList<>();
        bookingSnacks = new ArrayList<>();
    }

    public BookingResponse(List<BookingSeatDTO> bookingSeats, List<BookingSnackDTO> bookingSnacks) {
        this.bookingSeats = bookingSeats;
        this.bookingSnacks = bookingSnacks;
    }

    public List<BookingSeatDTO> getBookingSeats() {
        return bookingSeats;
    }

    public void setBookingSeats(List<BookingSeatDTO> bookingSeats) {
        this.bookingSeats = bookingSeats;
    }

    public List<BookingSnackDTO> getBookingSnacks() {
        return bookingSnacks;
    }

    public void setBookingSnacks(List<BookingSnackDTO> bookingSnacks) {
        this.bookingSnacks = bookingSnacks;
    }

    
}
