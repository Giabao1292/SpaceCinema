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
        if (movie == null || movie.equals("null") || movie == "" || movie.equalsIgnoreCase("undefined")) {
            List<MovieResponse> movies = movieRepository.findMovieByCinema(cinema);
            request.setAttribute("movieCinema", movies);
        } else {
            MovieResponse movieResponse = movieRepository.findMovieByNameAndCinema(movie, cinema);
            if (date == null || date.equals("null") || date == "" || date.equalsIgnoreCase("undefined")) {
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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String cinema = request.getParameter("cinema");
        String movie = request.getParameter("movie");
        String date = request.getParameter("date");
        String action = request.getParameter("action");

        StringBuilder sbTime = new StringBuilder();
        StringBuilder dateBtn = new StringBuilder();

        MovieResponse movieResponse = movieRepository.findMovieByNameAndCinema(movie, cinema);
        boolean isFirst = true;
        if ("cinemaBtn".equalsIgnoreCase(action)) {
            for (String dateRes : movieResponse.getTimes().keySet()) {
                dateBtn.append("<div class=\"col-sm-2 p-0 m-0\">\n")
                        .append("<button class=\"dateBtn btn btn-warning text-black pt-3 pb-3 m-0 ")
                        .append(isFirst ? "active" : "")
                        .append("\" data-movie=\"").append(movieResponse.getTitle())
                        .append("\" data-date=\"").append(dateRes)
                        .append("\" data-cinema=\"").append(cinema)
                        .append("\">").append(dateRes)
                        .append("</button>\n")
                        .append("</div>");
                if (isFirst) {
                    isFirst = false;
                    date = dateRes;
                }
            }
        }
        
        for (String timeRes : movieResponse.getTimes().get(date)) {
            sbTime.append("<a class='btn text-warning border border-warning' ")
                    .append("data-time='").append(timeRes).append("' ")
                    .append("data-cinema='").append(cinema).append("' ")
                    .append("data-movie='").append(movie).append("' ")
                    .append("data-date='").append(date).append("'>")
                    .append(timeRes).append("</a>");
        }

        String jsonResponse = "{"
                + "\"showTime\": \"" + escapeJson(sbTime.toString()) + "\","
                + "\"dateBtn\": \"" + escapeJson(dateBtn.toString()) + "\""
                + "}";

        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
    }

    private String escapeJson(String value) {
        return value.replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
    }
}
