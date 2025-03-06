/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Genre;
import com.Repository.GenreRepository;
import jakarta.ws.rs.DELETE;
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
public class GenreRepositoryImpl implements GenreRepository {

    @Override
    public List<Genre> findAllGenre() {
        List<Genre> genres = new ArrayList<>();
        String sql = "SELECT * FROM GENRE";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement st = conn.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Genre res = new Genre();
                    res.setId(rs.getInt("genre_id"));
                    res.setName(rs.getString("genre_name"));
                    genres.add(res);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return genres;
    }
    @Override
    public void deleteMovieGenre(String movieId){
        String sql = "DELETE FROM movie_genre where movie_id = ?";
        try(Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)){
            st.setString(1, movieId);
            st.executeUpdate();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
    }
            
}
