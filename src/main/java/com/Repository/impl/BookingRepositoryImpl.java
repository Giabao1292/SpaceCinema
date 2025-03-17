/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Booking;
import com.Repository.BookingRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author LAPTOP ASUS
 */
public class BookingRepositoryImpl implements BookingRepository {

    @Override
    public int getTotalPriceBooking() {
        String sql = "SELECT SUM(total_price) AS total_booking_fee FROM spacecinema.booking;";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total_booking_fee");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Booking> listUserBooking() {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT u.username, u.email, SUM(b.total_price) AS total_booking_fee\n"
                + "FROM booking b\n"
                + "JOIN user u ON b.user_id = u.user_id\n"
                + "GROUP BY u.user_id\n"
                + "ORDER BY total_booking_fee DESC;";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setUser_name(rs.getString("username"));
                booking.setEmail(rs.getString("email"));
                booking.setPrice(rs.getInt("total_booking_fee"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
