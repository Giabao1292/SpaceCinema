/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.DTO.Response.MovieResponse;
import com.Model.User;
import com.Repository.BookingRepository;
import com.Repository.CinemaRepository;
import com.Repository.DateRepository;
import com.Repository.MovieRepository;
import com.Repository.TimeRepository;
import com.Repository.UserRepository;
import com.Repository.VoucherRepository;
import com.Repository.impl.BookingRepositoryImpl;
import com.Repository.impl.CinemaRepositoryImpl;
import com.Repository.impl.DateRepositoryImpl;
import com.Repository.impl.MovieRepositoryImpl;
import com.Repository.impl.TimeRepositoryImpl;
import com.Repository.impl.UserRepositoryImpl;
import com.Repository.impl.VoucherRepositoryImpl;
import com.Utils.SessionUtils;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
    private BookingRepository bookingRepository = new BookingRepositoryImpl();
    private VoucherRepository voucherRepository = new VoucherRepositoryImpl();
    private static final int COOKIE_MAX_AGE = 60 * 60 * 24 * 30;

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
                    Cookie[] cookies = request.getCookies();
                    if (cookies != null) {
                        for (Cookie cookie : cookies) {
                            if ("username".equals(cookie.getName())) {
                                request.setAttribute("username", cookie.getValue());
                            } else if ("password".equals(cookie.getName())) {
                                request.setAttribute("password", cookie.getValue());
                            }
                        }
                    }
                    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                    return;
                case "logout":
                    SessionUtils.getInstance().removeValue(request, "USER");
                    response.sendRedirect("/login?action=login");
                    return;
                default:
                    request.getRequestDispatcher("/views/web/home.jsp").forward(request, response);
                    break;
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
            request.setAttribute("allMovie", movieRepository.findAllMovie("now showing"));
            request.setAttribute("comingSoonMovie", movieRepository.findAllMovie("coming soon"));
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
        String rememberMe = request.getParameter("rememberMe");
        User user = userRepository.findUserByNameAndPassword(username, password);
        if (user != null && user.getFullName() != null) {
            SessionUtils.getInstance().remainValue(request, "USER", user);
            SessionUtils.getInstance().remainValue(request, "bookings", bookingRepository.getBookingResponsesByUser(user.getId()));
            if (rememberMe != null && rememberMe.equalsIgnoreCase("on")) {
                Cookie uCookie = new Cookie("username", username);
                Cookie pCookie = new Cookie("password", password);
                uCookie.setMaxAge(COOKIE_MAX_AGE);
                pCookie.setMaxAge(COOKIE_MAX_AGE);
                response.addCookie(pCookie);
                response.addCookie(uCookie);
            }
            if (User.isAdmin(user.getRole())) {
                SessionUtils.getInstance().remainValue(request, "role", "admin");
                response.sendRedirect("/admin-home");
                return;
            } else if (User.isUser(user.getRole())) {
                SessionUtils.getInstance().remainValue(request, "voucherList", voucherRepository.getAllVoucherByUserId(user.getId()));
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
