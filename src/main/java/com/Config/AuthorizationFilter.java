/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Config;

import com.Model.User;
import com.Utils.SessionUtils;
import jakarta.servlet.*;
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
        HttpServletRequest request = (HttpServletRequest)requestServlet;
        HttpServletResponse response = (HttpServletResponse)responseServlet;
        String URL = request.getRequestURI();
        if(URL.startsWith("/admin")){
            User user = (User)SessionUtils.getInstance().getValue(request, "USER");
            if(user != null){
                if(User.isAdmin(user.getRole()) || User.isManager(user.getRole())){
                    chain.doFilter(requestServlet, responseServlet);
                    return;
                }
                response.sendRedirect("/home?status=not_permission");
                return;
            }
            response.sendRedirect("/login?action=login&status=login_first");
            return;
        }
        else{
            chain.doFilter(requestServlet, responseServlet);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
