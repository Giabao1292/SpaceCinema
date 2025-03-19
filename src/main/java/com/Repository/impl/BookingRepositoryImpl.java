/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Booking;
import com.Model.Cart;
import com.Model.SeatItem;
import com.Model.SnackItem;
import com.Model.User;
import com.Repository.BookingRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        String sql = "SELECT u.username, u.email, SUM(b.total_price) AS total_booking_fee, COUNT(b.booking_id) AS total_bookings\n"
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
                booking.setNumBooking(rs.getInt("total_bookings"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }

    @Override
    public int createBooking(User user, Cart cart, double total) {
        String sql = "INSERT INTO booking (user_id, total_price, created_datetime, status) VALUES (?, ?, NOW(), ?)";
        int bookingId = -1;
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, user.getId());
            stmt.setDouble(2, total);
            stmt.setString(3, "Pending");
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet rs = stmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        bookingId = rs.getInt(1);
                    }
                }
            }
            if (bookingId != -1) {
                if (cart.getSnacks().size() > 0) {
                    int a = createBookingSnack(cart.getSnacks(), bookingId);
                }
                if (cart.getSeats().size() > 0) {
                    int b = createBookingSeat(cart.getSeats(), bookingId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingId;
    }

    public int createBookingSnack(Map<String, SnackItem> snacks, int booking_id) {
        String sql = "INSERT INTO booking_snack(snack_id, snack_qty, status, booking_id) values (?,?,?,?)";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (String id : snacks.keySet()) {
                stmt.setString(1, snacks.get(id).getSnack().getId());
                stmt.setInt(2, snacks.get(id).getQuantity());
                stmt.setString(3, "Pending");
                stmt.setInt(4, booking_id);
                stmt.addBatch();
            }
            stmt.executeBatch();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int createBookingSeat(Map<String, SeatItem> seats, int booking_id) {
        String sql = "INSERT INTO booking_seat(seat_id, seat_qty, status, booking_id) values (?,?,?,?)";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (String id : seats.keySet()) {
                stmt.setString(1, seats.get(id).getSeat().getId());
                stmt.setInt(2, seats.get(id).getQuantity());
                stmt.setString(3, "Pending");
                stmt.setInt(4, booking_id);
                stmt.addBatch();
            }
            stmt.executeBatch();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public boolean updateStatus(int bookingId, String status) {
        String sqlBooking = "UPDATE booking SET status = ? WHERE booking_id = ?";
        String sqlBookingSeat = "UPDATE booking_seat SET status = ? WHERE booking_id = ?";
        String sqlBookingSnack = "UPDATE booking_snack SET status = ? WHERE booking_id = ?";

        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmtBooking = conn.prepareStatement(sqlBooking); PreparedStatement stmtBookingSeat = conn.prepareStatement(sqlBookingSeat); PreparedStatement stmtBookingSnack = conn.prepareStatement(sqlBookingSnack)) {
            stmtBooking.setString(1, status);
            stmtBooking.setInt(2, bookingId);
            stmtBooking.executeUpdate();

            stmtBookingSeat.setString(1, status);
            stmtBookingSeat.setInt(2, bookingId);
            stmtBookingSeat.executeUpdate();

            stmtBookingSnack.setString(1, status);
            stmtBookingSnack.setInt(2, bookingId);
            stmtBookingSnack.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
