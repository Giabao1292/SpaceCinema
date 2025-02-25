/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Cinema;
import com.Repository.CinemaRepository;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class CinemaRepositoryImpl implements CinemaRepository{

    @Override
    public List<Cinema> findAll(){
        List<Cinema> cinemas = new ArrayList<>();
        try(Connection connection = GetConnection.getConnection()){
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery("Select cinema_name as name From cinema");
            while(rs.next()){
                Cinema cinema = new Cinema(rs.getString("name"));
                cinemas.add(cinema);
            }
        }
        catch(SQLException e){
            e.printStackTrace();
            System.out.println("Cinema error");
        }
        return cinemas;
    }
}
