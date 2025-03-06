/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Model.User;
import com.Repository.UserRepository;
import com.Repository.impl.UserRepositoryImpl;
import com.Utils.PasswordUtil;
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
@WebServlet(name = "RegisterController", urlPatterns = {"/register", "/change-pass"})
public class RegisterController extends HttpServlet {

    static final String PHONE_STRING = "^09[0|1][0-9]{7,8}$";
    static final String PHONE_COUNTRY = "^\\(84\\)\\+9[0|1][0-9]{7,8}$";
    private UserRepository userRepository = new UserRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("register")) {
            if (request.getParameter("email") != null) {
                request.setAttribute("email", request.getParameter("email"));
            }
            if (request.getParameter("phone") != null) {
                if (request.getParameter("phone").equals("Invalid")) {
                    request.setAttribute("phone", "Phone have to follow format 091xxxxxxxx, 090xxxxxxxx, (84)+91xxxxxxxx, (84)+90xxxxxxxx");
                } else {
                    request.setAttribute("phone", request.getParameter("phone"));
                }
            }
            if (request.getParameter("userName") != null) {
                request.setAttribute("userName", request.getParameter("userName"));
            }
            if (request.getParameter("status") != null) {
                request.setAttribute("status", request.getParameter("status"));
            }
            if (request.getParameter("passWord") != null) {
                request.setAttribute("passWord", "ConfirmPassword not similarly to Password");
            }
            request.getRequestDispatcher("/views/web/register.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/views/web/changepassword.jsp").forward(request, response);
        }
    }

    public String phoneValid(String phone) {
        if (phone.matches(PHONE_COUNTRY) || phone.matches(PHONE_STRING)) {
            if (phone.charAt(0) == '(') {
                phone = "0" + phone.substring(5);
            }
            return phone;
        }
        return null;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("register")) {
            String userName = request.getParameter("userName");
            String fullName = request.getParameter("lastName") + " " + request.getParameter("firstName");
            String passWord = request.getParameter("passWord");
            String confirmPassword = request.getParameter("confirmPassword");
            String email = request.getParameter("email");
            String phone = phoneValid(request.getParameter("phone"));
            int status = 1;
            if (phone == null) {
                response.sendRedirect("/register?action=register&phone=Invalid");
                return;
            }
            if (userRepository.checkEmail(email)) {
                response.sendRedirect("/register?action=register&email=Email exists");
                return;
            }
            if (userRepository.checkPhone(phone)) {
                response.sendRedirect("/register?action=register&phone=Phone exists");
                return;
            }
            if (userRepository.checkUserName(userName)) {
                response.sendRedirect("/register?action=register&userName=UserName exists");
                return;
            }
            if (!passWord.equals(confirmPassword)) {
                response.sendRedirect("/register?action=register&passWord=notsimilar");
                return;
            }
            User user = new User(0, userName, fullName, PasswordUtil.hashPassword(passWord), email, phone, status, null);
            userRepository.createUser(user);
            response.sendRedirect("/register?action=register&status=Register Successful!");
        } else {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
