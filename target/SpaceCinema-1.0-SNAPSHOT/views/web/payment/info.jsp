<%-- 
    Document   : info
    Created on : 13 thg 3, 2025, 09:01:32
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<div class="container py-5 fs-5">
    <h2 class="text-center fw-bold">PAYMENT PAGE</h2>
    <div class="row mt-4">
        <div class="col-lg-6">
            <div class="bg-danger p-4 rounded">
                <h5 class="text-warning fw-bold">CUSTOMER INFORMATION</h5>
                <form action = "/payment" method = "POST">
                    <div class="mb-3">
                        <label class="form-label">Full Name *</label>
                        <input
                            type="text"
                            class="form-control"
                            name="name"
                            value = "${USER.fullName != null ? USER.fullName : ""}"
                            placeholder="Enter full name"
                            />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number *</label>
                        <input
                            type="text"
                            class="form-control"
                            name="phone"
                            value = "${USER.phone != null ? USER.phone : ""}"
                            placeholder="Enter phone number"
                            />
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email *</label>
                        <input
                            type="email"
                            class="form-control"
                            name ="email"
                            placeholder="Enter email"
                            value = "${USER.email != null ? USER.email : ""}"
                            />
                    </div>
                    <button type="submit" class="btn btn-warning w-100 fw-bold">
                        <input type = "hidden" value = "${total}" name = "amount"/>
                        CONTINUE
                    </button>
                </form>
            </div>
        </div>

        <!-- Ticket Information -->
        <div class="col-lg-6">
            <div class="p-4 rounded text-white" style="background: #2659BF">
                <c:forEach var = "entrySeat" items = "${cart.seats}">
                    <c:set var = "value" value = "${entrySeat.value}"/>
                    <h2 class="fw-bold text-warning">${value.movie}</h2>
                    <p class = "text-warning"><strong>${value.cinema}</strong></p>
                    <p><strong>${value.time}</strong></p>
                    <p>
                        <strong class = "text-warning">Theatre :</strong> ${value.theatre} &nbsp;&nbsp;|
                        <strong class = "text-warning">Number of tickets:</strong> ${value.quantity} &nbsp;&nbsp;
                    </p>
                    <p>
                        <strong class = "text-warning">Seat type:</strong> ${value.seat.type} &nbsp;&nbsp;
                    </p>
                </c:forEach>
                <c:forEach var = "entryPopcorn" items = "${cart.snacks}" >
                    <p><strong>${entryPopcorn.value.snack.name}:</strong> ${entryPopcorn.value.quantity}</p>
                </c:forEach>
                <hr />
                <p class="text-warning text-end fw-bold">
                    Total : ${total} VND
                </p>
            </div>
        </div>
    </div>
</div>
