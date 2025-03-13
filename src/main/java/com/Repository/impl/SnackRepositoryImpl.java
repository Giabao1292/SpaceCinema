/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Snack;
import com.Repository.SnackRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
public class SnackRepositoryImpl implements SnackRepository {

    @Override
    public LinkedHashMap<String, List<Snack>> findAllSnack() {
        LinkedHashMap<String, List<Snack>> snackList = new LinkedHashMap<>();
        String sql = "Select * from snack s JOIN snack_type st ON st.type_id = s.snack_type_id ORDER BY s.snack_type_id";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Snack snack = new Snack();
                    String type_name = rs.getString("st.type_name");
                    snack.setId(rs.getString("s.snack_id"));
                    snack.setPrice(rs.getDouble("s.price"));
                    snack.setSnack_name(rs.getString("s.snack_name"));
                    snack.setSnack_type(rs.getString("s.snack_type_id"));
                    snack.setPoster_image(rs.getString("s.poster_image"));
                    snackList.putIfAbsent(type_name, new ArrayList<>());
                    snackList.get(type_name).add(snack);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(SnackRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return snackList;
    }
    
    @Override
    public Snack getSnackById(String snackId) {
        String sql = "SELECT s.*, st.type_name FROM snack s "
                + "JOIN snack_type st ON st.type_id = s.snack_type_id "
                + "WHERE s.snack_id = ?";
        Snack snack = null;
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, snackId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    snack = new Snack();
                    snack.setId(rs.getString("s.snack_id"));
                    snack.setPrice(rs.getDouble("s.price"));
                    snack.setSnack_name(rs.getString("s.snack_name"));
                    snack.setSnack_type(rs.getString("s.snack_type_id"));
                    snack.setPoster_image(rs.getString("s.poster_image"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(SnackRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return snack;
    }
}
