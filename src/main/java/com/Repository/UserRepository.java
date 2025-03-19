/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository;

import com.Model.User;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface UserRepository {
    public boolean checkEmail(String email);
    public boolean checkUserName(String userName);
    public boolean checkPhone(String phone);
    public User findUserByNameAndPassword(String username, String password);
    public String createUser(User user);
    public User findUserByEmail(String email);
    public boolean changePassWord(String email, String password);
    public void updateUserInfo(User user, int user_id);
    User findUserById(int user_id);
}
