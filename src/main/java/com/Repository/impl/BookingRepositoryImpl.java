/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.Format;
import com.Config.GetConnection;
import com.DTO.Response.BookingResponse;
import com.DTO.Response.BookingSeatDTO;
import com.DTO.Response.BookingSnackDTO;
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
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    @Override
    public void addBookingShowtime(int booking_id, Map<String, SeatItem> seats) {
        if (seats == null || seats.isEmpty()) {
            System.out.println("Error: No seat data provided.");
            return;
        }
        
        String getMovieIdSql = "SELECT movie_id FROM movie WHERE title = ?";
        String getTheatreIdSql = "SELECT theatre_id FROM theatre t JOIN cinema c ON t.cinema_id = c.cinema_id WHERE c.cinema_name = ? AND t.theatre_num = ?";
        String getShowingTimeIdSql = "SELECT time_id FROM showing_time WHERE movie_id = ? AND theatre_id = ? AND showing_datetime = ?";
        String getTimeDetailIdSql = "SELECT time_detail_id FROM time_detail WHERE showing_time_id = ? AND timedetail = ?";
        String insertBookingShowtimeSql = "INSERT INTO booking_showtime (booking_id, showing_time_id, time_detail_id) VALUES (?, ?, ?)";
        
        try (Connection conn = GetConnection.getConnection()) {
            conn.setAutoCommit(false);
            
            for (SeatItem seatItem : seats.values()) {
                String cinema = seatItem.getCinema();
                String theatre = seatItem.getTheatre();
                String movie = seatItem.getMovie();
                String fullTime = seatItem.getTime();
                String[] parts = fullTime.split(" at ");
                if (parts.length < 2) {
                    System.out.println("Error: Invalid time format - " + fullTime);
                    continue;
                }
                String date = Format.fm2.format(Format.fm.parse(parts[0]));
                String time = parts[1]; // Lấy "time"
                int movieId = getIdFromQuery(conn, getMovieIdSql, movie);
                int theatreId = getIdFromQuery(conn, getTheatreIdSql, cinema, theatre);
                int showingTimeId = getIdFromQuery(conn, getShowingTimeIdSql, movieId, theatreId, date);
                int timeDetailId = getIdFromQuery(conn, getTimeDetailIdSql, showingTimeId, time);
                if (showingTimeId != -1 && timeDetailId != -1) {
                    try (PreparedStatement stmt = conn.prepareStatement(insertBookingShowtimeSql)) {
                        stmt.setInt(1, booking_id);
                        stmt.setInt(2, showingTimeId);
                        stmt.setInt(3, timeDetailId);
                        stmt.executeUpdate();
                    }
                } else {
                    System.out.println("Error: Invalid data for " + movie + " at " + fullTime);
                }
            }
            conn.commit(); // Xác nhận transaction
            System.out.println("Booking showtimes added successfully!");
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(BookingRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    private int getIdFromQuery(Connection conn, String sql, Object... params) throws SQLException {
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        }
        return -1;
    }
    
    @Override
    public TreeMap<String, BookingResponse> getBookingResponsesByUser(int userId) {
        String bookingSeat = "SELECT b.booking_id, m.title, cin.cinema_name, the.theatre_num, st.showing_datetime,"
                + " td.timedetail, sty.type_name, bse.seat_qty, bse.seat_qty * se.price as price from booking b\n"
                + "JOIN booking_seat bse on bse.booking_id = b.booking_id\n"
                + "JOIN seat se on se.seat_id = bse.seat_id\n"
                + "JOIN booking_showtime bst on bst.booking_id = b.booking_id\n"
                + "JOIN showing_time st on st.time_id = bst.showing_time_id\n"
                + "JOIN movie m on m.movie_id = st.movie_id\n"
                + "JOIN time_detail td on td.time_detail_id = bst.time_detail_id\n"
                + "JOIN theatre the on the.theatre_id = st.theatre_id\n"
                + "JOIN cinema cin on cin.cinema_id = the.cinema_id\n"
                + "JOIN seat_type sty on sty.type_id = se.seat_type_id\n"
                + "WHERE b.user_id = ? group by b.booking_id, m.title, cin.cinema_name, the.theatre_num, st.showing_datetime,\n"
                + "td.timedetail, sty.type_name, bse.seat_qty, price";
        String bookingSnack = "SELECT b.booking_id, cin.cinema_name,s.snack_name, bs.snack_qty, s.price * bs.snack_qty as price from booking b\n"
                + "JOIN booking_snack bs on bs.booking_id = b.booking_id\n"
                + "JOIN snack s on s.snack_id = bs.snack_id\n"
                + "JOIN booking_showtime bst on bst.booking_id = b.booking_id\n"
                + "JOIN showing_time st on st.time_id = bst.showing_time_id\n"
                + "JOIN theatre the on the.theatre_id = st.theatre_id\n"
                + "JOIN cinema cin on cin.cinema_id = the.cinema_id\n"
                + "WHERE b.user_id = ? group by b.booking_id, cin.cinema_name,s.snack_name, bs.snack_qty, price\n"
                + "";
        TreeMap<String, BookingResponse> bookingResponses = new TreeMap<>(Comparator.reverseOrder());
        
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmtSeat = conn.prepareStatement(bookingSeat); PreparedStatement stmtSnack = conn.prepareStatement(bookingSnack)) {
            stmtSeat.setInt(1, userId);
            try (ResultSet rs = stmtSeat.executeQuery()) {
                while (rs.next()) {
                    String bookingId = rs.getString("booking_id");
                    BookingSeatDTO bookingSeatDTO = new BookingSeatDTO(
                            rs.getString("title"),
                            rs.getString("cinema_name"),
                            rs.getString("theatre_num"),
                            rs.getString("showing_datetime"),
                            rs.getString("timedetail"),
                            rs.getString("type_name"),
                            rs.getInt("seat_qty"),
                            rs.getDouble("price")
                    );
                    bookingResponses.computeIfAbsent(bookingId, k -> new BookingResponse()).getBookingSeats().add(bookingSeatDTO);
                }
            }
            stmtSnack.setInt(1, userId);
            try (ResultSet rs = stmtSnack.executeQuery()) {
                while (rs.next()) {
                    String bookingId = rs.getString("booking_id");
                    BookingSnackDTO bookingSnackDTO = new BookingSnackDTO(
                            rs.getString("cin.cinema_name"),
                            rs.getString("s.snack_name"),
                            rs.getInt("bs.snack_qty"),
                            rs.getDouble("price")
                    );
                    
                    bookingResponses.computeIfAbsent(bookingId, k -> new BookingResponse()).getBookingSnacks().add(bookingSnackDTO);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookingResponses;
    }
    
}
