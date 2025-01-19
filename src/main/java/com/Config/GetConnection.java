/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
public class GetConnection {

    static final String URL = "jdbc:mysql://localhost:3306/SpaceCinema";
    static final String USER = "root";
    static final String PASS = "123456";

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection(URL, USER, PASS);
            return connection;
        } catch (SQLException e) {
            System.out.println("Error connection to mysql");

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(GetConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
