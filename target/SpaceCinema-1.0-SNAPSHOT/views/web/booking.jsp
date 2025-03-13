<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<main class="main">
    <section id="gallery" class="gallery section">
        <div class="container" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4 justify-content-center">
                <div class="col-xl-5" style="margin-bottom: 4rem">
                    <div class="gallery-item h-100">
                        <img
                            src="${movie.header_image}"
                            class="img-fluid"
                            alt=""
                            />
                    </div>
                </div>
                <div class="col-xl-7 fs-5" style="margin-bottom: 4rem">
                    <h1>${movie.title}</h1>
                    <div class="d-flex">
                        <div>
                            <i class="fa-solid fa-tag text-warning"></i>
                            <c:forEach items="${movie.genre}" var="g" varStatus="st">
                                <span>${g}</span>
                                <c:if test="${!st.last}">, </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <div class="me-3 mt-2">
                        <i class="fa-regular fa-clock text-warning"></i>
                        ${movie.runtime_min}
                    </div>

                    <div class="me-3 mt-2">
                        <i class="fa-solid fa-earth-americas text-warning"></i>
                        Language
                    </div>
                    <div class="me-3 mt-2">
                        <i class="fa-solid fa-cake-candles text-warning"></i>
                        ${movie.age_rating}
                    </div>
                    <div class="me-3 mt-2">
                        <i class="fa-solid fa-bullhorn text-warning"></i>
                        ${movie.director}
                    </div>
                    <div class="me-3 mt-2">
                        <h3 class="d-inline border-bottom ">Description</h3>
                        <div>${movie.description}</div>
                        <div>Release Date : ${movie.release_date}</div>
                        <span>Actor :</span>
                        <c:forEach items="${movie.cast}" var="c" varStatus="statusCast">
                            <span>${c}</span>
                            <c:if test="${!statusCast.last}">, </c:if>
                        </c:forEach>
                    </div>
                    <div class="me-3 mt-2">
                        <h3 class="d-inline border-bottom ">Content</h3>
                        <div>${movie.synopsis}</div>
                    </div>
                    <div class="d-flex justify-content-between h1">
                        <a
                            href="${movie.trailer_link}"
                            class="logo d-flex glightbox align-items-center me-auto me-xl-0"
                            >
                            <i class="fs-2 fa-regular fa-circle-play"></i>
                            <h2 class="ms-1 text-white border-bottom border-secondary"
                                >Watch trailer</h2
                            >
                        </a>
                    </div>
                </div>
            </div>
            <h1 class="text-center">Showing date</h1>
            <div class="row gy-4 justify-content-center text-center mt-4" id ="dateBtn">
                <c:forEach items="${movie.times.keySet()}" var="dateItem">
                    <div class="col-sm-2 p-0 m-0">
                        <button class="dateBtn btn btn-warning text-black pt-3 pb-3 m-0 ${dateItem eq date ? 'active' : ''}" data-movie ="${movie.title}" data-date = "${dateItem}" data-cinema = "${cinema}">${dateItem}</button>
                    </div>
                </c:forEach>
            </div>
            <div class="row gy-4 justify-content-between d-flex text-center">
                <h1 class = "col-md-6">Showing time</h1>
                <div class="dropdown col-md-6">
                    <button
                        class="btn border border-warning text-warning mt-1 dropdown-toggle"
                        type="button"
                        id="cinemaDropdown"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        >
                        <i class="bi bi-geo-alt-fill"></i> <span id = "displayCinema">${cinema}</span>
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="cinemaDropdown">
                        <c:forEach var="cinema" items="${listCinema}">
                            <li>
                                <a class="dropdown-item cinemaBtn" data-movie ="${movie.title}" data-cinema = "${cinema.name}"><i
                                        class="bi bi-geo-alt-fill"></i> <span>${cinema.name}</span>
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="row gy-4 justify-content-center text-center">
                <div class="text-white">
                    <div class="btn btn-transparent border border-warning text-white w-75 mt-1"
                         data-idmain="${status.index}" data-id="${statusDate.index}">
                        <div id="toggleButton"  class="d-flex justify-content-between align-content-center text-warning">
                            <h3 class = "m-0 align-content-center ">${cinema}</h3>
                            <h5 class = "m-0 p-3"><i class="bi bi-arrow-down"></i></h5>
                        </div>
                        <div id="content" class="hidden text-start">
                            <c:forEach var="timeBtn" items="${movie.times[date]}">
                                <a data-cinema ="${cinema}" data-movie ="${movie.title}" data-date="${date}" data-time ="${timeBtn}" class="timeBtn btn text-black gap-2 btn-warning border border-warning ${timeBtn eq time ? "active" : ""}">${timeBtn}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row gy-4 justify-content-between d-flex text-center mt-3 theatre">
                <c:if test = "${not empty theatre}">
                    <h1><i class="fa-solid fa-film"></i>Theatre ${theatre.theatre_num}</h1>
                </c:if>
            </div>
            <form action = "/cart?action=add" method = "POST">
                <div class="container mt-4">
                    <c:if test = "${not empty seatList}">
                        <h3 class="text-center mb-4">CHOOSE TICKET</h3>
                    </c:if>
                    <div class="row ticket">
                        <c:forEach var="seatType" items="${seatList}">
                            <div class="col-md-6 fs-5">
                                <div class="card p-3 mb-3">
                                    <h5 class="text-black">ADULT</h5>
                                    <p><strong>${seatType.type}</strong></p>
                                    <p class="text-danger">${seatType.price} $</p>
                                    <p class="text-success">Available slots: <strong>${seatType.quantity}</strong></p>
                                    <input type="hidden" name="seatId" value="${seatType.id}" />
                                    <input type="number" name ="seatQuantity" class="form-control border-warning" max ="${seatType.quantity}" min="0" value="0">
                                </div>
                            </div>
                        </c:forEach>
                        <input type="hidden" name="movie" value="${movie.title}" />
                        <input type="hidden" name="cinema" value="${cinema}" />
                        <input type="hidden" name="date" value="${date}" />
                        <input type="hidden" name="time" value="${time}" />
                        <input type="hidden" name="theatre" value="${theatre.theatre_num}" />
                    </div>
                </div>
                <c:forEach var = "snackType" items = "${snackList.keySet()}">
                    <div class="container mt-5">
                        <h2 class="text-center mb-4">${snackType}</h2>
                        <div class="row">
                            <c:forEach var = "snack" items = "${snackList.get(snackType)}">
                                <div class="col-md-4">
                                    <div class="card snack-card shadow">
                                        <input type="hidden" name="snackId" value="${snack.id}" />
                                        <img
                                            src="${snack.poster_image}"
                                            class="card-img-top snack-img"
                                            alt="Potato Chips"
                                            />
                                        <div class="card-body">
                                            <h5 class="card-title">${snack.snack_name}</h5>
                                            <h6 class="text-primary fw-bold">${snack.price}</h6>
                                            <div class="input-group mt-3">
                                                <button
                                                    class="btn btn-outline-danger"
                                                    type="button"
                                                    onclick="this.nextElementSibling.stepDown()"
                                                    >
                                                    −
                                                </button>
                                                <input
                                                    type="number"
                                                    class="form-control text-center"
                                                    name ="snackQuantity"
                                                    value="0"
                                                    min="0"
                                                    />
                                                <button
                                                    class="btn btn-outline-success"
                                                    type="button"
                                                    onclick="this.previousElementSibling.stepUp()"
                                                    >
                                                    +
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
                <div class="text-end mt-3">
                    <button class="btn btn-warning p-3"><i class="fa-solid fa-cart-plus"></i> Adding to Cart</button>
                    <a href="/cart" class="btn btn-primary p-3"><i class="fa-solid fa-basket-shopping"></i> View Cart</a>
                </div>
            </form>
        </div>
    </section>
