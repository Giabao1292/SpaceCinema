<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<style>
    .image-container {
        position: relative;
        display: inline-block;
        cursor: pointer;
    }
    .image-container img {
        width: 100%;
        display: block;
    }
    .active img {
        filter: brightness(0) saturate(100%) invert(78%) sepia(61%)
            saturate(345%) hue-rotate(1deg) brightness(102%) contrast(101%);
    }
</style>
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
                                <a class="btn text-black btn-warning border border-warning ${timeBtn eq time ? "active" : ""}">${timeBtn}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <div class = "text-white text-center">
                <div class="container mt-4">
                    <h2 class="position-relative">CHỌN GHẾ - RẠP 01</h2>

                    <!-- Hình ảnh nền -->
                    <div class="position-relative mt-3">
                        <img
                            src="https://cinestar.com.vn/assets/images/img-screen.png"
                            class="img-fluid opacity-50"
                            alt="Màn hình rạp"
                            />

                        <!-- Chữ trên hình ảnh -->
                        <div class="position-absolute top-50 start-50 translate-middle">
                            <h3 class="fw-bold text-white bg-dark px-3 py-1 rounded">MÀN HÌNH</h3>
                        </div>
                    </div>
                    <div class="d-flex flex-column align-items-center">
                        <div class="d-flex gap-2 mt-2">
                            <button class="btn btn-outline-light">A1</button>
                            <button class="btn btn-outline-light">A2</button>
                            <button class="btn btn-outline-light">A3</button>
                            <button class="btn btn-outline-light">A4</button>
                            <button class="btn btn-outline-light">A5</button>
                            <button class="btn btn-outline-light">A6</button>
                            <button class="btn btn-outline-light">A7</button>
                            <button class="btn btn-outline-light">A8</button>
                            <button class="btn btn-outline-light">A9</button>
                            <button class="btn btn-outline-light">A10</button>
                            <button class="btn btn-outline-light">A11</button>
                            <button class="btn btn-outline-light">A12</button>
                            <button class="btn btn-outline-light">A13</button>
                            <button class="btn btn-outline-light">A14</button>
                            <button class="btn btn-outline-light">A15</button> 
                        </div>      
                    </div>

                    <!-- Chú thích -->
                    <div class="mt-3 d-flex justify-content-evenly">
                        <span class="position-relative mt-3">
                            <img
                                src="https://cinestar.com.vn/assets/images/seat.svg"
                                class="img-fluid"
                                alt=""
                                />
                            <span
                                class="fw-bold text-white fs-6 rounded justify-content-center align-content-center"
                                >
                                Single Seat
                            </span>
                        </span>
                        <span class="position-relative mt-3">
                            <img
                                src="https://cinestar.com.vn/assets/images/seat-couple-w.svg"
                                class="img-fluid"
                                alt=""
                                />
                            <span
                                class="fw-bold text-white fs-6 rounded justify-content-center align-content-center"
                                >
                                Double seat
                            </span>
                        </span>

                        <span class="position-relative mt-3">
                            <img
                                src="https://cinestar.com.vn/assets/images/seat.svg"
                                class="img-fluid opacity-50"
                                alt=""
                                />
                            <span
                                class="fw-bold text-white fs-6 rounded justify-content-center align-content-center"
                                >
                                Reserved Seat
                            </span>
                        </span>
                        <span class="position-relative mt-3 active">
                            <img
                                src="https://cinestar.com.vn/assets/images/seat.svg"
                                class="img-fluid"
                                alt=""
                                />
                            <span
                                class="fw-bold text-white fs-6 rounded justify-content-center align-content-center"
                                >
                                Reserved Seat
                            </span>
                        </span>
                    </div>
                </div>              
            </div>
        </div>
    </section>
</main>
<script>
    $(document).ready(function () {
        $(".image-container").click(function () {
            $(this).toggleClass("active");
        });
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
                },
                error: function (xhr) {
                    console.error("Error:", xhr);
                },
            });
        });
    });
</script>