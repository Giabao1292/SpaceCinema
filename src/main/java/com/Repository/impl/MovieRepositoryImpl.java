/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.DTO.Response.MovieResponse;
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
    public List<MovieResponse> findAllMovie() {
        List<MovieResponse> movies = new ArrayList<>();
        try (Connection connection = GetConnection.getConnection()) {
            String sql = "SELECT * FROM movie m JOIN director d ON d.director_id = m.director_id JOIN movie_status s ON s.status_id = m.status_id";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            while (rs.next()) {
                MovieResponse movie = new MovieResponse();
                movie.setTitle(rs.getString("title"));
                movie.setTrailer_link(rs.getString("trailer_link"));
                movie.setRuntime_min(rs.getInt("runtime_min"));
                movie.setHeader_image(rs.getString("header_image"));
                movie.setAge_rating(rs.getString("age_rating"));
                movie.setDescription(rs.getString("description"));
                movie.setDirector(rs.getString("director_name"));
                movie.setStatus(rs.getString("status_name"));
                movie.setRelease_date(rs.getString("release_date"));
                movie.setSynopsis(rs.getString("synopsis"));
                Statement stgenre = connection.createStatement();
                ResultSet rsgenre = stgenre.executeQuery("Select * from genre g JOIN "
                        + "movie_genre mg ON mg.genre_id = g.genre_id WHERE movie_id = " + rs.getString("movie_id"));
                List<String> genres = new ArrayList<String>();
                while(rsgenre.next()){
                    genres.add(rsgenre.getString("genre_name"));
                }
                Statement stcast = connection.createStatement();
                ResultSet rscast = stgenre.executeQuery("Select * from cast_member c JOIN "
                        + "movie_cast mc ON mc.cast_id = c.cast_id WHERE movie_id = " + rs.getString("movie_id"));
                List<String> casts = new ArrayList<String>();
                while(rscast.next()){
                    casts.add(rscast.getString("cast_name"));
                }
                movie.setCast(casts);
                movie.setGenre(genres);
                movies.add(movie);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return movies;
    }
    
    @Override
    public List<String> findMovieByCinema(String cinema) {
        List<String> movies = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "Select m.movie_id, m.title as title, c.cinema_name as title from cinema c \n"
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
