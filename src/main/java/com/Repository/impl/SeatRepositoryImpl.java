/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.Format;
import com.Config.GetConnection;
import com.Model.Seat;
import com.Model.SeatItem;
import com.Repository.SeatRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
public class SeatRepositoryImpl implements SeatRepository {

    @Override
    public List<Seat> getSeatType(String theatreId, String timedetail, String datetime) {
        String sql = "SELECT s.* ,tds.quantity, st.type_name FROM seat s "
                + "join seat_type st on st.type_id = s.seat_type_id "
                + "join theatre t on t.theatre_id = s.theatre_id "
                + "join time_detail_seat tds on tds.seat_id = s.seat_id "
                + "join time_detail td on td.time_detail_id = tds.time_detail_id "
                + "join showing_time sti on sti.time_id = td.showing_time_id "
                + "where t.theatre_id = ? AND timedetail = ? AND sti.showing_datetime = ?";
        List<Seat> seatList = new ArrayList<>();
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, theatreId);
            stmt.setString(2, timedetail);
            stmt.setString(3, datetime);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Seat seat = new Seat();
                    seat.setId(rs.getString("s.seat_id"));
                    seat.setQuantity(rs.getInt("tds.quantity"));
                    seat.setPrice(rs.getDouble("s.price"));
                    seat.setType(rs.getString("st.type_name"));
                    seatList.add(seat);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seatList;
    }

    @Override
    public Seat getSeatById(String seatId) {
        String sql = "SELECT s.*, st.type_name FROM seat s "
                + "join seat_type st on st.type_id = s.seat_type_id "
                + "where s.seat_id = ?";
        Seat seat = null;
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, seatId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    seat = new Seat();
                    seat.setId(rs.getString("s.seat_id"));
                    seat.setPrice(rs.getDouble("s.price"));
                    seat.setType(rs.getString("st.type_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seat;
    }

    @Override
    public int decreaseSeat(Map<String, SeatItem> seats) {
        String sql = "UPDATE time_detail_seat tds "
                + "JOIN time_detail td ON tds.time_detail_id = td.time_detail_id "
                + "JOIN showing_time st ON td.showing_time_id = st.time_id "
                + "JOIN seat s ON tds.seat_id = s.seat_id "
                + "SET tds.quantity = tds.quantity - ? "
                + "WHERE st.showing_datetime = ? "
                + "AND td.timedetail = ? "
                + "AND s.seat_id = ? "
                + "AND tds.quantity > 0";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            for (String key : seats.keySet()) {
                String[] timeDetail = seats.get(key).getTime().split("at");
                SeatItem seatItem = seats.get(key);
                pstmt.setInt(1, seatItem.getQuantity());
                pstmt.setString(2, Format.fm2.format(Format.fm.parse(timeDetail[0].trim())));
                pstmt.setString(3, timeDetail[1].trim());
                pstmt.setString(4, seatItem.getSeat().getId());
                pstmt.addBatch();
            }
            pstmt.executeBatch();
            return 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ParseException ex) {
            Logger.getLogger(SeatRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
