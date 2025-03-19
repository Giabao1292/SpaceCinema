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
                + "    v.*, \n"
                + "    COUNT(uv.user_id) AS user_count\n"
                + "FROM spacecinema.voucher v\n"
                + "LEFT JOIN spacecinema.user_voucher uv ON v.voucher_id = uv.voucher_id\n"
                + "GROUP BY v.voucher_id, v.voucher_name, v.description, v.discount;";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("voucher_id");
                String name = rs.getString("voucher_name");
                String description = rs.getString("description");
                int discount = rs.getInt("discount");
                int userCount = rs.getInt("user_count");
                String userSql = "SELECT \n"
                        + "    u.user_id, \n"
                        + "    u.username, \n"
                        + "    v.voucher_name, \n"
                        + "    v.description, \n"
                        + "    v.discount\n"
                        + "FROM spacecinema.user_voucher uv\n"
                        + "JOIN spacecinema.user u ON uv.user_id = u.user_id\n"
                        + "JOIN spacecinema.voucher v ON uv.voucher_id = v.voucher_id\n"
                        + "WHERE uv.voucher_id = " + id;
                PreparedStatement stUser = con.prepareStatement(userSql);
                ResultSet rsUser = stUser.executeQuery();
                List<User> users = new ArrayList<>();
                while (rsUser.next()) {
                    User u = new User();
                    u.setId(rsUser.getInt("user_id"));
                    u.setUserName(rsUser.getString("username"));
                    users.add(u);
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
    public void addUserVoucher(List<Integer> userId, int voucherId) {
        String sql = "INSERT INTO user_voucher (user_id, voucher_id) VALUES (?, ?)";
        try (Connection con = GetConnection.getConnection(); PreparedStatement stmt = con.prepareStatement(sql)) {
            for (Integer id : userId) {
                stmt.setInt(1, id);
                stmt.setInt(2, voucherId);
                stmt.addBatch();
            }
            stmt.executeBatch();
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
        String sql = "SELECT * FROM voucher v\n"
                + "JOIN user_voucher uv ON v.voucher_id = uv.voucher_id\n"
                + "JOIN user u ON u.user_id = uv.user_id\n"
                + "WHERE v.voucher_id = ?;";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Voucher voucher = new Voucher();
                voucher.setName(rs.getString("voucher_name"));
                voucher.setDescription(rs.getString("description"));
                voucher.setDiscount(rs.getInt("discount"));
                String userSql = "SELECT \n"
                        + "    u.user_id, \n"
                        + "    u.username, \n"
                        + "    v.voucher_name, \n"
                        + "    v.description, \n"
                        + "    v.discount\n"
                        + "FROM spacecinema.user_voucher uv\n"
                        + "JOIN spacecinema.user u ON uv.user_id = u.user_id\n"
                        + "JOIN spacecinema.voucher v ON uv.voucher_id = v.voucher_id\n"
                        + "WHERE uv.voucher_id = " + rs.getInt("voucher_id");
                PreparedStatement stUser = con.prepareStatement(userSql);
                ResultSet rsUser = stUser.executeQuery();
                List<User> users = new ArrayList<>();
                while (rsUser.next()) {
                    User u = new User();
                    u.setId(rsUser.getInt("user_id"));
                    u.setUserName(rsUser.getString("username"));
                    users.add(u);
                }
                voucher.setUsers(users);
                return voucher;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public void deleteUserIdByVoucherId(int voucher_id) {
        String sql = "DELETE FROM user_voucher WHERE voucher_id = ?;";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql);) {
            st.setInt(1, voucher_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateVoucher(Voucher voucher, int voucher_id, List<Integer> userIds) {
        String sql = "UPDATE voucher SET voucher_name = ?, description = ?, discount = ? WHERE voucher_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql);) {
            st.setString(1, voucher.getName());
            st.setString(2, voucher.getDescription());
            st.setInt(3, voucher.getDiscount());
            st.setInt(4, voucher.getId());
            deleteUserIdByVoucherId(voucher_id);
            addUserVoucher(userIds, voucher_id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> findAllUser() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM voucher v\n"
                + "JOIN user_voucher uv ON v.voucher_id = uv.voucher_id\n"
                + "JOIN user u ON u.user_id = uv.user_id";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("user_id"));
                u.setUserName(rs.getString("user_name"));
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean removeVoucher(int userId, int voucherId) {
        String sql = "DELETE FROM user_voucher WHERE user_id = ? AND voucher_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, userId);
            st.setInt(2, voucherId);
            int rowsAffected = st.executeUpdate();
            return rowsAffected > 0; 
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
