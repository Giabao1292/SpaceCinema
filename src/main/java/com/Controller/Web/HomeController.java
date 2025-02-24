/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.DTO.Response.MovieResponse;
import com.Model.Movie;
import com.Model.User;
import com.Repository.CinemaRepository;
import com.Repository.DateRepository;
import com.Repository.MovieRepository;
import com.Repository.TimeRepository;
import com.Repository.UserRepository;
import com.Repository.impl.CinemaRepositoryImpl;
import com.Repository.impl.DateRepositoryImpl;
import com.Repository.impl.MovieRepositoryImpl;
import com.Repository.impl.TimeRepositoryImpl;
import com.Repository.impl.UserRepositoryImpl;
import com.Utils.SessionUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author lebao
 */
@WebServlet(name = "HomeWebController", urlPatterns = {"/login", "/logout", "/home"})
public class HomeController extends HttpServlet {

    private CinemaRepository cinemaRepository = new CinemaRepositoryImpl();
    private MovieRepository movieRepository = new MovieRepositoryImpl();
    private UserRepository userRepository = new UserRepositoryImpl();
    private DateRepository dateRepository = new DateRepositoryImpl();
    private TimeRepository timeRepository = new TimeRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        request.setAttribute("status", request.getParameter("status"));
        if (action != null) {
            switch (action) {
                case "login":
                    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                    return;
                case "logout":
                    SessionUtils.getInstance().removeValue(request, "USER");
                    response.sendRedirect("/login?action=login");
                    return;
            }
        } else {
            String cinema = request.getParameter("cinema");
            String movie = request.getParameter("movie");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            PrintWriter out = response.getWriter();
            if (time != null && time != "") {
                request.setAttribute("time", time);
                return;
            } else if (date != null && date != "") {
                request.setAttribute("date", date);
                for (String timeDetail : timeRepository.findAll(cinema, movie, date)) {
                    out.println("<li>\n"
                            + "    <a class=\"dropdown-item\" data-movie=\"" + movie + "\" data-cinema=\"" + cinema + "\" data-time=\"" + timeDetail + "\" data-date=\"" + date + "\">\n"
                            + "        " + timeDetail + "\n"
                            + "    </a>\n"
                            + "</li>");
                }
                return;
            } else if (movie != null && movie != "") {
                request.setAttribute("movie", movie);
                for (String dateTime : dateRepository.findAll(cinema, movie)) {
                    out.println("<li>\n"
                            + "    <a class=\"dropdown-item\" data-movie=\"" + movie + "\" data-cinema=\"" + cinema + "\" data-time=\"" + time + "\" data-date=\"" + dateTime + "\">\n"
                            + "        " + dateTime + "\n"
                            + "    </a>\n"
                            + "</li>");
                }
                return;
            } else if (cinema != null && cinema != "") {
                request.setAttribute("cinema", cinema);
                for (MovieResponse movieTitle : movieRepository.findMovieByCinema(cinema)) {
                    out.println("<li>\n"
                            + "    <a class=\"dropdown-item\" data-movie=\"" + movieTitle.getTitle() + "\" data-cinema=\"" + cinema + "\" data-time=\"" + time + "\" data-date=\"" + date + "\">\n"
                            + "        " + movieTitle.getTitle() + "\n"
                            + "    </a>\n"
                            + "</li>");
                }
                return;
            }
            request.setAttribute("allMovie", movieRepository.findAllMovie());
            request.getRequestDispatcher("/views/web/home.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String username = request.getParameter("userName");
        String password = request.getParameter("passWord");
        User user = userRepository.findUserByNameAndPassword(username, password);
        if (user.getFullName() != null) {
            SessionUtils.getInstance().remainValue(request, "USER", user);
            if (User.isAdmin(user.getRole())) {
                SessionUtils.getInstance().remainValue(request, "role", "admin");
                response.sendRedirect("/admin-home");
                return;
            } else if (User.isUser(user.getRole())) {
                response.sendRedirect("/home");
                return;
            } else {
                response.sendRedirect("/admin-home");
                SessionUtils.getInstance().remainValue(request, "role", "manager");
                return;
            }
        }
        response.sendRedirect("/login?action=login&status=fail");
    }
}
