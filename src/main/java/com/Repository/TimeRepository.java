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
public interface TimeRepository {

    public List<String> findAll(String cinema, String movie, String date);
}
