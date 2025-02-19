/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Utils;

import com.Repository.CinemaRepository;
import com.Repository.impl.CinemaRepositoryImpl;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author lebao
 */


@WebListener
public class CinemaContextListener implements ServletContextListener {
    private CinemaRepository cinemaRepository = new CinemaRepositoryImpl();
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("listCinema", cinemaRepository.findAll());
    }
}
