/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Cast;
import com.Repository.DirectorRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author lebao
 */
public class DirectorRepositoryImpl implements DirectorRepository{
    @Override
    public boolean updateDirectorName(String id, String name){
        String sql = "UPDATE director SET director_name = ? WHERE director_id = ?";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setString(1, name);
                stmt.setString(2, id);
                stmt.addBatch();
            stmt.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
}
