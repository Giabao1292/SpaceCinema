<%-- 
    Document   : completedOrder
    Created on : 20 thg 3, 2025, 08:13:50
    Author     : lebao
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<div class="container mt-4">
    <h2 class="text-center">Completed Orders</h2>

    <c:choose>
        <c:when test="${not empty bookings}">
            <div class="accordion" id="bookingAccordion">
                <c:forEach var="entry" items="${bookings}">
                    <c:set var="bookingId" value="${entry.key}" />
                    <c:set var="bookingList" value="${entry.value}" />

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading${bookingId}">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${bookingId}" aria-expanded="false">
                                Booking #${bookingId}
                            </button>

                        </h2>
                        <div id="collapse${bookingId}" class="accordion-collapse collapse ${bookingId == orderId ? 'show' : ''}" data-bs-parent="#bookingAccordion">
                            <div class="accordion-body">
                                <table class="table table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>Movie</th>
                                            <th>Cinema</th>
                                            <th>Theatre</th>
                                            <th>Showtime</th>
                                            <th>Time Detail</th>
                                            <th>Seat Type</th>
                                            <th>Seat Qty</th>
                                            <th>Snack</th>
                                            <th>Snack Qty</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="booking" items="${bookingList}">
                                            <tr>
                                                <td>${booking.movieTitle}</td>
                                                <td>${booking.cinemaName}</td>
                                                <td>${booking.theatreNum}</td>
                                                <td>${booking.showingDatetime}</td>
                                                <td>${booking.timeDetail}</td>
                                                <td>${booking.seatType}</td>
                                                <td>${booking.seatQty}</td>
                                                <td>${booking.snackName}</td>
                                                <td>${booking.snackQty}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning text-center">No completed orders found.</div>
        </c:otherwise>
    </c:choose>
</div>

