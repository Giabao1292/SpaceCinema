/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

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

/**
 *
 * @author LAPTOP ASUS
 */
@WebServlet(name = "ProfileController", urlPatterns = {"/profile"})
public class ProfileController extends HttpServlet {
    private UserRepository userRepository = new UserRepositoryImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) SessionUtils.getInstance().getValue(request, "USER");
        request.setAttribute("USER", user);
        request.getRequestDispatcher("/views/web/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null) {
            switch (action) {
                case "info":
                    int id = Integer.parseInt(request.getParameter("id"));
                    String fullName = request.getParameter("fullName");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    User user = userRepository.findUserById(id);
                    user.setFullName(fullName);
                    user.setEmail(email);
                    user.setPhone(phone);
                    userRepository.updateUserInfo(user, id);
                    SessionUtils.getInstance().remainValue(request, "USER", user);
                    response.sendRedirect("/profile");
                    break;
                case "pass":
                    
                    break;
                default:
                    throw new AssertionError();
            }
        }
    }

}
