/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.Controller.Web;

import com.Model.Snack;
import com.Repository.SnackRepository;
import com.Repository.impl.SnackRepositoryImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author lebao
 */
@WebServlet(name="PopcornController", urlPatterns={"/popcorn-drink"})
public class PopcornController extends HttpServlet {
    private SnackRepository snackRepository = new SnackRepositoryImpl();

   @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {  
        LinkedHashMap<String, List<Snack>> snackList = snackRepository.findAllSnack();
        request.setAttribute("snackList", snackList);
        request.getRequestDispatcher("views/web/popcorn.jsp").forward(request, response);
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }
}
