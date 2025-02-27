/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Config.Format;
import com.DTO.Response.MovieResponse;
import com.Repository.impl.MovieRepositoryImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
        }
        switch (action) {
            case "create":
                List<String> listDate = getListDate(new ArrayList<>());
                request.setAttribute("listDate", listDate);
                request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                break;
            case "update":
                request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                break;
            case "delete":
                request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createMovie(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void showListMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MovieResponse> movies = movieRes.findAllMovie("now showing");
        movies.addAll(movieRes.findAllMovie("coming soon"));
        request.setAttribute("movies", movies);
        request.getRequestDispatcher("/views/admin/movie/listMovie.jsp").forward(request, response);
    }

    private void createMovie(HttpServletRequest request, HttpServletResponse response) {
        
    }
    
    private List<String>  getListDate(List<String> listDate){
        Calendar calendar = Calendar.getInstance();
        Date today = calendar.getTime();
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        Date tomorrow = calendar.getTime();
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        Date dayAfterTomorrow = calendar.getTime();
        listDate.add(Format.Date(today));
        listDate.add(Format.Date(tomorrow));
        listDate.add(Format.Date(dayAfterTomorrow));
        return listDate;
    }
}