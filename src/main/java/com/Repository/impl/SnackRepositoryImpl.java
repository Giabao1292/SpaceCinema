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
public class SnackRepositoryImpl implements SnackRepository {

    @Override
    public List<Snack> listAllSnacks() {
        List<Snack> snacks = new ArrayList<>();
        try (Connection con = GetConnection.getConnection()) {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("Select * from snack s join snack_type st on s.snack_type_id = st.type_id ");
            while (rs.next()) {
                Snack snack = new Snack();
                snack.setId(rs.getString("snack_id"));
                snack.setName(rs.getString("snack_name"));
                snack.setPrice(rs.getDouble("price"));
                snack.setType(rs.getString("type_name"));
                snacks.add(snack);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return snacks;
    }

    @Override
    public void createSnack(Snack snack, String stId) {
        String sql = "INSERT INTO `spacecinema`.`snack`\n"
                + "(`snack_type_id`,\n"
                + "`snack_name`,\n"
                + "`price`)\n"
                + "VALUES\n"
                + "(?,?,?);";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, stId);
            st.setString(2, snack.getName());
            st.setDouble(3, snack.getPrice());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateSnack(Snack snack, String stId) {
        String sql = "UPDATE `spacecinema`.`snack`\n"
                + "SET\n"
                + "`snack_type_id` = ?,\n"
                + "`snack_name` = ?,\n"
                + "`price` = ?\n"
                + "WHERE `snack_id` = ?;";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, stId);
            st.setString(2, snack.getName());
            st.setDouble(3, snack.getPrice());
            st.setString(4, snack.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteSnack(String id) {
        String sql = "DELETE FROM `spacecinema`.`snack`\n"
                + "WHERE snack_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Snack findSnackById(String id) {
        String sql = "Select * from snack where snack_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Snack snack = new Snack();
                    snack.setId(rs.getString("snack_id"));
                    snack.setName(rs.getString("snack_name"));
                    snack.setPrice(rs.getDouble("price"));
                    return snack;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

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
                    snack.setName(rs.getString("s.snack_name"));
                    snack.setType(rs.getString("s.snack_type_id"));
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
                    snack.setName(rs.getString("s.snack_name"));
                    snack.setType(rs.getString("s.snack_type_id"));
                    snack.setPoster_image(rs.getString("s.poster_image"));
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(SnackRepositoryImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return snack;
    }

}
