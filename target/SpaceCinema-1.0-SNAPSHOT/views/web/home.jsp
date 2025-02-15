<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<c:if test="${status == 'not_permission'}">
    <div class="container mt-5">
        <!-- Alert -->
        <div
            class="alert show alert-warning alert-dismissible show fade"
            role="alert"
            >
            <strong>Warning!</strong> You are not authorized to access the admin panel."
            <button
                type="button"
                class="btn-close"
                data-bs-dismiss="alert"
                aria-label="Close"
                ></button>
        </div>
    </div>
</c:if>
<main class="main">
    <!-- Hero Section -->
    <div id="hero" class="hero p-0">
        <div class="container">
            <div class="row justify-content-center">
                <div
                    class="col-lg-6 text-center"
                    data-aos="fade-up"
                    data-aos-delay="100"
                    >
                    <div class="container-fluid py-3">
                        <div
                            class="d-flex flex-column flex-xl-row gap-3 justify-content-center align-items-center"
                            >
                            <h5 class="">ĐẶT VÉ NHANH</h5>

                            <!-- Dropdown for Cinema -->
                            <div class="dropdown">
                                <button
                                    class="btn btn-warning px-4 py-3 dropdown-toggle"
                                    type="button"
                                    id="cinemaDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    1. Chọn Rạp
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="cinemaDropdown">
                                    <c:forEach var = "cinema" items="${listCinema}">
                                        <li>
                                            <a class="dropdown-item" data-cinema="${cinema.name}">${cinema.name}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>


                            <div class="dropdown ">
                                <button
                                    class="btn btn-warning px-4 py-3 dropdown-toggle "
                                    type="button"
                                    id="movieDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    disabled
                                    >
                                    2. Chọn Phim
                                </button>
                                <ul class="dropdown-menu"id="movie" aria-labelledby="movieDropdown">
                                </ul>
                            </div>

                            <div class="dropdown">
                                <button
                                    class="btn btn-warning px-4 py-3 dropdown-toggle"
                                    type="button"
                                    id="dateDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    disabled
                                    >
                                    3. Chọn Ngày
                                </button>
                                <ul class="dropdown-menu "id="date" aria-labelledby="dateDropdown">
                                </ul>
                            </div>


                            <div class="dropdown ">
                                <button
                                    class="btn btn-warning px-4 py-3 dropdown-toggle "
                                    type="button"
                                    id="showtimeDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    disabled
                                    >
                                    4. Chọn Suất
                                </button>
                                <ul
                                    class="dropdown-menu "id="time"
                                    aria-labelledby="showtimeDropdown"
                                    >
                                </ul>
                            </div>

                            <a class="btn btn-success px-5 py-3 booking" >Booking</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /Hero Section -->

    <!-- Gallery Section -->
    <section id="gallery" class="gallery section">
        <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4 justify-content-center">
                <c:forEach var = "movieitem" items= "${allMovie}">
                    <div class="col-xl-3 col-lg-4 col-md-6" style = "margin-bottom: 4rem">
                        <div class="gallery-item h-100">
                            <img
                                src="${movieitem.header_image}"
                                class="img-fluid"
                                alt=""
                                />
                            <div
                                class="gallery-links d-flex flex-column ps-4 justify-content-center"
                                >
                                <h4>${movieitem.title}</h4>
                                <ul class="list-unstyled small fs-6">
                                    <li>
                                        <i class="fa-solid fa-bullhorn text-warning"></i> ${movieitem.director}
                                    </li>
                                    <li><i class="fa-solid fa-tag text-warning"></i> 
                                        <c:forEach items = "${movieitem.genre}" var = "g" varStatus = "status">
                                            <span>${g}</span>
                                            <c:if test="${!status.last}">, </c:if>
                                        </c:forEach>

                                    </li>
                                    <li>
                                        <i class="fa-solid fa-cake-candles text-warning"></i> ${movieitem.age_rating}
                                    </li>
                                    <li>
                                        <i class="fa-regular fa-clock text-warning"></i> ${movieitem.runtime_min}
                                    </li>
                                    <li>
                                        <i class="fa-solid fa-earth-americas text-warning"></i>
                                        Language
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class = "fs-4">${movieitem.title}</div>
                        <div class="d-flex justify-content-between">
                            <a
                                href="${movieitem.trailer_link}"
                                class="logo d-flex glightbox align-items-center me-auto me-xl-0"
                                >
                                <i class="fs-5 fa-regular fa-circle-play"></i>
                                <h class="ms-1 fs-5 text-white border-bottom border-secondary"
                                   >Watch trailer</h
                                >
                            </a>
                            <a class="btn btn-warning px-4 py-2" href="">Booking now</a>
                        </div>
                    </div>
                </c:forEach>
                <!-- End Gallery Item -->


                <!-- End Gallery Item -->
            </div>
        </div>
    </section>
    <!-- /Gallery Section -->
</main>
<script>
    $(document).ready(function () {
        $(document).on("click", ".dropdown-item", function (event) {
            event.preventDefault();
            var cinema = $(this).data("cinema");
            var movie = $(this).data("movie");
            var date = $(this).data("date");
            var time = $(this).data("time");
            console.log(cinema + " " + movie + " " + date + " " + time);
            $.ajax({
                url: "/home",
                type: "GET",
                data: {
                    cinema: cinema,
                    movie: movie,
                    date: date,
                    time: time,
                },
                success: function (response) {
                    if (time != null && time != "") {
                        $("#showtimeDropdown").text(time);
                        console.log(time);
                    } else if (date != null && date != "") {
                        document.getElementById("showtimeDropdown").disabled = false;
                        $("#dateDropdown").text(date);
                        $("#showtimeDropdown").text("4. Chọn Suất");
                        $("#time").html(response);
                    } else if (movie != null && movie != "") {
                        document.getElementById("dateDropdown").disabled = false;
                        document.getElementById("showtimeDropdown").disabled = true;
                        $("#movieDropdown").text(movie);
                         $("#dateDropdown").text("3. Chọn Ngày");
                        $("#showtimeDropdown").text("4. Chọn Suất");
                        $("#date").html(response);
                    } else if (cinema != null && cinema != "") {
                        document.getElementById("movieDropdown").disabled = false;
                        document.getElementById("dateDropdown").disabled = true;
                        document.getElementById("showtimeDropdown").disabled = true;
                        $("#cinemaDropdown").text(cinema);
                        $("#movieDropdown").text("2. Chọn Phim");
                        $("#dateDropdown").text("3. Chọn Ngày");
                        $("#showtimeDropdown").text("4. Chọn Suất");
                        $("#movie").html(response);
                    }
                    $(".booking").attr("href", "/book-ticket?cinema=" +cinema + "&movie=" + movie + "&date=" + date + "&time=" + time);

                },
                error: function (xhr) {
                    // Xử lý lỗi
                    console.error("Error:", xhr);
                },
            });
        });
    });
</script>
