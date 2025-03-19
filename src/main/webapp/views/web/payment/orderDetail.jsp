<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<body class="bg-light">

    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow-lg p-4 text-center" style="max-width: 450px;">
            <div class="text-success">
                <i class="bi bi-check-circle-fill" style="font-size: 4rem;"></i>
            </div>

            <c:choose>
                <c:when test="${transResult eq 'true'}">
                    <h2 class="mt-3 text-success">Payment Successful!</h2>
                </c:when>
                <c:otherwise>
                    <h2 class="mt-3 text-danger">Payment Failed!</h2>
                </c:otherwise>
            </c:choose>

            <p>Thank you for using our service.</p>

            <div class="mt-3 text-start">
                <p><strong>Order ID:</strong> <span id="orderId">${bookingId}</span></p>
                <p><strong>Total Amount:</strong> <span id="totalAmount">${total} VND</span></p>
                <p><strong>Transaction Date:</strong> <span id="transactionDate">${transactionDate}</span></p>
                <p><strong>Transaction Date:</strong> <span id="transactionNo">${transactionNo}</span></p>
            </div>

            <div class="mt-4">
                <a href="/home" class="btn btn-primary w-100">Return to Home</a>
                <a href="order-details.jsp?orderId=${bookingId}" class="btn btn-outline-success w-100 mt-2">View Order Details</a>
            </div>
        </div>
    </div>

</body>
