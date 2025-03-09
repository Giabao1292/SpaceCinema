package com.Controller;

import com.Model.User;
import com.Repository.UserRepository;
import com.Repository.impl.UserRepositoryImpl;
import com.Utils.PasswordUtil;
import com.Utils.SessionUtils;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONObject;

@WebServlet(name = "FacebookOAuth2Servlet", urlPatterns = {"/facebookoAuth2"})
public class FacebookOAuth2Servlet extends HttpServlet {

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
        String clientId = getServletContext().getInitParameter("facebook.clientId");
        String clientSecret = getServletContext().getInitParameter("facebook.clientSecret");
        String redirectUri = getServletContext().getInitParameter("facebook.redirectUri");
        String tokenUrl = "https://graph.facebook.com/v12.0/oauth/access_token";
        String params = "client_id=" + clientId
                + "&redirect_uri=" + redirectUri
                + "&client_secret=" + clientSecret
                + "&code=" + code;
        String tokenResponse = sendGetRequest(tokenUrl + "?" + params);
        String accessToken = extractJsonValue(tokenResponse, "access_token");
        if (accessToken == null) {
            response.sendRedirect("/login?action=login&status=fail");
            return;
        }
        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken;
        String userInfo = sendGetRequest(userInfoUrl);
        String email = extractJsonValue(userInfo, "email");
        String name = extractJsonValue(userInfo, "name");
        if (email == null) {
            response.sendRedirect("/login?action=login&status=fail");
            return;
        }
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

    private String sendGetRequest(String url) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");
        return new String(con.getInputStream().readAllBytes());
    }

    private String extractJsonValue(String json, String key) {
        try {
            JSONObject jsonObject = new JSONObject(json);
            return jsonObject.optString(key, null);
        } catch (Exception e) {
            System.out.println("Error parsing JSON: " + e.getMessage());
            return null;
        }
    }
}
