/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Cast;
import com.Repository.CastRepository;
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
public class CastRepositoryImpl implements CastRepository {

    @Override
    public boolean updateListCast(List<Cast> casts) {
        String sql = "UPDATE cast_member SET cast_name = ? WHERE cast_id = ?";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (Cast cast : casts) {
                stmt.setString(1, cast.getName());
                stmt.setInt(2, cast.getId());
                stmt.addBatch();
            }
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public void deleteMovieCast(String movieId) {
        String sql = "DELETE FROM movie_cast where movie_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, movieId);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
