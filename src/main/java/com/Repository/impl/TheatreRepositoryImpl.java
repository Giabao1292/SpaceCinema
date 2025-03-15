/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Theatre;
import com.Repository.TheatreRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
public class TheatreRepositoryImpl implements TheatreRepository {

    @Override
    public List<Theatre> getTheatreType() {
        List<Theatre> theatreList = new ArrayList<>();
        String sql = "SELECT * FROM theatre where cinema_id = 1";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Theatre theatre = new Theatre();
                    theatre.setTheatre_num(rs.getString("theatre_num"));
                    theatreList.add(theatre);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TheatreRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return theatreList;
    }

    @Override
    public Theatre getTheatre(String cinema, String movieId, String dateTime, String time) {
        String sql = "SELECT st.*, t.theatre_num from showing_time st "
                + "JOIN time_detail td on st.time_id = td.showing_time_id "
                + "JOIN theatre t on t.theatre_id = st.theatre_id "
                + "JOIN cinema c on t.cinema_id = c.cinema_id "
                + "where td.timedetail = ? and st.movie_id = ? and showing_datetime = ? and c.cinema_name = ?";
        Theatre theatre = null;
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, time);
            st.setString(2, movieId);
            st.setString(3, dateTime);
            st.setString(4, cinema);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    theatre = new Theatre();
                    theatre.setId(rs.getString("st.theatre_id"));
                    theatre.setTheatre_num(rs.getString("t.theatre_num"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(TheatreRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return theatre;
    }
}
