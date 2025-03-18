/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Model.User;
import com.Model.Voucher;
import com.Repository.impl.UserRepositoryImpl;
import com.Repository.impl.VoucherRepositoryImpl;
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
 * @author LAPTOP ASUS
 */
@WebServlet(name = "VoucherController", urlPatterns = {"/admin-home/voucher"})
public class VoucherController extends HttpServlet {

    private VoucherRepositoryImpl daoVoucher = new VoucherRepositoryImpl();
    private UserRepositoryImpl daoUser = new UserRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                List<User> users = daoUser.showInfoUsers();
                request.setAttribute("users", users);
                request.getRequestDispatcher("/views/admin/voucher/createVoucher.jsp").forward(request, response);
                break;
            case "update":
                goUpdateVoucher(request, response);
                break;
            case "delete":
                deleteVoucher(request, response);
                break;
            default:
                showListVoucher(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createVoucher(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void showListVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voucher> vouchers = daoVoucher.getListVoucher();
        request.setAttribute("vouchers", vouchers);
        request.getRequestDispatcher("/views/admin/voucher/listVoucher.jsp").forward(request, response);
    }

    private void goUpdateVoucher(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        request.getRequestDispatcher("/views/admin/voucher/updateVoucher.jsp");
    }

    private void deleteVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        daoVoucher.deleteVoucherById(id);
        response.sendRedirect("/admin-home/voucher");
    }

    private void createVoucher(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voucherName = request.getParameter("voucherName");
        String description = request.getParameter("description");
        int discount = Integer.parseInt(request.getParameter("discount"));
        Voucher voucher = new Voucher();
        voucher.setName(voucherName);
        voucher.setDiscount(discount);
        voucher.setDescription(description);
        int voucherId = daoVoucher.addVoucher(voucher);
        if (voucherId > 0) {
            String[] userIds = request.getParameterValues("userId");
            for (String idStr : userIds) {
                int id = Integer.parseInt(idStr);
                daoVoucher.addUserVoucher(id, voucherId);
            }
            response.sendRedirect("/admin-home/voucher");
        }
        else {
            String message = "Add voucher failed";
            request.setAttribute("message", message);
            request.getRequestDispatcher("/views/admin/voucher/createVoucher.jsp");
        }
    }
}
