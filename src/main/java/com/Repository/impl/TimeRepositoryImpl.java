/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Repository.TimeRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author lebao
 */
public class TimeRepositoryImpl implements TimeRepository {

    @Override
    public List<String> findAll(String cinema, String movie, String date) {
        List<String> times = new ArrayList<>();
        String sql = "SELECT timedetail FROM time_detail td "
                + "JOIN showing_time st ON st.time_id = td.showing_time_id "
                + "JOIN movie m ON m.movie_id = st.movie_id "
                + "JOIN theatre t ON t.theatre_id = st.theatre_id "
                + "JOIN cinema c ON c.cinema_id = t.cinema_id "
                + "WHERE c.cinema_name = '" + cinema
                + "' AND m.title = '" + movie
                + "' AND st.showing_datetime = '" + date + "'";
        try (Connection connection = GetConnection.getConnection()) {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                times.add(rs.getString("timedetail"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return times;
    }
}
