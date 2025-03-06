/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Repository.StatusRepository;
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
public class StatusRepositoryImpl implements StatusRepository {

    @Override
    public List<String> findAllStatus() {
        String sql = "Select * from movie_status";
        List<String> statusList = new ArrayList<>();
        try (Connection conn = GetConnection.getConnection(); Statement st = conn.createStatement()) {
            try (ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    statusList.add(rs.getString("status_name"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return statusList;
    }

    @Override
    public int findStatusByName(String name) {
        String sql = "Select * from movie_status where status_name = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, name);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("status_id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
}
