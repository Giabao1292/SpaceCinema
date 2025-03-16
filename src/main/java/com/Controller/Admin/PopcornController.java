/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Model.Snack;
import com.Repository.impl.SnackRepositoryImpl;
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
@WebServlet(name = "ManagePopcorn", urlPatterns = {"/admin-home/popcorn"})
public class PopcornController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/views/admin/popcorn/createPopcorn.jsp").forward(request, response);
                break;
            case "update":
                SnackRepositoryImpl dao = new SnackRepositoryImpl();
                String id = request.getParameter("id");
                Snack snack = dao.findSnackById(id);
                request.setAttribute("snack", snack);
                request.getRequestDispatcher("/views/admin/popcorn/updatePopcorn.jsp").forward(request, response);
                break;
            case "delete":
                deleteSnack(request, response);
                break;
            default:
                showListSnack(request, response);
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
                createSnack(request, response);
                break;
            case "update":
                updateSnack(request, response);
                break;
            default:
                showListSnack(request, response);
                break;
        }
    }

    private void showListSnack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SnackRepositoryImpl dao = new SnackRepositoryImpl();
        List<Snack> snacks = dao.listAllSnacks();
        request.setAttribute("snacks", snacks);
        request.getRequestDispatcher("/views/admin/popcorn/listPopcorn.jsp").forward(request, response);
    }

    private void createSnack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String type = request.getParameter("type");
        SnackRepositoryImpl dao = new SnackRepositoryImpl();
        Snack snack = new Snack();
        snack.setName(name);
        snack.setPrice(price);
        dao.createSnack(snack, type);
        showListSnack(request, response);
    }

    private void updateSnack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        Double price = Double.parseDouble(request.getParameter("price"));
        String type = request.getParameter("type");
        SnackRepositoryImpl dao = new SnackRepositoryImpl();
        Snack snack = dao.findSnackById(id);
        snack.setName(name);
        snack.setPrice(price);
        dao.updateSnack(snack, type);
        showListSnack(request, response);
    }

    private void deleteSnack(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SnackRepositoryImpl dao = new SnackRepositoryImpl();
        String id = request.getParameter("id");
        dao.deleteSnack(id);
        showListSnack(request, response);
    }

}
