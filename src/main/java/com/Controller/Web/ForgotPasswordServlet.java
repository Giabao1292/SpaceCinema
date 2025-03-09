/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Model.User;
import com.Repository.UserRepository;
import com.Repository.impl.UserRepositoryImpl;
import com.Utils.MailUtil;
import com.Utils.PasswordUtil;
import com.Utils.SessionUtils;
import jakarta.mail.MessagingException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.Random;

/**
 *
 * @author lebao
 */
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgot-password", "/reset-password"})
public class ForgotPasswordServlet extends HttpServlet {

    private UserRepository userRepository = new UserRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        switch (action) {
            case "forgotPassword":
                request.getRequestDispatcher("/views/web/changePassword.jsp").forward(request, response);
                return;
        }
        response.sendRedirect("/login?action=login");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = action == null ? "" : action;
        switch (action) {
            case "forgotPassword":
                String email = request.getParameter("email");
                User user = userRepository.findUserByEmail(email);
                if (email == null || user.getFullName() == null) {
                    request.setAttribute("status", "invalid-email");
                    request.getRequestDispatcher("/views/web/changePassword.jsp").forward(request, response);
                    return;
                }
                String resetCode = generateResetCode();
                SessionUtils.getInstance().remainValue(request, "resetCode", resetCode);
                SessionUtils.getInstance().remainValue(request, "email", email);
                long expireTime = System.currentTimeMillis() + (5 * 60 * 1000);
                SessionUtils.getInstance().remainValue(request, "resetCodeExpired", expireTime);
                String subject = "OTP Verification Code";
                String content = "Your OTP code is: " + resetCode + ".The code is valid for 5 minutes.";
                try {
                    MailUtil.sendEmail(email, subject, content);
                    request.setAttribute("message", "A confirmation email has been sent. Please check your inbox!");
                } catch (MessagingException e) {
                    request.setAttribute("status", "Unable to send email. Please try again later.");
                }
                request.getRequestDispatcher("/views/web/resetPassword.jsp").forward(request, response);
                return;
            case "resetPassword":
                String resetCodeSaved = (String) SessionUtils.getInstance().getValue(request, "resetCode");
                String resetCodeClient = request.getParameter("resetCode");
                String emailSaved = (String) SessionUtils.getInstance().getValue(request, "email");
                String password = request.getParameter("newPassword");
                long expireTimeSaved = (Long) SessionUtils.getInstance().getValue(request, "resetCodeExpired");
                long currentTime = System.currentTimeMillis();
                if (currentTime < expireTimeSaved) {
                    if (resetCodeSaved.equalsIgnoreCase(resetCodeClient)) {
                        changePassWord(emailSaved, password);
                        SessionUtils.getInstance().removeValue(request, "resetCode");
                        SessionUtils.getInstance().removeValue(request, "email");
                        response.sendRedirect("/login?action=login&status=resetPassword");
                    } else {
                        request.setAttribute("status", "invalid-code");
                        request.getRequestDispatcher("/views/web/resetPassword.jsp").forward(request, response);
                        return;
                    }
                }
                else{
                    request.setAttribute("status", "code-expired");
                    request.getRequestDispatcher("/views/web/changePassword.jsp").forward(request, response);
                }
                return;
        }
    }

    private void changePassWord(String email, String password) {
        userRepository.changePassWord(email, PasswordUtil.hashPassword(password));
    }

    private String generateResetCode() {
        Random rand = new Random();
        return String.format("%06d", 10000 + rand.nextInt(99999));
    }
}
