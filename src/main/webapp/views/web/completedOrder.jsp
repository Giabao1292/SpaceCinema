<%-- 
    Document   : completedOrder
    Created on : 20 thg 3, 2025, 08:13:50
    Author     : lebao
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<style>
    .accordion-header {
        margin-bottom: 0.5rem;
        border-radius: 8px !important;
        overflow: hidden;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
        transition: all 0.3s ease;
    }

    .accordion-header:hover {
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }

    .accordion-button {
        padding: 1rem 1.5rem;
        background-color: #ffffff;
        color: #333;
        border: 1px solid #e0e0e0;
        border-radius: 8px !important;
        transition: all 0.3s ease;
    }

    .accordion-button:not(.collapsed) {
        background-color: #f8f9fa;
        color: #0d6efd;
        border-color: #e0e0e0;
    }

    .accordion-button:focus {
        box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.1);
        border-color: #86b7fe;
    }

    /* Icon styling */
    .accordion-button i.bi {
        font-size: 1.2rem;
        color: #0d6efd;
    }

    .accordion-button .fw-medium {
        font-size: 1rem;
        letter-spacing: 0.5px;
    }

    .accordion-button .badge {
        padding: 0.35rem 0.65rem;
        font-size: 0.75rem;
        font-weight: 500;
        letter-spacing: 0.5px;
        background: linear-gradient(135deg, #6c757d, #495057);
        transition: all 0.3s ease;
    }

    .accordion-button:not(.collapsed) .badge {
        background: linear-gradient(135deg, #0d6efd, #0b5ed7);
    }

    .accordion-button::after {
        transition: transform 0.3s ease-in-out;
    }
    .hero {
        background: url('https://i.pinimg.com/736x/ba/91/ab/ba91ab9159a9dc04e431ae45711cc117.jpg') center/cover no-repeat;
        height: 300px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.7);
    }
    .thank-you-card {
        text-align: center;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        background: white;
    }
    .thank-you-card img {
        max-width: 150px;
        margin-bottom: 15px;
    }
</style>

<div class="container mt-4">
    <h2 class="text-center text-warning">🎟 Your Bookings</h2>
    <c:choose>
        <c:when test="${not empty bookings}">
            <div class="accordion" id="bookingAccordion">
                <c:forEach var="entry" items="${bookings}" varStatus="status">
                    <c:set var="booking" value="${entry.value}" />
                    <c:set var="bookingId" value="booking${status.index}" />

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="heading${bookingId}">
                            <button class="accordion-button collapsed d-flex align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${bookingId}" aria-expanded="false">
                                <i class="bi bi-journal-text me-2"></i>
                                <span class="fw-medium">Order #${bookings.size() - status.index}</span>
                                <span class="badge bg-secondary ms-auto">Detail</span>
                            </button>
                        </h2>

                        <div id="collapse${bookingId}" class="accordion-collapse collapse" data-bs-parent="#bookingAccordion">
                            <div class="accordion-body">

                                <!-- Seats Table -->
                                <div class="table-responsive">
                                    <h3 class="mt-4 text-warning">🪑 Seats</h3>
                                    <table class="table table-dark table-hover table-striped rounded overflow-hidden">
                                        <thead class="table-success">
                                            <tr>
                                                <th>Movie</th>
                                                <th>Cinema</th>
                                                <th>Theatre</th>
                                                <th>Showtime</th>
                                                <th>Time Detail</th>
                                                <th>Seat Type</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="seat" items="${booking.bookingSeats}">
                                                <tr>
                                                    <td>${seat.title}</td>
                                                    <td>${seat.cinemaName}</td>
                                                    <td>${seat.theatreNum}</td>
                                                    <td>${seat.showingDatetime}</td>
                                                    <td>${seat.timeDetail}</td>
                                                    <td>${seat.seatType}</td>
                                                    <td>${seat.quantity}</td>
                                                    <td><fmt:formatNumber value="${seat.price}" type="currency" currencySymbol="VND" maxFractionDigits="0"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                                <!-- Snacks Table -->
                                <div class="table-responsive">
                                    <h3 class="mt-4 text-warning">🍿 Snacks</h3>
                                    <table class="table table-dark table-hover table-striped rounded overflow-hidden">
                                        <thead class="table-success">
                                            <tr>
                                                <th>Cinema</th>
                                                <th>Snack</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="snack" items="${booking.bookingSnacks}">
                                                <tr>
                                                    <td>${snack.cinemaName}</td>
                                                    <td>${snack.snackName}</td>
                                                    <td>${snack.quantity}</td>
                                                    <td><fmt:formatNumber value="${snack.price}" type="currency" currencySymbol="VND" maxFractionDigits="0"/></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-warning text-center">No bookings found.</div>
        </c:otherwise>
    </c:choose>
    <div class="hero mt-4 rounded ">
        <h1 class ="text-white">Thank You for Booking with Us! 🎟️</h1>
    </div>
    <div class="container my-5">
        <div class="row justify-content-center text-black">
            <div class="col-md-6">
                <div class="thank-you-card text-center">
                    <h2 class="mb-3 text-black">Thank You for Your Booking! 🎬</h2>
                    <p class="lead mb-4">Your ticket reservation has been successfully processed. We're thrilled you've chosen us for your entertainment experience!</p>
                    <p>🎥 Your movie adventure awaits! Arrive 30 minutes early for the best seats.<br>
                        🍿 Don't forget to grab your favorite snacks at our concession stand.<br>
                        ❤️ We appreciate your support of our cinema.</p>
                    <div class="mt-4">
                        <a href="/home" class="btn btn-outline-secondary px-4">Return Home</a>
                    </div>
                    <p class="mt-4 small text-muted">Need assistance? Contact our customer support at <a href="mailto:support@cinema.com">support@cinema.com</a> or call (123) 456-7890.</p>
                </div>
            </div>
        </div>
    </div>
</div>

