/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Config.Format;
import com.DTO.Response.MovieResponse;
import com.Model.Seat;
import com.Model.Snack;
import com.Model.Theatre;
import com.Repository.CinemaRepository;
import com.Repository.MovieRepository;
import com.Repository.SeatRepository;
import com.Repository.SnackRepository;
import com.Repository.TheatreRepository;
import com.Repository.impl.CinemaRepositoryImpl;
import com.Repository.impl.MovieRepositoryImpl;
import com.Repository.impl.SeatRepositoryImpl;
import com.Repository.impl.SnackRepositoryImpl;
import com.Repository.impl.TheatreRepositoryImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

import java.text.ParseException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
@WebServlet(name = "BookTicketController", urlPatterns = {"/book-ticket"})
public class BookTicketController extends HttpServlet {

    private SeatRepository seatRepository = new SeatRepositoryImpl();
    private SnackRepository snackRepository = new SnackRepositoryImpl();
    private MovieRepository movieRepository = new MovieRepositoryImpl();
    private CinemaRepository cinemaRepository = new CinemaRepositoryImpl();
    private TheatreRepository theatreRepository = new TheatreRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema = request.getParameter("cinema");
        String movie = request.getParameter("movie");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        LinkedHashMap<String, List<Snack>> snackList = snackRepository.findAllSnack();
        request.setAttribute("snackList", snackList);
        if (cinema == null) {
            cinema = cinemaRepository.findCinemaByMovie(movie).getFirst().getName();
        }
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
                    try {
                        request.setAttribute("date", Format.Date(Format.fm.parse(date)));
                        date = Format.fm2.format(Format.fm.parse(date));
                    } catch (ParseException ex) {
                        Logger.getLogger(BookTicketController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                if (time != null) {
                    Theatre theatre = theatreRepository.getTheatre(cinema, movieRepository.getMovieId(movie), date, time);
                    List<Seat> seatList = seatRepository.getSeatType(theatre.getId(), time, date, movieRepository.getMovieId(movie));
                    request.setAttribute("theatre", theatre);
                    request.setAttribute("seatList", seatList);
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
        String time = request.getParameter("time");
        String action = request.getParameter("action");

        StringBuilder sbTime = new StringBuilder();
        StringBuilder dateBtn = new StringBuilder();

        MovieResponse movieResponse = movieRepository.findMovieByNameAndCinema(movie, cinema);
        boolean isFirst = true;
        if ("cinemaBtn".equalsIgnoreCase(action) || "dateBtn".equalsIgnoreCase(action)) {
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
                sbTime.append("<a class='timeBtn btn text-black mt-2 me-2 btn-warning border border-warning' ")
                        .append("data-time='").append(timeRes).append("' ")
                        .append("data-cinema='").append(cinema).append("' ")
                        .append("data-movie='").append(movie).append("' ")
                        .append("data-date='").append(date).append("'>")
                        .append(timeRes).append("</a>");
            }
        }
        String jsonResponse = null;
        if ("timeBtn".equalsIgnoreCase(action)) {
            try {
                jsonResponse = GetTheatreAndTicket(request, cinema, movieRepository.getMovieId(movie), Format.fm2.format(Format.fm.parse(date)), time);
            } catch (ParseException ex) {
                Logger.getLogger(BookTicketController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            jsonResponse = "{"
                    + "\"showTime\": \"" + escapeJson(sbTime.toString()) + "\","
                    + "\"dateBtn\": \"" + escapeJson(dateBtn.toString()) + "\""
                    + "}";
        }
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);
    }
    public String GetTheatreAndTicket(HttpServletRequest request, String cinema, String movieId, String datetime, String timedetail) {
        Theatre theatre = theatreRepository.getTheatre(cinema, movieId, datetime, timedetail);
        List<Seat> seatList = seatRepository.getSeatType(theatre.getId(), timedetail, datetime, movieId);
        StringBuilder seatHtml = new StringBuilder();
        for (Seat seat : seatList) {
            seatHtml.append("<div class='col-md-6 fs-5'>")
                    .append("<div class='card p-3 mb-3'>")
                    .append("<h5 class='text-black'>ADULT</h5>")
                    .append("<p><strong>").append(escapeJson(seat.getType())).append("</strong></p>")
                    .append("<p class='text-danger'>").append(seat.getPrice()).append(" VND</p>")
                    .append("<p class='text-success'>Available slots: <strong>").append(seat.getQuantity()).append("</strong></p>")
                    .append("<input type='hidden' name='seatId' value ='").append(seat.getId()).append("' />")
                    .append("<input type='number' name='seatQuantity' class='form-control border-warning' min='0' max = '" + seat.getQuantity() + "' value='0'>")
                    .append("</div>")
                    .append("</div>");
        }
        seatHtml.append("<input type='hidden' name='movie' value='").append(request.getParameter("movie")).append("' />")
                .append("<input type='hidden' name='cinema' value='").append(request.getParameter("cinema")).append("' />")
                .append("<input type='hidden' name='date' value='").append(request.getParameter("date")).append("' />")
                .append("<input type='hidden' name='theatre' value='").append(theatre.getTheatre_num()).append("' />")
                .append("<input type='hidden' name='time' value='").append(request.getParameter("time")).append("' />");
        String theatreHtml = "<h1><i class='fa-solid fa-film'></i> Theatre " + escapeJson(theatre.getTheatre_num()) + "</h1>";
        String json = "{"
                + "\"theatreHtml\": \"" + escapeJson(theatreHtml) + "\","
                + "\"seatHtml\": \"" + escapeJson(seatHtml.toString()) + "\""
                + "}";
        return json;
    }

    private String escapeJson(String value) {
        return value.replace("\"", "\\\"")
                .replace("\n", "\\n")
                .replace("\r", "\\r");
    }
}
