/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.User;
import com.Model.Voucher;
import com.Repository.VoucherRepository;
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
public class VoucherRepositoryImpl implements VoucherRepository {

    @Override
    public List<Voucher> getAllVoucherByUserId(int userId) {
        List<Voucher> listVoucher = new ArrayList<>();
        String sql = "Select v.* from voucher v join user_voucher uv on uv.voucher_id = v.voucher_id where uv.user_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("voucher_id"));
                    voucher.setDescription(rs.getString("description"));
                    voucher.setDiscount(rs.getInt("discount"));
                    voucher.setName(rs.getString("voucher_name"));
                    listVoucher.add(voucher);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listVoucher;
    }

    @Override
    public List<Voucher> getListVoucher() {
        List<Voucher> vouchers = new ArrayList<>();
        String sql = "SELECT \n"
                + "    v.voucher_id,\n"
                + "    v.voucher_name,\n"
                + "    v.description,\n"
                + "    v.discount,\n"
                + "    GROUP_CONCAT(u.username) AS user_names,\n"
                + "    COUNT(uv.user_id) AS user_count\n"
                + "FROM \n"
                + "    voucher v\n"
                + "LEFT JOIN \n"
                + "    user_voucher uv ON v.voucher_id = uv.voucher_id\n"
                + "    LEFT JOIN \n"
                + "    user u ON uv.user_id = u.user_id\n"
                + "GROUP BY \n"
                + "    v.voucher_id";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("voucher_id");
                String name = rs.getString("voucher_name");
                String description = rs.getString("description");
                int discount = rs.getInt("discount");
                int userCount = rs.getInt("user_count");
                String userNames = rs.getString("user_names");
                List<User> users = new ArrayList<>();
                if (userNames != null) {
                    String[] userNamesArray = userNames.split(",");
                    for (String username : userNamesArray) {
                        User user = new User();
                        user.setUserName(username);
                        users.add(user);
                    }
                }
                vouchers.add(new Voucher(id, name, description, discount, users, userCount));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vouchers;
    }

    @Override
    public int addVoucher(Voucher voucher) {
        String sql = "INSERT INTO voucher (voucher_name, description, discount) VALUES (?, ?, ?)";
        try (Connection con = GetConnection.getConnection(); PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, voucher.getName());
            stmt.setString(2, voucher.getDescription());
            stmt.setInt(3, voucher.getDiscount());
            stmt.executeUpdate();

            try (ResultSet rs = stmt.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public void addUserVoucher(int userId, int voucherId) {
        String sql = "INSERT INTO user_voucher (user_id, voucher_id) VALUES (?, ?)";
        try (Connection con = GetConnection.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, voucherId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteVoucherById(int id) {
        String sql = "DELETE FROM spacecinema.voucher WHERE voucher_id = ?";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Voucher getVoucherById(int id) {
        return new Voucher();
    }
    
    

}
