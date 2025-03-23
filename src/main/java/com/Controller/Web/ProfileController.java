/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Model.User;
import com.Repository.UserRepository;
import com.Repository.impl.UserRepositoryImpl;
import com.Utils.PasswordUtil;
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
        String status = request.getParameter("status");
        if(status != null){
            request.setAttribute("status", status);
        }
        request.getRequestDispatcher("/views/web/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        SessionUtils session = SessionUtils.getInstance();
        User user = (User)session.getValue(request, "USER");
        if (action != null) {
            switch (action) {
                case "info":
                    int id = Integer.parseInt(request.getParameter("id"));
                    String fullName = request.getParameter("fullName");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");
                    User userInfo = userRepository.findUserById(id);
                    userInfo.setFullName(fullName);
                    userInfo.setEmail(email);
                    userInfo.setPhone(phone);
                    userRepository.updateUserInfo(userInfo, id);
                    SessionUtils.getInstance().remainValue(request, "USER", userInfo);
                    response.sendRedirect("/profile");
                    break;
                case "pass":
                    String currentPassword = request.getParameter("currentPassword");
                    User userPass = userRepository.findUserByNameAndPassword(user.getUserName(), currentPassword);
                    String newPassword = request.getParameter("newPassword");
                    if(userPass != null && userPass.getFullName() != null){
                        userRepository.changePassWord(user.getEmail(), PasswordUtil.hashPassword(newPassword));
                    }
                    else{
                        response.sendRedirect("/profile?status=failed");
                        return;
                    }
                    response.sendRedirect("/profile?status=success");
                    break;
                default:
                    throw new AssertionError();
            }
        }
    }

}
