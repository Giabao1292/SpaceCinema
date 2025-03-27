/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Config;

import com.Model.Cart;
import com.Model.User;
import com.Utils.SessionUtils;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author lebao
 */
public class AuthorizationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest requestServlet, ServletResponse responseServlet, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) requestServlet;
        HttpServletResponse response = (HttpServletResponse) responseServlet;
        String serverName = request.getServerName();
        SessionUtils session = SessionUtils.getInstance();
        session.remainValue(request, "redirect_urigoogle", "http://localhost:8080/googleoAuth2");
        session.remainValue(request, "redirect_urifacebook", "http://localhost:8080/facebookoAuth2");
        if (serverName.equalsIgnoreCase("spacecinema.ddns.net")) {
            session.remainValue(request, "redirect_urigoogle", "http://spacecinema.ddns.net:8080/googleoAuth2");
            session.remainValue(request, "redirect_urifacebook", "http://spacecinema.ddns.net:8080/facebookoAuth2");
        }
        String URL = request.getRequestURI();
        if (URL.startsWith("/admin")) {
            User user = (User) SessionUtils.getInstance().getValue(request, "USER");
            if (user != null) {
                if (User.isAdmin(user.getRole()) || User.isManager(user.getRole())) {
                    chain.doFilter(requestServlet, responseServlet);
                    return;
                }
                response.sendRedirect("/home?status=not_permission");
                return;
            }
            response.sendRedirect("/login?action=login&status=login_first");
            return;
        } else if (URL.startsWith("/login")) {
            User user = (User) SessionUtils.getInstance().getValue(request, "USER");
            if (user != null) {
                if (User.isAdmin(user.getRole()) || User.isManager(user.getRole())) {
                    response.sendRedirect("/admin-home");
                    return;
                } else {
                    response.sendRedirect("/home");
                    return;
                }
            }
            chain.doFilter(requestServlet, responseServlet);
        } else if (URL.startsWith("/cart")) {
            User user = (User) SessionUtils.getInstance().getValue(request, "USER");
            if (user != null) {
                chain.doFilter(requestServlet, responseServlet);
                return;
            }
            response.sendRedirect("/login?action=login&status=login_first");
            return;
        } else if (URL.startsWith("/checkout") || URL.startsWith("/order")) {
            Cart cart = (Cart) SessionUtils.getInstance().getValue(request, "cart");
            if (cart == null || (cart != null && cart.getSeats().size() == 0 && cart.getSnacks().size() == 0)) {
                response.sendRedirect("/home");
            } else {
                chain.doFilter(requestServlet, responseServlet);
            }
        } else {
            chain.doFilter(requestServlet, responseServlet);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
