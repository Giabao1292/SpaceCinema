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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author lebao
 */
@WebListener
public class CinemaContextListener implements ServletContextListener, HttpSessionListener {

    private CinemaRepository cinemaRepository = new CinemaRepositoryImpl();
    private static int activeUser = 0;
    public static void decreaseActiveUser(){
        if(activeUser > 0){
            activeUser--;
        }
    }
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        activeUser++;
        se.getSession().getServletContext().setAttribute("activeUser", activeUser);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        if (activeUser > 0) {
            activeUser--;
        }
        se.getSession().getServletContext().setAttribute("activeUser", activeUser);
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("listCinema", cinemaRepository.findAll());
        sce.getServletContext().setAttribute("activeUser", activeUser);
    }

}
