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
                    <button id="toggleButton" class="btn btn-transparent border border-warning text-white w-75 mt-1"
                            data-idmain="${status.index}" data-id="${statusDate.index}">
                        <div class="d-flex justify-content-between align-content-center text-warning">
                            <h3 class = "m-0 align-content-center ">${cinema}</h3>
                            <h5 class = "m-0 p-3"><i class="bi bi-arrow-down"></i></h5>
                        </div>
                        <div id="content" class="hidden text-start">
                            <c:forEach var="time" items="${movie.times[date]}">
                                <a class="btn text-warning border border-warning">${time}</a>
                            </c:forEach>
                        </div>
                    </button>
                </div>
            </div>
        </div>
    </section>
</main>
<script>
    $(document).ready(function () {
        $(".btn-transparent").click(function () {
            $("#content").slideToggle();
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
                    alert("Showtimes have not been updated yet");
                },
            });
        });
    });
</script>
