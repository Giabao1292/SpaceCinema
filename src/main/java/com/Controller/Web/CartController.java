/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Model.Cart;
import com.Model.Seat;
import com.Model.Snack;
import com.Model.User;
import com.Model.Voucher;
import com.Repository.SeatRepository;
import com.Repository.SnackRepository;
import com.Repository.VoucherRepository;
import com.Repository.impl.SeatRepositoryImpl;
import com.Repository.impl.SnackRepositoryImpl;
import com.Repository.impl.VoucherRepositoryImpl;
import com.Services.CartService;
import com.Services.impl.CartServiceImpl;
import com.Utils.SessionUtils;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.stream.Collectors;

/**
 *
 * @author lebao
 */
@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    private SnackRepository snackRepository = new SnackRepositoryImpl();
    private SeatRepository seatRepository = new SeatRepositoryImpl();
    private CartService cartService = new CartServiceImpl();
    private VoucherRepository voucherRepository = new VoucherRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("views/web/cart/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cinema = request.getParameter("cinema") != null ? request.getParameter("cinema").trim() : "";
        String movie = request.getParameter("movie") != null ? request.getParameter("movie").trim() : "";
        String date = request.getParameter("date") != null ? request.getParameter("date").trim() : "";
        String time = request.getParameter("time") != null ? request.getParameter("time").trim() : "";
        String theatre = request.getParameter("theatre") != null ? request.getParameter("theatre").trim() : "";
        String[] seatIds = request.getParameterValues("seatId");
        String[] snackIds = request.getParameterValues("snackId");
        String[] seatQuantityList = request.getParameterValues("seatQuantity");
        String[] snackQuantityList = request.getParameterValues("snackQuantity");
        List<Integer> seatQuantitys = new ArrayList<>();
        List<Integer> snackQuantitys = new ArrayList<>();
        if (seatQuantityList != null && seatQuantityList.length > 0) {
            seatQuantitys = Arrays.stream(seatQuantityList).map(Integer::parseInt).collect(Collectors.toList());
        }
        if (snackQuantityList != null && snackQuantityList.length > 0) {
            snackQuantitys = Arrays.stream(snackQuantityList).map(Integer::parseInt).collect(Collectors.toList());
        }
        SessionUtils session = SessionUtils.getInstance();
        Cart cart = (Cart) session.getValue(request, "cart");
        if (cart == null) {
            cart = new Cart();
        }
        String action = request.getParameter("action");
        switch (action) {
            case "add":
                if (seatIds != null && seatIds.length > 0) {
                    for (int i = 0; i < seatIds.length; i++) {
                        String seatId = seatIds[i];
                        int seatQuantity = seatQuantitys.get(i);
                        if (seatQuantity > 0) {
                            Seat seat = seatRepository.getSeatById(seatId);
                            if (seat != null) {
                                cartService.addSeat(cart, seat, seatQuantity, movie, cinema, date + " at " + time, theatre);
                            }
                        }
                    }
                }
                if (snackIds != null && snackIds.length > 0) {
                    for (int i = 0; i < snackIds.length; i++) {
                        String snackId = snackIds[i];
                        int snackQuantity = snackQuantitys.get(i);
                        if (snackQuantity > 0) {
                            Snack snack = snackRepository.getSnackById(snackId);
                            if (snack != null) {
                                cartService.addSnack(cart, snack, snackQuantity, cinema);
                            }
                        }
                    }
                }
                break;
            case "update":
                if (seatIds != null && seatIds.length > 0) {
                    for (int i = 0; i < seatIds.length; i++) {
                        String seatId = seatIds[i];
                        int seatQuantity = seatQuantitys.get(i);
                        if (seatQuantity > 0) {
                            cartService.updateSeat(cart, seatId, seatQuantity);
                        } else {
                            cartService.deleteSeat(cart, seatId);
                        }
                    }
                }
                if (snackIds != null && snackIds.length > 0) {
                    for (int i = 0; i < snackIds.length; i++) {
                        String snackId = snackIds[i];
                        int snackQuantity = snackQuantitys.get(i);
                        if (snackQuantity > 0) {
                            cartService.updateSnack(cart, snackId, snackQuantity);
                        } else {
                            cartService.deleteSnack(cart, snackId);
                        }
                    }
                }
                break;

            case "remove":
                String itemId = request.getParameter("itemId");
                String itemType = request.getParameter("itemType");
                if (itemType.equalsIgnoreCase("seat")) {
                    cartService.deleteSeat(cart, itemId);
                } else if (itemType.equalsIgnoreCase("snack")) {
                    cartService.deleteSnack(cart, itemId);
                }
                break;
            case "discount":
                int discountId = Integer.parseInt(request.getParameter("discountId"));
                int discount = Integer.parseInt(request.getParameter("discount"));
                request.setAttribute("discount", discount);
                SessionUtils.getInstance().remainValue(request, "voucherId", discountId);
                break;
        }
        session.remainValue(request, "cart", cart);
        request.getRequestDispatcher("views/web/cart/cart.jsp").forward(request, response);

    }
}
