/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Model.User;
import com.Repository.impl.UserRepositoryImpl;
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
@WebServlet(name = "ManageUser", urlPatterns = {"/admin-home/user"})
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //action

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/views/admin/user/createUser.jsp").forward(request, response);
                break;
            case "update":
                goUpdateUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                showListUser(request, response);
                break;
        }

//        request.getRequestDispatcher("/views/admin/user/listUser.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void goUpdateUser(HttpServletRequest request, HttpServletResponse response) {
        
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    private void showListUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserRepositoryImpl dao = new UserRepositoryImpl();
        List<User> users = dao.showInfoUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/views/admin/user/listUser.jsp").forward(request, response);
    }

}
