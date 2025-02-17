/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Repository.MovieRepository;
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
@WebServlet(name = "BookTicketController", urlPatterns = {"/book-ticket"})
public class BookTicketController extends HttpServlet {

    private MovieRepository movieRepository = new MovieRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema = request.getParameter("cinema");
        String movie = request.getParameter("movie");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        if (movie == null || movie == "") {
            
        } else {

        }
        request.getRequestDispatcher("/views/web/ticket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
