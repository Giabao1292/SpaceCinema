/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository;

import java.util.List;

/**
 *
 * @author lebao
 */
public interface StatusRepository {
    public List<String> findAllStatus();
    public int findStatusByName(String name);
}
