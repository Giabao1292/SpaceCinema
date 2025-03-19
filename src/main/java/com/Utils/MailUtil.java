/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Utils;

import com.Model.SeatItem;
import com.Model.SnackItem;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Multipart;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import java.util.Map;
import java.util.Properties;

/**
 *
 * @author lebao
 */
public class MailUtil {

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";
    private static final String EMAIL_SENDER = "giabao362004@gmail.com";
    private static final String EMAIL_PASSWORD = "ftnl kjxx pqor jtch";

    public static void sendEmail(String recipient, String subject, String content, boolean isHtml) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_SENDER, EMAIL_PASSWORD);
            }
        });
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(EMAIL_SENDER));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject(subject);
        MimeBodyPart bodyPart = new MimeBodyPart();
        bodyPart.setContent(content, isHtml ? "text/html; charset=UTF-8" : "text/plain");
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(bodyPart);

        message.setContent(multipart);

        Transport.send(message);
    }

    public static String createMovieTicketEmail(String ticketCode, Map<String, SeatItem> seats, Map<String, SnackItem> snacks, String total) {
        StringBuilder htmlContent = new StringBuilder();
        htmlContent.append("<html><body style='font-family: Arial, sans-serif; margin: 0; padding-left: 200px; padding-right: 200px'>")
                .append("<div style='background-color: #f8f9fa; padding: 20px; text-align: center;'>")
                .append("<img src='https://raw.githubusercontent.com/Giabao1292/TestGit/refs/heads/main/unnamed.png' alt='Header Image' style='width: 100%; max-width: 900px; height: auto; display: block; margin: 0 auto;'>")
                .append("<h1 style='color: #dc3545; margin-top: 20px;'>E-TICKET</h1>")
                .append("<p><strong>Please present this code at the SPACECINEMA ticket counter to receive your ticket.</strong></p>")
                .append("<p><em>*Note: Please use the ticket type that matches your age as per SPACECINEMA regulations. For details, click here!</em></p>")
                .append("</div>")
                .append("<div style='padding: 20px;'>");

        for (String key : seats.keySet()) {
            SeatItem value = seats.get(key);
            htmlContent.append("<h2 style='font-weight: bold; color: orange;'>").append(value.getMovie()).append("</h2>")
                    .append("<p style='color: orange;'><strong>").append(value.getCinema()).append("</strong></p>")
                    .append("<p><strong>").append(value.getTime()).append("</strong></p>")
                    .append("<p><strong style='color: orange;'>Theatre :</strong> ").append(value.getTheatre()).append(" &nbsp;&nbsp;| ")
                    .append("<strong style='color: orange;'>Number of tickets:</strong> ").append(value.getQuantity()).append(" &nbsp;&nbsp;</p>")
                    .append("<p><strong style='color: orange;'>Seat type:</strong> ").append(value.getSeat().getType()).append(" &nbsp;&nbsp;</p>");
        }

        for (String key : snacks.keySet()) {
            htmlContent.append("<p><strong>").append(snacks.get(key).getSnack().getName()).append(":</strong> ").append(snacks.get(key).getQuantity()).append("</p>");
        }

        htmlContent.append("<hr />")
                .append("<p style='color: orange; text-align: right; font-size:16px; font-weight: bold;'>Total : ").append(total).append(" VND</p>")
                .append("</div>")
                .append("<div style='background-color: #53090B; color:white; padding: 20px; text-align: center;'>")
                .append("<p>SPACECINEMA Vietnam</p>")
                .append("<p>2nd Floor, 7/28 Thanh Thai, Ward 14, District 10, Ho Chi Minh City</p>")
                .append("<p>Support Email: hoidap@cgv.vn</p>")
                .append("<p>Hotline: 1900 6017</p>")
                .append("</div>")
                .append("</body></html>");

        return htmlContent.toString();
    }
}
