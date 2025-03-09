/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Role;
import com.Model.User;
import com.Repository.UserRepository;
import com.Utils.PasswordUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author lebao
 */
public class UserRepositoryImpl implements UserRepository {

    public void joinTable(StringBuilder sql) {
        sql.append("SELECT u.* FROM user u ");
    }

    public void queryNormal(StringBuilder sql, String username, String password) {
        sql.append("WHERE u.status = 1 AND username = '" + username + "'");
    }

    @Override
    public User findUserByEmail(String email) {
        String sql = "SELECT * FROM USER u WHERE u.email = ?";
        User user = new User();
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setString(1, email);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    user.setFullName(rs.getString("fullname"));
                    user.setUserName(rs.getString("username"));
                    user.setPassWord(rs.getString("password"));
                    user.setStatus(rs.getInt("status"));
                    String sqlRole = "Select * from role r JOIN user_role ur ON ur.role_id = r.role_id WHERE ur.user_id = " + rs.getInt("user_id");
                    Statement stRole = con.createStatement();
                    List<Role> roles = new ArrayList<>();
                    ResultSet rsRoles = stRole.executeQuery(sqlRole);
                    while (rsRoles.next()) {
                        Role roleTmp = new Role();
                        roleTmp.setCode(rsRoles.getString("code"));
                        roles.add(roleTmp);
                    }
                    user.setRole(roles);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean changePassWord(String email, String password) {
        User user = findUserByEmail(email);
        String sql = "UPDATE user SET password = ? WHERE email = ?";
        try (Connection conn = GetConnection.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, password); 
            stmt.setString(2, email); 
            int rowsUpdated = stmt.executeUpdate();
            return rowsUpdated > 0; 
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public User findUserByNameAndPassword(String username, String password) {
        StringBuilder sql = new StringBuilder("");
        joinTable(sql);
        queryNormal(sql, username, password);
        User user = new User();
        try (Connection connection = GetConnection.getConnection()) {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            if (rs.next()) {
                if (!PasswordUtil.checkPassword(password, rs.getString("password"))) {
                    return null;
                }
                user.setFullName(rs.getString("fullname"));
                user.setUserName(rs.getString("username"));
                user.setPassWord(rs.getString("password"));
                String sqlRole = "Select * from role r JOIN user_role ur ON ur.role_id = r.role_id WHERE ur.user_id = " + rs.getInt("user_id");
                Statement stRole = connection.createStatement();
                List<Role> roles = new ArrayList<>();
                ResultSet rsRoles = stRole.executeQuery(sqlRole);
                while (rsRoles.next()) {
                    Role roleTmp = new Role();
                    roleTmp.setCode(rsRoles.getString("code"));
                    roles.add(roleTmp);
                }
                user.setRole(roles);
            }
        } catch (Exception e) {
            System.out.println("Error find user");
        }
        return user;
    }

    @Override
    public boolean checkEmail(String email) {
        String sql = "Select u.email from user u where u.email = '" + email + "'";
        try (Connection con = GetConnection.getConnection(); Statement st = con.createStatement()) {
            try (ResultSet rs = st.executeQuery(sql)) {
                if (rs.next()) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error while check Email");
            return true;
        }
        return false;
    }

    @Override
    public boolean checkPhone(String phone) {
        String sql = "Select u.phone from user u where u.phone = '" + phone + "'";
        try (Connection con = GetConnection.getConnection(); Statement st = con.createStatement()) {
            try (ResultSet rs = st.executeQuery(sql)) {
                if (rs.next()) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error while check Phone");
            return true;
        }
        return false;
    }

    @Override
    public boolean checkUserName(String userName) {
        String sql = "Select u.username from user u where u.username = '" + userName + "'";
        try (Connection con = GetConnection.getConnection(); Statement st = con.createStatement()) {
            try (ResultSet rs = st.executeQuery(sql)) {
                if (rs.next()) {
                    return true;
                }
            }
        } catch (SQLException ex) {
            System.out.println("Error while check User Name");
            return true;
        }
        return false;
    }

    @Override
    public String createUser(User user) {
        StringBuilder sql = new StringBuilder("INSERT INTO user (userName, fullName, passWord, email, phone, status) \n"
                + " VALUES (?, ?, ?, ?, ?, ?)");
        try (Connection con = GetConnection.getConnection()) {
            con.setAutoCommit(false);
            try (PreparedStatement st = con.prepareStatement(sql.toString(), PreparedStatement.RETURN_GENERATED_KEYS)) {
                st.setString(1, user.getUserName());
                st.setString(2, user.getFullName());
                st.setString(3, user.getPassWord());
                st.setString(4, user.getEmail());
                st.setString(5, user.getPhone());
                st.setInt(6, user.getStatus());
                st.executeUpdate();
                try (ResultSet rs = st.getGeneratedKeys()) {
                    if (rs.next()) {
                        StringBuilder addUser_role = new StringBuilder("Insert into user_role (role_id, user_id) values (?, ?)");
                        try (PreparedStatement stRole = con.prepareStatement(addUser_role.toString())) {
                            stRole.setInt(1, 2);
                            stRole.setInt(2, rs.getInt(1));
                            stRole.executeUpdate();
                        }
                    }
                }
                con.commit();
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("Error in createUser");
        }
        return "Đăng ký thành công!";
    }

    public List<User> showInfoUsers() {
        List<User> users = new ArrayList<>();
        String sql = "SELECT u.* "
                + "FROM user u\n";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            try (ResultSet rs = st.executeQuery(sql)) {
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("user_id"));
                    user.setFullName(rs.getString("fullname"));
                    user.setUserName(rs.getString("username"));
                    user.setPhone(rs.getString("phone"));
                    user.setEmail(rs.getString("email"));
                    user.setStatus(rs.getInt("status"));
                    String sqlRole = "Select * from role r JOIN user_role ur ON ur.role_id = r.role_id WHERE ur.user_id = " + rs.getInt("user_id");
                    Statement stRole = con.createStatement();
                    List<Role> roles = new ArrayList<>();
                    ResultSet rsRoles = stRole.executeQuery(sqlRole);
                    while (rsRoles.next()) {
                        Role roleTmp = new Role();
                        roleTmp.setName(rsRoles.getString("name"));
                        roles.add(roleTmp);
                    }
                    if (roles.stream().map(it -> it.getName()).collect(Collectors.toList()).contains("Admin")) {
                        continue;
                    }
                    user.setRole(roles);
                    users.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public void deleteUser(int id) {
        String sql = "";
    }

    public void insertRoleManagerByUserId(int id) {
        String sql = "INSERT INTO user_role (role_id, user_id)\n"
                + "VALUES (3, ?);";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteRoleManagerByUserId(int id) {
        String sql = "DELETE FROM user_role WHERE role_id = 3 AND user_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateStatusByUserId(int id, int status) {
        String sql = "UPDATE user SET status = ? WHERE user_id = ?";
        try (Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
    }
}
