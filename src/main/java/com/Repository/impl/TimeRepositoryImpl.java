/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.Format;
import com.Config.GetConnection;
import com.Model.Theatre;
import com.Repository.TheatreRepository;
import com.Repository.TimeRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
public class TimeRepositoryImpl implements TimeRepository {

    private TheatreRepository theatreRepository = new TheatreRepositoryImpl();

    @Override
    public List<String> findAll(String cinema, String movie, String date) {
        List<String> times = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT timedetail FROM time_detail td "
                + "JOIN showing_time st ON st.time_id = td.showing_time_id "
                + "JOIN movie m ON m.movie_id = st.movie_id "
                + "JOIN theatre t ON t.theatre_id = st.theatre_id "
                + "JOIN cinema c ON c.cinema_id = t.cinema_id "
                + "WHERE c.cinema_name = '" + cinema
                + "' AND m.title = '" + movie
                + "' AND st.showing_datetime = '" + date + "'");
        Date now = new Date();
        if (date.equals(Format.fm2.format(now))) {
            sql.append(" AND timedetail > CURTIME()");
        }
        sql.append("Order by timedetail ASC");
        try (Connection connection = GetConnection.getConnection()) {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            while (rs.next()) {
                times.add(rs.getString("timedetail"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return times;
    }

    @Override
    public void addListTime(String[] cinema, HashMap<String, List<String>> times, String[] dates, String movieId) {
        String sqlShowingTime = "INSERT INTO showing_time (theatre_id, movie_id, showing_datetime) values(?,?,?)";
        String sqlTimeDetail = "INSERT INTO time_detail (showing_time_id, timedetail) values(?,?)";
        String sqlTimeSeat = "INSERT INTO time_detail_seat (time_detail_id, seat_id, quantity) values(?,?,?)";
        try (Connection con = GetConnection.getConnection(); PreparedStatement stmtTimeDetail = con.prepareStatement(sqlTimeDetail, Statement.RETURN_GENERATED_KEYS); PreparedStatement stmt = con.prepareStatement(sqlShowingTime, Statement.RETURN_GENERATED_KEYS); PreparedStatement stTimeSeat = con.prepareStatement(sqlTimeSeat)) {
            for (String key : times.keySet()) {
                List<Theatre> theatres = theatreRepository.getListTheatreByType(key, cinema);
                for (Theatre theatre : theatres) {
                    for (String date : dates) {
                        stmt.setString(1, theatre.getId());
                        stmt.setString(2, movieId);
                        stmt.setString(3, Format.fm2.format(Format.fm.parse(date)));
                        stmt.addBatch();
                    }
                }
            }
            stmt.executeBatch();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                int index = 0;
                for (String key : times.keySet()) {
                    List<Theatre> theatres = theatreRepository.getListTheatreByType(key, cinema);
                    for (Theatre theatre : theatres) {
                        for (String date : dates) {
                            if (rs.next()) {
                                int showingTimeId = rs.getInt(1); // Lấy ID tự động tăng
                                for (String time : times.get(key)) {
                                    stmtTimeDetail.setInt(1, showingTimeId);
                                    stmtTimeDetail.setString(2, time);
                                    stmtTimeDetail.addBatch();
                                }
                            }
                        }
                    }
                }
            }
            stmtTimeDetail.executeBatch();
            try (ResultSet rs = stmtTimeDetail.getGeneratedKeys()) {
                while (rs.next()) {
                    int timeDetailId = rs.getInt(1);
                    List<Integer> seatIds = seatId(timeDetailId);
                    for (Integer seatId : seatIds) {
                        stTimeSeat.setInt(1, timeDetailId);
                        stTimeSeat.setInt(2, seatId);
                        stTimeSeat.setInt(3, 45);
                        stTimeSeat.addBatch();
                    }
                }
                stTimeSeat.executeBatch();
            }

        } catch (SQLException ex) {
            Logger.getLogger(TimeRepositoryImpl.class
                    .getName()).log(Level.SEVERE, null, ex);

        } catch (ParseException ex) {
            Logger.getLogger(TimeRepositoryImpl.class
                    .getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Integer> seatId(int timeid) {
        String sql = "SELECT s.* FROM seat s "
                + "JOIN theatre t on t.theatre_id = s.theatre_id "
                + "JOIN showing_time st on st.theatre_id = t.theatre_id "
                + "JOIN time_detail td on td.showing_time_id = st.time_id "
                + "WHERE td.time_detail_id = ?";
        List<Integer> seatIds = new ArrayList<>();
        try (Connection connection = GetConnection.getConnection(); PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, timeid);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    int seatId = rs.getInt("s.seat_id");
                    seatIds.add(seatId);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return seatIds;
    }
}
