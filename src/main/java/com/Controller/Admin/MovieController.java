/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Repository.impl.MovieRepositoryImpl;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author lebao
 */
@WebServlet(name = "ManageMovie", urlPatterns = {"/admin-home/movie"})
public class MovieController extends HttpServlet {

    private final MovieRepositoryImpl movieRes = new MovieRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        } else {
            switch (action) {
                case "create":
                    request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                    break;
                case "update":
                    request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                    break;
                case "delete":
                    request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                    break;
            }
        }
        request.getRequestDispatcher("/views/admin/movie/listMovie.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }
}
