/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Role;
import com.Model.User;
import com.Repository.UserRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class UserRepositoryImpl implements UserRepository{
    public void joinTable(StringBuilder sql){
        sql.append("SELECT u.fullname as fullname, u.username as username, u.password as password, r.code as code FROM user u ");
        sql.append("JOIN user_role ur ON u.user_id = ur.user_id ");
        sql.append("JOIN role r on r.role_id = ur.role_id ");
    }
    public void queryNormal(StringBuilder sql, String username, String password){
        sql.append("WHERE u.status = 1 AND username = '" + username + "'");
        sql.append(" AND password = '" + password + "'");
    }
    @Override
    public User findUserByNameAndPassword(String username, String password){
        StringBuilder sql = new StringBuilder("");
        joinTable(sql);
        queryNormal(sql, username, password);
        User userRes = new User();
        try(Connection connection = GetConnection.getConnection()){
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(sql.toString());
            while(rs.next()){
                User user = new User();
                user.setFullName(rs.getString("fullname"));
                user.setUserName(rs.getString("username"));
                user.setPassWord(rs.getString("password"));
                List<Role> roles = new ArrayList<>();
                Role tmp = new Role();
                tmp.setCode(rs.getString("code"));
                roles.add(tmp);
                while(rs.next()){
                    tmp.setCode(rs.getString("code"));
                    roles.add(tmp);
                }
                user.setRole(roles);
                userRes = user;
            }
        }
        catch(Exception e){
            System.out.println("Error find user");
        }
        return userRes;
    }
}
