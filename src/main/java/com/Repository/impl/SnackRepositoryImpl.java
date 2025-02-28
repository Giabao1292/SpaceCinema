/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Snack;
import com.Repository.SeatRepository;
import com.Repository.SnackRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

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
                snack.setId(rs.getInt("snack_id"));
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
    public void createSnack(Snack snack, int stId) {
        String sql = "INSERT INTO `spacecinema`.`snack`\n"
                + "(`snack_type_id`,\n"
                + "`snack_name`,\n"
                + "`price`)\n"
                + "VALUES\n"
                + "(?,?,?);";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, stId);
            st.setString(2, snack.getName());
            st.setDouble(3, snack.getPrice());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateSnack(Snack snack, int stId) {
        String sql = "UPDATE `spacecinema`.`snack`\n"
                + "SET\n"
                + "`snack_type_id` = ?,\n"
                + "`snack_name` = ?,\n"
                + "`price` = ?\n"
                + "WHERE `snack_id` = ?;";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, stId);
            st.setString(2, snack.getName());
            st.setDouble(3, snack.getPrice());
            st.setInt(4, snack.getId());
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteSnack(int id) {
        String sql = "DELETE FROM `spacecinema`.`snack`\n"
                + "WHERE snack_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public Snack findSnackById(int id) {
        String sql = "Select * from snack where snack_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    Snack snack = new Snack();
                    snack.setId(rs.getInt("snack_id"));
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
}
