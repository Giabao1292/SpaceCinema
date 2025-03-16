<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<div class="container p-5 mt-4">
    <h2 class="text-center text-light">🛒 Your Cart</h2>
    <div class="text-center mb-3">
        <a href="/home" class="btn btn-primary">Continue Buying</a>
    </div>

    <c:if test="${empty cart}">
        <div class="alert alert-warning text-center">Giỏ hàng trống!</div>
    </c:if>

    <c:if test="${not empty cart}">
        <div class="border border-warning p-3 rounded bg-dark shadow-lg">
            <h3 class="mt-4 text-warning">🎟 Ticket</h3>
            <c:set var = "total" value = "0"/>
            <div class="table-responsive">
                <table class="table table-dark table-hover table-striped rounded overflow-hidden">
                    <thead class="table-success">
                        <tr>
                            <th>Seat Type</th>
                            <th>Movie</th>
                            <th>Time</th>
                            <th>Cinema</th>
                            <th>Theatre</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="entry" items="${cart.seats}">
                            <c:set var="seatKey" value="${entry.key}" />
                            <c:set var="seatItem" value="${entry.value}" />
                            <c:set var="seat" value="${seatItem.seat}" />
                            <c:set var="subTotalSeat" value = "${seatItem.quantity * seat.price}"/>
                            <fmt:formatNumber var ="fmtSubTotalSeat" value = "${subTotalSeat}" groupingUsed="true" pattern = "0.00" />
                            <c:set var = "total" value = "${total + subTotalSeat}" />
                            <tr>
                                <td>${seat.type}</td>
                                <td>${seatItem.movie}</td>
                                <td>${seatItem.time}</td>
                                <td>${seatItem.cinema}</td>
                                <td>${seatItem.theatre}</td>
                                <td>
                                    <form action="/cart" method="post" class="d-flex">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="seatId" value="${seatKey}">
                                        <input type="number" name="seatQuantity" value="${seatItem.quantity}" min="1" class="form-control me-2" style="width: 70px;">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                </td>
                                <td>${fmtSubTotalSeat} VND</td>
                                <td>
                                    <button type="button" class="btn btn-danger" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#deleteModal" 
                                            onclick="setDeleteId('${seatKey}', 'seat')">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <h3 class="mt-4 text-warning">🍿 Popcorn</h3>
            <div class="table-responsive">
                <table class="table table-dark table-hover table-striped rounded overflow-hidden">
                    <thead class="table-success">
                        <tr>
                            <th>Name</th>
                            <th>Cinema</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="entry" items="${cart.snacks}">
                            <c:set var="snackKey" value="${entry.key}" />
                            <c:set var="snackItem" value="${entry.value}" />
                            <c:set var="snack" value="${snackItem.snack}" />
                            <c:set var="subTotalSnack" value = "${snack.price * snackItem.quantity}"/>
                            <fmt:formatNumber var ="fmtSubTotalSnack" value = "${subTotalSnack}" groupingUsed="true" pattern = "0.00" />
                            <c:set var = "total" value = "${total + subTotalSnack}" />
                            <tr>
                                <td>${snack.name}</td>
                                <td>${snackItem.cinema}</td>
                                <td>
                                    <form action="/cart" method="post" class="d-flex">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="snackId" value="${snackKey}">
                                        <input type="number" name="snackQuantity" value="${snackItem.quantity}" min="1" class="form-control me-2" style="width: 70px;">
                                        <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                </td>
                                <td>${fmtSubTotalSnack} VND</td>
                                <td>
                                    <button type="button" class="btn btn-danger" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#deleteModal" 
                                            onclick="setDeleteId('${snackKey}', 'snack')">
                                        Delete
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <fmt:formatNumber var = "fmtTotal" value = "${total}" groupingUsed = "true" pattern = "0.00" />
            <h3 class="text-end text-warning mt-3">
                Total: ${total} VND
            </h3>
            <div class="text-end mt-3">
                <a class="btn btn-success px-3" href="/checkout">Pay Now</a>
            </div>
        </div>
    </c:if>
</div>

<!-- Modal Xác Nhận Xóa -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content bg-dark text-light">
            <div class="modal-header border-0">
                <h5 class="modal-title text-danger" id="deleteModalLabel">❌ Confirm Deletion</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure you want to delete this item?
            </div>
            <div class="modal-footer border-0">
                <form action="/cart" method="post">
                    <input type="hidden" name="action" value="remove">
                    <input type="hidden" id="deleteItemId" name="itemId">
                    <input type="hidden" id="deleteItemType" name="itemType">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Script xử lý cập nhật id khi nhấn Delete -->
<script>
    function setDeleteId(itemId, itemType) {
        document.getElementById('deleteItemId').value = itemId;
        document.getElementById('deleteItemType').value = itemType;
    }
</script>
