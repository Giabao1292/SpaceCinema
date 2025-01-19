/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Model.Role;
import com.Model.User;
import com.Repository.UserRepository;
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

    private UserRepository userRepository = new UserRepositoryImpl();
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
        String action = request.getParameter("action");
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
        }
        request.getRequestDispatcher("/views/web/home.jsp").forward(request, response);
    }

    public boolean isAdmin(List<Role> role) {
        for (Role tmp : role) {
            if (tmp.getCode().equals("ADMIN")) {
                return true;
            }
        }
        return false;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String username = request.getParameter("userName");
        String password = request.getParameter("passWord");
        User user = userRepository.findUserByNameAndPassword(username, password);
        if (user != null) {
            SessionUtils.getInstance().remainValue(request, "USER", user);
            if (isAdmin(user.getRole())) {
                response.sendRedirect("/admin-home");
                return;
            } else {
                response.sendRedirect("/home");
                return;
            }
        }
        response.sendRedirect("/login?action=login");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
