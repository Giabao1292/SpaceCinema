/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HomeController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HomeController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

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
            request.setAttribute("listCinema", cinemaRepository.findAll());
            if (cinema != null) {
                request.setAttribute("cinema", cinema);
                request.setAttribute("listMovie", movieRepository.findMovieByCinema(cinema));
            }
            if(movie != null) {
                request.setAttribute("movie", movie);
                request.setAttribute("listDate", dateRepository.findAll(cinema, movie));
            }
            if(date != null){
                request.setAttribute("date", date);
                request.setAttribute("listTime", timeRepository.findAll(cinema, movie, date));
            }
            if(time != null){
                request.setAttribute("time", time);
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
                response.sendRedirect("/admin-home");
                return;
            } else if (User.isUser(user.getRole())) {
                response.sendRedirect("/home");
                return;
            }
        }
        response.sendRedirect("/login?action=login&status=fail");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
