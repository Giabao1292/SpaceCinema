/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Web;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Scanner;
import java.util.UUID;
import org.json.JSONObject;

/**
 *
 * @author lebao
 */
@WebServlet(name = "ZaloPayPayment", urlPatterns = {"/zalopay-payment"})
public class ZaloPayPayment extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String appId = "2553";
        String key1 = "xxxxxx";
        String key2 = "yyyyyy";
        String orderId = UUID.randomUUID().toString();
        String returnUrl = "https://yourwebsite.com/return";
        String notifyUrl = "https://yourwebsite.com/ipn";
        String amount = request.getParameter("amount");
        long timestamp = System.currentTimeMillis();

        try {
            String data = appId + "|" + orderId + "|" + amount + "|" + returnUrl + "|" + notifyUrl + "|" + timestamp;
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update((data + key1).getBytes("UTF-8"));
            byte[] digest = md.digest();
            StringBuilder hexString = new StringBuilder();
            for (byte b : digest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            String mac = hexString.toString();

            URL url = new URL("https://sandbox.zalopay.vn/v2/create");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            JSONObject payload = new JSONObject();
            payload.put("app_id", appId);
            payload.put("amount", amount);
            payload.put("app_trans_id", orderId);
            payload.put("embed_data", "{}");
            payload.put("item", "[]");
            payload.put("description", "Payment for order 123");
            payload.put("return_url", returnUrl);
            payload.put("notify_url", notifyUrl);
            payload.put("timestamp", timestamp);
            payload.put("mac", mac);

            OutputStream os = conn.getOutputStream();
            os.write(payload.toString().getBytes());
            os.flush();
            os.close();

            Scanner sc = new Scanner(conn.getInputStream());
            StringBuilder responseJson = new StringBuilder();
            while (sc.hasNext()) {
                responseJson.append(sc.nextLine());
            }
            sc.close();
            JSONObject jsonResponse = new JSONObject(responseJson.toString());
            response.sendRedirect(jsonResponse.getString("order_url"));
        } catch (Exception e) {
            response.getWriter().write("Payment error: " + e.getMessage());
        }
    }
}
