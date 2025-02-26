/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.Format;
import com.Config.GetConnection;
import com.DTO.Response.MovieResponse;
import com.Model.Movie;
import com.Repository.MovieRepository;
import jakarta.ws.rs.client.RxInvoker;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

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
                while (rsgenre.next()) {
                    genres.add(rsgenre.getString("genre_name"));
                }
                Statement stcast = connection.createStatement();
                ResultSet rscast = stgenre.executeQuery("Select * from cast_member c JOIN "
                        + "movie_cast mc ON mc.cast_id = c.cast_id WHERE movie_id = " + rs.getString("movie_id"));
                List<String> casts = new ArrayList<String>();
                while (rscast.next()) {
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
    public List<MovieResponse> findMovieByCinema(String cinema) {
        List<MovieResponse> movies = new ArrayList<>();
        String sql = "SELECT m.*, d.director_name, ms.status_name FROM movie m "
                + "JOIN movie_status ms ON m.status_id = ms.status_id "
                + "JOIN director d ON d.director_id = m.director_id "
                + "JOIN showing_time st ON st.movie_id = m.movie_id "
                + "JOIN theatre t ON t.theatre_id = st.theatre_id "
                + "JOIN cinema c on c.cinema_id = t.cinema_id "
                + "WHERE c.cinema_name = '" + cinema
                + "' GROUP BY m.movie_id";
        try (Connection connection = GetConnection.getConnection(); Statement st = connection.createStatement()) {
            try (ResultSet rs = st.executeQuery(sql)) {
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
                    while (rsgenre.next()) {
                        genres.add(rsgenre.getString("genre_name"));
                    }
                    Statement stcast = connection.createStatement();
                    ResultSet rscast = stgenre.executeQuery("Select * from cast_member c JOIN "
                            + "movie_cast mc ON mc.cast_id = c.cast_id WHERE movie_id = " + rs.getString("movie_id"));
                    List<String> casts = new ArrayList<String>();
                    while (rscast.next()) {
                        casts.add(rscast.getString("cast_name"));
                    }
                    LinkedHashMap<String, List<String>> times = new LinkedHashMap<>();
                    Statement stTime = connection.createStatement();
                    String sqlRsTime = "SELECT t.*, st.showing_datetime as datetime "
                            + "FROM time_detail t "
                            + "JOIN showing_time st ON st.time_id = t.showing_time_id "
                            + "JOIN theatre th ON th.theatre_id = st.theatre_id "
                            + "JOIN cinema c ON c.cinema_id = th.cinema_id "
                            + "WHERE st.movie_id = " + rs.getInt("movie_id") + " AND c.cinema_name = '" + cinema + "' ORDER BY st.showing_datetime ASC, t.timedetail ASC";
                    ResultSet rsTime = stTime.executeQuery(sqlRsTime);
                    while (rsTime.next()) {
                        String date = Format.Date(rsTime.getDate("datetime"));
                        if (times.get(date) == null) {
                            times.put(date, new ArrayList<>());
                            times.get(date).add(rsTime.getString("timedetail"));
                        } else {
                            times.get(date).add(rsTime.getString("timedetail"));
                        }
                    }

                    movie.setCast(casts);
                    movie.setGenre(genres);
                    movie.setTimes(times);
                    movies.add(movie);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return movies;
    }

    @Override
    public Movie findMovieById(int id) {
        String sql = "select * from movie where movie_id = ?";
        try (Connection connection = GetConnection.getConnection()) {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery(sql);
            if (rs.next()) {
                return new Movie(rs.getString("title"), rs.getString("trailer_link"), rs.getString("age_rating"), rs.getString("header_image"), rs.getString("discription"), rs.getString("synopsis"), rs.getInt("runtime_min"), rs.getDate("release_date"), rs.getInt("directorId"), rs.getInt("genreId"), rs.getInt("castId"), rs.getString("statusId"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public MovieResponse findMovieByNameAndCinema(String name, String cinema) {
        MovieResponse movie = new MovieResponse();
        try (Connection connection = GetConnection.getConnection()) {
            String sql = "SELECT m.*, d.director_name, ms.status_name FROM movie m "
                    + "JOIN movie_status ms ON m.status_id = ms.status_id "
                    + "JOIN director d ON d.director_id = m.director_id "
                    + "JOIN showing_time st ON st.movie_id = m.movie_id "
                    + "JOIN theatre t ON t.theatre_id = st.theatre_id "
                    + "JOIN cinema c on c.cinema_id = t.cinema_id "
                    + "WHERE c.cinema_name = '" + cinema
                    + "' AND m.title = '" + name
                    + "' GROUP BY m.movie_id";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            while (rs.next()) {
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
                while (rsgenre.next()) {
                    genres.add(rsgenre.getString("genre_name"));
                }
                Statement stcast = connection.createStatement();
                ResultSet rscast = stgenre.executeQuery("Select * from cast_member c JOIN "
                        + "movie_cast mc ON mc.cast_id = c.cast_id WHERE movie_id = " + rs.getString("movie_id"));
                List<String> casts = new ArrayList<String>();
                while (rscast.next()) {
                    casts.add(rscast.getString("cast_name"));
                }
                LinkedHashMap<String, List<String>> times = new LinkedHashMap<>();
                Statement stTime = connection.createStatement();
                String sqlRsTime = "SELECT t.*, st.showing_datetime as datetime "
                        + "FROM time_detail t "
                        + "JOIN showing_time st ON st.time_id = t.showing_time_id "
                        + "JOIN theatre th ON th.theatre_id = st.theatre_id "
                        + "JOIN cinema c ON c.cinema_id = th.cinema_id "
                        + "WHERE st.movie_id = " + rs.getInt("movie_id") + " AND c.cinema_name = '" + cinema + "' ORDER BY st.showing_datetime ASC, t.timedetail ASC";
                ResultSet rsTime = stTime.executeQuery(sqlRsTime);
                while (rsTime.next()) {
                    String date = Format.Date(rsTime.getDate("datetime"));
                    if (times.get(date) == null) {
                        times.put(date, new ArrayList<>());
                        times.get(date).add(rsTime.getString("timedetail"));
                    } else {
                        times.get(date).add(rsTime.getString("timedetail"));
                    }
                }
                movie.setCast(casts);
                movie.setGenre(genres);
                movie.setTimes(times);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return movie;
    }

}
