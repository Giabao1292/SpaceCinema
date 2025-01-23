/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Movie;
import com.Repository.MovieRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class MovieRepositoryImpl implements MovieRepository {

    @Override
    public List<Movie> findAllMovie() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<String> findMovieByCinema(String cinema) {
        List<String> movies = new ArrayList<>();
        StringBuilder sql = new StringBuilder("Select m.movie_id, m.title as title, c.cinema_name as title from cinema c \n"
                + "JOIN theatre t ON t.cinema_id = c.cinema_id\n"
                + "JOIN showing_time st ON st.theatre_id = t.theatre_id\n"
                + "JOIN movie m ON m.movie_id = st.movie_id\n"
                + "where c.cinema_name = '" + cinema
                + "'GROUP BY m.movie_id");
        try (Connection connection = GetConnection.getConnection()) {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            while (rs.next()) {
                movies.add(rs.getString("title"));
                
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return movies;
    }

}
