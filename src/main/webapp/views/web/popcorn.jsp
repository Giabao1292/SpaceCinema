<%-- 
    Document   : popcorn
    Created on : 19 thg 1, 2025, 16:18:53
    Author     : lebao
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<form action = "/cart?action=add" method = "POST">
    <div class="container mt-5">
        <c:forEach var="snackType" items="${snackList.keySet()}">
            <h2 class="text-center mb-4 text-warning fw-bold">${snackType}</h2>
            <div class="row g-4">
                <c:forEach var="snack" items="${snackList.get(snackType)}">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card snack-card shadow border-0">
                            <input type="hidden" name="snackId" value="${snack.id}" />
                            <img src="${snack.poster_image}" class="card-img-top snack-img rounded" alt="${snack.name}" />
                            <div class="card-body text-center">
                                <h5 class="card-title">${snack.name}</h5>
                                <h6 class="text-primary fw-bold">${snack.price} VND</h6>
                                <div class="input-group mt-3">
                                    <button class="btn btn-outline-danger" type="button" onclick="this.nextElementSibling.stepDown()">−</button>
                                    <input type="number" class="form-control text-center snack-quantity" name ="snackQuantity" value="0" min="0" />
                                    <button class="btn btn-outline-success" type="button" onclick="this.previousElementSibling.stepUp()">+</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
    </div>
    <input type="hidden" id="selectedCinema" name="cinema" value="" />
    <div class="d-flex justify-content-center mt-4">
        <div class="dropdown">
            <button class="btn btn-outline-warning dropdown-toggle px-4 py-2 fw-bold" type="button" id="cinemaDropdown" data-bs-toggle="dropdown">
                <i class="bi bi-geo-alt-fill"></i> <span id="displayCinema">Choose Cinema</span>
            </button>
            <ul class="dropdown-menu shadow-lg">
                <c:forEach var="cinema" items="${listCinema}">
                    <li>
                        <a class="dropdown-item cinemaBtn fw-bold" data-movie="${movie.title}" data-cinema="${cinema.name}">
                            <i class="bi bi-geo-alt-fill"></i> <span>${cinema.name}</span>
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="text-center mt-4">
        <button class="btn btn-warning px-4 py-3 fw-bold shadow" id="addToCart">
            <i class="fa-solid fa-cart-plus"></i> Add to Cart
        </button>
        <a href="/cart" class="btn btn-primary px-4 py-3 fw-bold shadow">
            <i class="fa-solid fa-basket-shopping"></i> View Cart
        </a>
    </div>
</form>
<script>
    $(document).on("click", ".cinemaBtn", function () {
        var cinema = $(this).data("cinema"); // Lấy giá trị cinema từ dropdown
        $("#displayCinema").html(cinema); // Hiển thị tên cinema đã chọn
        $("#selectedCinema").val(cinema); // Gán giá trị vào input ẩn
    });
</script>