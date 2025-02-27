/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Cinema;
import com.Repository.CinemaRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class CinemaRepositoryImpl implements CinemaRepository {

    @Override
    public List<Cinema> findAll() {
        List<Cinema> cinemas = new ArrayList<>();
        try (Connection connection = GetConnection.getConnection()) {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("Select cinema_name as name From cinema");
            while (rs.next()) {
                Cinema cinema = new Cinema(rs.getString("name"));
                cinemas.add(cinema);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Cinema error");
        }
        return cinemas;
    }

    @Override
    public List<Cinema> findCinemaByMovie(String movie) {
        List<Cinema> cinemas = new ArrayList<>();
        String sql = "SELECT \n"
                + "    m.*, \n"
                + "    d.director_name, \n"
                + "    ms.status_name, \n"
                + "    c.cinema_name\n"
                + "FROM \n"
                + "    movie AS m\n"
                + "JOIN \n"
                + "    movie_status AS ms ON m.status_id = ms.status_id\n"
                + "JOIN \n"
                + "    director AS d ON d.director_id = m.director_id\n"
                + "JOIN \n"
                + "    showing_time AS st ON st.movie_id = m.movie_id\n"
                + "JOIN \n"
                + "    theatre AS t ON t.theatre_id = st.theatre_id\n"
                + "JOIN \n"
                + "    cinema AS c ON c.cinema_id = t.cinema_id\n"
                + "WHERE \n"
                + "    m.title = ?;";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, movie);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Cinema cinema = new Cinema();
                    cinema.setName(rs.getString("cinema_name"));
                    cinemas.add(cinema);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cinemas;
    }

}
