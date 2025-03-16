/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Utils;

import com.Model.User;
import com.Repository.CinemaRepository;
import com.Repository.impl.CinemaRepositoryImpl;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author lebao
 */
@WebListener
public class CinemaContextListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    private CinemaRepository cinemaRepository = new CinemaRepositoryImpl();
    private static int activeUser = 0;
//    private static int totalLoggedUsers = 0;

    public static void decreaseActiveUser() {
        if (activeUser > 0) {
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
    public void attributeAdded(HttpSessionBindingEvent event) {
        if ("USER".equals(event.getName())) {
            Object userObj = event.getValue();
            if (userObj instanceof User) {
                User user = (User) userObj;
                if (User.isUser(user.getRole())) {
                    ServletContext context = event.getSession().getServletContext();
                    Integer totalLoggedUsers = (Integer) context.getAttribute("totalLoggedUsers");
                    if (totalLoggedUsers == null) {
                        totalLoggedUsers = 0;
                    }
                    totalLoggedUsers++;
                    context.setAttribute("totalLoggedUsers", totalLoggedUsers);
                }
            }
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        sce.getServletContext().setAttribute("listCinema", cinemaRepository.findAll());
        sce.getServletContext().setAttribute("activeUser", activeUser);
        sce.getServletContext().setAttribute("totalLoggedUsers", 0);
    }

}
