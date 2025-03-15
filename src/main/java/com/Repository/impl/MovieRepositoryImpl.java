/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.Format;
import com.Config.GetConnection;
import com.DTO.Request.MovieRequestDto;
import com.DTO.Response.MovieResponse;
import com.Model.Cinema;
import com.Repository.CastRepository;
import com.Repository.GenreRepository;
import com.Repository.MovieRepository;
import com.Repository.StatusRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
public class MovieRepositoryImpl implements MovieRepository {
    private GenreRepository genreRepository = new GenreRepositoryImpl();
    private CastRepository castRepository = new CastRepositoryImpl();
    private StatusRepository statusRepository = new StatusRepositoryImpl();

    @Override
    public boolean addMovie(MovieRequestDto movieRequestDto) {
        String createMovie = "INSERT INTO movie (director_id, title, status_id, age_rating, runtime_min, release_date, "
                + "trailer_link, description, banner_text, header_image, poster_image, synopsis) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement st = conn.prepareStatement(createMovie, Statement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, findDirector(movieRequestDto.getDirector_name()));
            st.setString(2, movieRequestDto.getTitle());
            st.setInt(3, findStatus(movieRequestDto.getStatus()));
            st.setString(4, movieRequestDto.getAge_rating());
            st.setInt(5, movieRequestDto.getRuntime_min());
            st.setString(6, movieRequestDto.getRelease_date());
            st.setString(7, movieRequestDto.getTrailer_link());
            st.setString(8, movieRequestDto.getDiscription());
            st.setString(9, movieRequestDto.getBanner_text());
            st.setString(10, movieRequestDto.getHeader_image());
            st.setString(11, movieRequestDto.getPoster_image());
            st.setString(12, movieRequestDto.getSynopsis());
            int row = st.executeUpdate();
            if (row > 0) {
                try (ResultSet generatedKey = st.getGeneratedKeys()) {
                    while (generatedKey.next()) {
                        String movieId = generatedKey.getString(1);
                        addGenreToMovie(movieId, movieRequestDto.getGenres());
                        addCastToMovie(movieId, movieRequestDto.getCasts());
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public int addGenreToMovie(String movieId, List<Integer> genreIds) {
        String addGenre = "INSERT INTO movie_genre (movie_id, genre_id) VALUES (?, ?)";
        int rowsInserted = 0;
        
        try (Connection conn = GetConnection.getConnection(); PreparedStatement st = conn.prepareStatement(addGenre)) {
            
            for (Integer genreId : genreIds) {
                st.setString(1, movieId);
                st.setInt(2, genreId);
                st.addBatch();
            }
            
            int[] result = st.executeBatch();
            return result.length;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int addCastToMovie(String movieId, List<String> cast) {
        String addCast = "INSERT INTO movie_cast (movie_id, cast_id) values (?,?)";
        int rowsInserted = 0;
        
        try (Connection conn = GetConnection.getConnection(); PreparedStatement st = conn.prepareStatement(addCast)) {
            
            for (String name : cast) {
                int castId = findCast(name);
                if (castId == -1) {
                    castId = createCast(name);
                }
                st.setString(1, movieId);
                st.setInt(2, castId);
                st.addBatch();
            }
            
            int[] result = st.executeBatch();
            return result.length;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int findStatus(String name) {
        String findStatus = "SELECT status_id FROM movie_status WHERE status_name LIKE ?";
        
        try (Connection conn = GetConnection.getConnection(); PreparedStatement findSt = conn.prepareStatement(findStatus)) {
            
            findSt.setString(1, "%" + name + "%");
            
            try (ResultSet rs = findSt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("status_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int createDirector(String name) {
        String createDirector = "INSERT INTO director(director_name) VALUES (?)";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement insertSt = conn.prepareStatement(createDirector, Statement.RETURN_GENERATED_KEYS)) {
            insertSt.setString(1, name);
            int affectedRows = insertSt.executeUpdate();
            
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = insertSt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int findDirector(String name) {
        String findDirector = "SELECT director_id FROM director WHERE director_name LIKE ?";
        
        try (Connection conn = GetConnection.getConnection(); PreparedStatement findSt = conn.prepareStatement(findDirector)) {
            
            findSt.setString(1, "%" + name + "%");
            
            try (ResultSet rs = findSt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("director_id");
                } else {
                    return createDirector(name);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int createCast(String name) {
        String createDirector = "INSERT INTO cast_member(cast_name) VALUES (?)";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement insertSt = conn.prepareStatement(createDirector, Statement.RETURN_GENERATED_KEYS)) {
            insertSt.setString(1, name);
            int affectedRows = insertSt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = insertSt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public int findCast(String name) {
        String findCast = "SELECT * from cast_member WHERE cast_name like ?";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement st = conn.prepareStatement(findCast)) {
            st.setString(1, name);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("cast_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    @Override
    public List<MovieResponse> findAllMovie(String status) {
        List<MovieResponse> movies = new ArrayList<>();
        try (Connection connection = GetConnection.getConnection()) {
            String sql = "SELECT * FROM movie m JOIN director d ON d.director_id = m.director_id JOIN movie_status s ON s.status_id = m.status_id WHERE s.status_name = '" + status + "'";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            while (rs.next()) {
                MovieResponse movie = new MovieResponse();
                movie.setId(rs.getString("movie_id"));
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
                movie.setPoster_image(rs.getString("poster_image"));
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
                String sqlCinema = "SELECT DISTINCT\n"
                        + "    m.movie_id, \n"
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
                        + "WHERE m.movie_id = ?";
                PreparedStatement stCinema = connection.prepareStatement(sqlCinema);
                stCinema.setInt(1, rs.getInt("movie_id"));
                ResultSet rsCinema = stCinema.executeQuery();
                
                List<Cinema> cinemas = new ArrayList<>();
                while (rsCinema.next()) {
                    Cinema ctemp = new Cinema();
                    ctemp.setName(rsCinema.getString("cinema_name"));
                    cinemas.add(ctemp);
                }
                movie.setCast(casts);
                movie.setGenre(genres);
                movie.setCinema(cinemas);
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
    public MovieRequestDto findMovieById(String id) {
        String sql = "select * from movie m "
                + "JOIN movie_cast mc on m.movie_id = mc.movie_id "
                + "JOIN cast_member c on c.cast_id = mc.cast_id "
                + "JOIN movie_genre mg on mg.movie_id = m.movie_id "
                + "JOIN genre g on g.genre_id = mg.genre_id "
                + "JOIN movie_status ms on ms.status_id = m.status_id "
                + "JOIN director d on d.director_id = m.director_id where m.movie_id = ?";
        try (Connection connection = GetConnection.getConnection()) {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                MovieRequestDto movieRequestDto = new MovieRequestDto();
                movieRequestDto.setTitle(rs.getString("title"));
                movieRequestDto.setTrailer_link(rs.getString("trailer_link"));
                movieRequestDto.setAge_rating(rs.getString("age_rating"));
                movieRequestDto.setHeader_image(rs.getString("header_image"));
                movieRequestDto.setDiscription(rs.getString("description"));
                movieRequestDto.setSynopsis(rs.getString("synopsis"));
                movieRequestDto.setRuntime_min(rs.getInt("runtime_min"));
                movieRequestDto.setRelease_date(rs.getString("release_date"));
                movieRequestDto.setBanner_text(rs.getString("banner_text"));
                movieRequestDto.setPoster_image(rs.getString("poster_image"));
                movieRequestDto.setDirector_name(rs.getString("director_name"));
                movieRequestDto.setStatus(rs.getString("status_name"));
                Statement stgenre = connection.createStatement();
                ResultSet rsgenre = stgenre.executeQuery("Select * from genre g JOIN "
                        + "movie_genre mg ON mg.genre_id = g.genre_id WHERE movie_id = " + rs.getString("movie_id"));
                List<Integer> genres = new ArrayList<Integer>();
                while (rsgenre.next()) {
                    genres.add(rsgenre.getInt("genre_id"));
                }
                Statement stcast = connection.createStatement();
                ResultSet rscast = stgenre.executeQuery("Select * from cast_member c JOIN "
                        + "movie_cast mc ON mc.cast_id = c.cast_id WHERE movie_id = " + rs.getString("movie_id"));
                List<String> casts = new ArrayList<String>();
                while (rscast.next()) {
                    casts.add(rscast.getString("cast_name"));
                }
                movieRequestDto.setCasts(casts);
                movieRequestDto.setGenres(genres);
                return movieRequestDto;
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
    
    @Override
    public boolean deleteMovieById(String id) {
        String sql = "DELETE FROM movie where movie_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, id);
            st.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(MovieRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    @Override
    public String getMovieId(String name){
        String sql = "SELECT * FROM movie where title = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, name);
            try(ResultSet rs = st.executeQuery()){
                if(rs.next()){
                    return rs.getString("movie_id");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(MovieRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public boolean updateMovie(MovieRequestDto movie, String movieId) {
        String sql = "UPDATE movie SET title = ?, trailer_link = ?, age_rating = ?, header_image = ?, "
                + "description = ?, synopsis = ?, runtime_min = ?, release_date = ?, "
                + "banner_text = ?, poster_image = ?, status_id = ?, director_id = ? WHERE movie_id = ?";
        
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, movie.getTitle());
            stmt.setString(2, movie.getTrailer_link());
            stmt.setString(3, movie.getAge_rating());
            stmt.setString(4, movie.getHeader_image());
            stmt.setString(5, movie.getDiscription());
            stmt.setString(6, movie.getSynopsis());
            stmt.setInt(7, movie.getRuntime_min());
            stmt.setString(8, movie.getRelease_date());
            stmt.setString(9, movie.getBanner_text());
            stmt.setString(10, movie.getPoster_image());
            stmt.setInt(11, statusRepository.findStatusByName(movie.getStatus()));
            stmt.setInt(12, findDirector(movie.getDirector_name()));
            stmt.setString(13, movieId);
            genreRepository.deleteMovieGenre(movieId);
            castRepository.deleteMovieCast(movieId);
            addGenreToMovie(movieId, movie.getGenres());
            addCastToMovie(movieId, movie.getCasts());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
