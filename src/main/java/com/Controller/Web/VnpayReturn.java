/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import com.Config.Config;
import com.Model.Cart;
import com.Model.SeatItem;
import com.Model.User;
import com.Repository.BookingRepository;
import com.Repository.SeatRepository;
import com.Repository.VoucherRepository;
import com.Repository.impl.BookingRepositoryImpl;
import com.Repository.impl.SeatRepositoryImpl;
import com.Repository.impl.VoucherRepositoryImpl;
import com.Utils.MailUtil;
import com.Utils.SessionUtils;
import jakarta.mail.MessagingException;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author lebao
 */
@WebServlet(name = "VnpayReturn", urlPatterns = {"/order"})
public class VnpayReturn extends HttpServlet {
    private SeatRepository seatRepository = new SeatRepositoryImpl();
    private BookingRepository bookingRepository = new BookingRepositoryImpl();
    private VoucherRepository voucherRepository = new VoucherRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            String paymentCode = request.getParameter("vnp_TransactionNo");
            String orderId = request.getParameter("vnp_TxnRef");
            int bookingId = Integer.parseInt(orderId);
            String status = "";
            boolean transSuccess = false;
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                SessionUtils session = SessionUtils.getInstance();
                User user = (User) session.getValue(request, "USER");
                int voucherId = 0;
                if (session.getValue(request, "voucherId") != null) {
                    voucherId = (int) session.getValue(request, "voucherId");
                    voucherRepository.removeVoucher(user.getId(), voucherId);
                }
                Cart cart = (Cart) session.getValue(request, "cart");
                String email = (String) session.getValue(request, "email");
                status = "Success";
                transSuccess = true;
                String content = MailUtil.createMovieTicketEmail(Integer.toString(bookingId), cart.getSeats(), cart.getSnacks(), Integer.toString(Integer.parseInt(request.getParameter("vnp_Amount")) / 100));
                try {
                    MailUtil.sendEmail((String) session.getValue(request, "email"), "Space Cinemas: Transaction success", content, true);
                } catch (MessagingException ex) {
                    Logger.getLogger(VnpayReturn.class.getName()).log(Level.SEVERE, null, ex);
                }
                session.removeValue(request, "voucherId");
                session.removeValue(request, "cart");
                session.removeValue(request, "total");
                session.removeValue(request, "email");
            } else {
                status = "Failed";
            }
            bookingRepository.updateStatus(bookingId, status);
            request.setAttribute("bookingId", bookingId);
            request.setAttribute("total", Integer.parseInt(request.getParameter("vnp_Amount")) / 100);
            request.setAttribute("transactionDate", request.getParameter("vnp_PayDate"));
            request.setAttribute("transactionNo", request.getParameter("vnp_TransactionNo"));
            request.setAttribute("transResult", transSuccess);
            request.getRequestDispatcher("/views/web/payment/orderDetail.jsp").forward(request, response);
        } else {
            System.out.println("GD KO HOP LE (invalid signature)");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    public void decreaseSeat(Cart cart){
        Map<String, SeatItem> seats= cart.getSeats();
        for(String key : seats.keySet()){
            seatRepository.decreaseSeat(seats.get(key).getSeat().getId(), seats.get(key).getQuantity());
        }
    }
}
