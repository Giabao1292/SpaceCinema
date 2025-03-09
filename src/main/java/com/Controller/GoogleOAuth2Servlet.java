/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller;

import com.Model.User;
import com.Repository.UserRepository;
import com.Repository.impl.UserRepositoryImpl;
import com.Utils.PasswordUtil;
import com.Utils.SessionUtils;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.json.JSONObject;

/**
 *
 * @author lebao
 */
@WebServlet(name = "GoogleOAuth2Servlet", urlPatterns = {"/googleoAuth2"})
public class GoogleOAuth2Servlet extends HttpServlet {

    private UserRepository userRepository = new UserRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String error = request.getParameter("error");
        if ("access_denied".equals(error)) {
            response.sendRedirect("/login?action=login&status=denied");
            return;
        }
        String code = request.getParameter("code");
        if (code == null) {
            response.sendRedirect("/login?action=login&status=fail");
            return;
        }
        String clientId = getServletContext().getInitParameter("google.clientId");
        String clientSecret = getServletContext().getInitParameter("google.clientSecret");
        String redirectUri = getServletContext().getInitParameter("google.redirectUri");
        String tokenUrl = "https://oauth2.googleapis.com/token";
        String params = "code=" + code
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&redirect_uri=" + redirectUri
                + "&grant_type=authorization_code";
        String tokenResponse = sendPostRequest(tokenUrl, params);
        String accessToken = extractJsonValue(tokenResponse, "access_token");
        String userInfo = sendGetRequest("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken);
        String email = extractJsonValue(userInfo, "email");
        String name = extractJsonValue(userInfo, "name");
        User user = userRepository.findUserByEmail(email);
        if (user.getFullName() == null) {
            user = new User(0, email, name, PasswordUtil.hashPassword("qwasdcxzxr"), email, null, 1, null);
            userRepository.createUser(user);
            user = userRepository.findUserByEmail(email);
        }
        if (user.getFullName() != null && user.getStatus() == 1) {
            SessionUtils.getInstance().remainValue(request, "USER", user);
            if (User.isAdmin(user.getRole())) {
                SessionUtils.getInstance().remainValue(request, "role", "admin");
                response.sendRedirect("/admin-home");
                return;
            } else if (User.isManager(user.getRole())) {
                SessionUtils.getInstance().remainValue(request, "role", "manager");
                response.sendRedirect("/admin-home");
                return;
            } else {
                response.sendRedirect("/home");
                return;
            }
        }
        response.sendRedirect("/login?action=login&status=fail");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private String sendPostRequest(String url, String params) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("POST");
        con.setDoOutput(true);
        try (OutputStream os = con.getOutputStream()) {
            os.write(params.getBytes());
            os.flush();
        }
        return new String(con.getInputStream().readAllBytes());
    }

    private String sendGetRequest(String url) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");
        return new String(con.getInputStream().readAllBytes());
    }

    private String extractJsonValue(String json, String key) {
        try {
            JSONObject jsonObject = new JSONObject(json);
            return jsonObject.optString(key, null); // Trả về null nếu không tìm thấy key
        } catch (Exception e) {
            System.out.println("Error parsing JSON: " + e.getMessage());
            return null;
        }
    }

}
