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
    public User findUserByNameAndPassword(String username, String password);
    
}
