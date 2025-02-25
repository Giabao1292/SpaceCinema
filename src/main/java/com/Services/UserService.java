/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Services;

import com.Model.User;

/**
 *
 * @author lebao
 */
public interface UserService {
    public User getUser(String password, String username);
}
