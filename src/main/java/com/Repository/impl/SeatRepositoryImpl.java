/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Seat;
import com.Repository.SeatRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class SeatRepositoryImpl implements SeatRepository {

    @Override
    public List<Seat> getSeatType(String theatreId) {
        String sql = "SELECT s.*, st.type_name FROM seat s "
                + "join seat_type st on st.type_id = s.seat_type_id "
                + "join theatre t on t.theatre_id = s.theatre_id "
                + "where t.theatre_id = ?";
        List<Seat> seatList = new ArrayList<>();
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, theatreId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Seat seat = new Seat();
                    seat.setId(rs.getString("s.seat_id"));
                    seat.setPrice(rs.getDouble("s.price"));
                    seat.setQuantity(rs.getInt("s.quantity"));
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
                    seat.setQuantity(rs.getInt("s.quantity"));
                    seat.setType(rs.getString("st.type_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seat;
    }

    @Override
    public int decreaseSeat(String seatId, int quantity) {
        String sql = "UPDATE seat SET quantity = quantity - ? WHERE seat_id = ? AND quantity > 0";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, quantity);
            pstmt.setString(2, seatId);
            return pstmt.executeUpdate(); 
        } catch (SQLException e) {
            e.printStackTrace();
            return -1; 
        }
    }
}
