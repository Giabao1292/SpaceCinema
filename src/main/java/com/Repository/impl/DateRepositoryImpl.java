/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.ShowingTime;
import com.Repository.DateRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class DateRepositoryImpl implements DateRepository {

    private SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");

    @Override
    public List<String> findAll(String cinema, String movie) {
        List<String> showingTimes = new ArrayList<>();
        try (Connection connection = GetConnection.getConnection()) {
            Statement st = connection.createStatement();
            String sql = "SELECT showing_datetime FROM showing_time st\n"
                    + "JOIN movie m on m.movie_id = st.movie_id\n"
                    + "JOIN theatre t on t.theatre_id = st.theatre_id\n"
                    + "JOIN cinema c on c.cinema_id = t.cinema_id\n"
                    + "WHERE c.cinema_name = '" + cinema + "' AND m.title = '" + movie + "'\n"
                    + "AND showing_datetime >= CURDATE()\n"
                    + "GROUP BY showing_datetime\n"
                    + "ORDER BY showing_datetime ASC";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                ShowingTime stime = new ShowingTime(rs.getDate("showing_datetime"));
                showingTimes.add(sf.format(stime.getShowingTime()));
            }
        } catch (SQLException e) {
            System.out.println("Date error");
            e.printStackTrace();
        }
        return showingTimes;
    }

}
