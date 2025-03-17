/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Model.Booking;
import com.Model.User;
import com.Repository.impl.BookingRepositoryImpl;
import com.Utils.SessionUtils;
import jakarta.servlet.RequestDispatcher;
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
@WebServlet(name = "HomeAdminController", urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookingRepositoryImpl dao = new BookingRepositoryImpl();
        int revenue = dao.getTotalPriceBooking();
        request.setAttribute("revenue", revenue);
        List<Booking> booking = dao.listUserBooking();
        request.setAttribute("booking", booking);
        RequestDispatcher ds = request.getRequestDispatcher("/views/admin/home.jsp");
        ds.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
