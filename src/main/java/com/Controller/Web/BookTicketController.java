/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Config.Format;
import com.DTO.Response.MovieResponse;
import com.Repository.MovieRepository;
import com.Repository.impl.MovieRepositoryImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

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
        request.setAttribute("cinema", cinema);
        request.setAttribute("movie", movie);
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        request.setAttribute("cinema", cinema);
        if (movie.equals("null") || movie == "" || movie.equalsIgnoreCase("undefined")) {
            List<MovieResponse> movies = movieRepository.findMovieByCinema(cinema);
            request.setAttribute("movieCinema", movies);
        } else {
            MovieResponse movieResponse = movieRepository.findMovieByName(movie);
            if (date.equals("null") || date == "" || date.equalsIgnoreCase("undefined")) {
                request.setAttribute("date", movieResponse.getTimes().entrySet().iterator().next().getKey());
            } else {
                try {
                    request.setAttribute("date", Format.Date(Format.fm2.parse(date)));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
            request.setAttribute("movie", movieResponse);
            request.getRequestDispatcher("/views/web/booking.jsp").forward(request, response);
            return;
        }
        request.getRequestDispatcher("/views/web/ticket.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema = request.getParameter("cinema");
        String movie = request.getParameter("movie");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String action = request.getParameter("action");
        request.setAttribute("cinema", cinema);
        request.setAttribute("movie", movie);
        request.setAttribute("date", date);
        request.setAttribute("time", time);
        PrintWriter out = response.getWriter();
        if (action.equalsIgnoreCase("dateBtn")) {
            MovieResponse movieResponse = movieRepository.findMovieByName(movie);
            for (String timeRes : movieResponse.getTimes().get(date)) {
                out.print("<a class='btn text-warning border border-warning data-time = " + timeRes + "'>" + timeRes + "</a>");
            }
            return;
        } else if (action.equalsIgnoreCase("cinemaBtn")) {
            
        }
    }
}