</main>
<script>
    $(document).ready(function () {
        $("#toggleButton").click(function () {
            $("#content").slideToggle();
        });
        $("#content").on("click", "a", function (event) {
            event.preventDefault();
            $("#content a").removeClass("active");
            $(this).addClass("active");
        });
        $(document).on("click", ".dateBtn", function (event) {
            var self = $(this);
            var cinema = $(this).data("cinema");
            var movie = $(this).data("movie");
            var date = $(this).data("date");
            $.ajax({
                url: "/book-ticket",
                type: "POST",
                dataType: "json",
                data: {
                    action: "dateBtn",
                    cinema: cinema,
                    movie: movie,
                    date: date,
                },
                success: function (response) {
                    $(".dateBtn").removeClass("active");
                    self.addClass("active");
                    $("#content").html(response.showTime);
                    $(".ticket").html("");
                    $(".theatre").html("");
                },
                error: function (xhr) {
                    console.error("Error:", xhr);
                },
            });
        });
        $(document).on("click", ".cinemaBtn", function (event) {
            var cinema = $(this).data("cinema");
            var movie = $(this).data("movie");
            console.log(cinema + " " + movie);
            $.ajax({
                url: "/book-ticket",
                type: "POST",
                dataType: "json",
                data: {
                    action: "cinemaBtn",
                    cinema: cinema,
                    movie: movie,
                },
                success: function (response) {
                    console.log("Success!");
                    $("#displayCinema").html(cinema);
                    $("#content").html(response.showTime);
                    $("#dateBtn").html(response.dateBtn);
                    $(".ticket").html("");
                    $(".theatre").html("");
                },
                error: function (xhr) {
                    alert("This cinema doesn't have a showing time for these criteria.");
                }
            });
        });
        $(document).on("click", ".timeBtn", function (event) {
            var cinema = $(this).data("cinema");
            var movie = $(this).data("movie");
            var date = $(this).data("date");
            var time = $(this).data("time");
            console.log(cinema + " " + movie + " " + date + " " + time);
            $.ajax({
                url: "/book-ticket",
                type: "POST",
                dataType: "json",
                data: {
                    action: "timeBtn",
                    cinema: cinema,
                    movie: movie,
                    date: date,
                    time: time,
                },
                success: function (response) {
                    console.log("Success!");
                    console.log(response.seatHtml + " " + response.theatreHtml);
                    $(".ticket").html(response.seatHtml);
                    $(".theatre").html(response.theatreHtml);
                },
                error: function (xhr) {
                    alert("This cinema doesn't have a showing time for these criteria.");
                }
            });
        });
    });
</script>