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
                                    ${empty cinema ? "1. Chọn Rạp" : cinema}
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="cinemaDropdown">
                                    <c:forEach var = "cinema" items="${listCinema}">
                                        <li>
                                            <a class="dropdown-item cinema" href = "/home?cinema=${cinema.name}">${cinema.name}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>

                            <!-- Dropdown for Movie -->
                            <c:if test ="${not empty cinema}">
                                <div class="dropdown ">
                                    <button
                                        class="btn btn-warning px-4 py-3 dropdown-toggle "
                                        type="button"
                                        id="movieDropdown"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                        >
                                        ${empty movie ? "2. Chọn Phim" : movie}
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="movieDropdown">
                                        <c:forEach var = "movie" items="${listMovie}">
                                            <li>
                                                <a class="dropdown-item movie" href="/home?cinema=${cinema}&movie=${movie}">
                                                    ${movie}
                                                </a>

                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test ="${not empty movie}">
                                <div class="dropdown">
                                    <button
                                        class="btn btn-warning px-4 py-3 dropdown-toggle"
                                        type="button"
                                        id="dateDropdown"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                        >
                                        ${empty date ? "3. Chọn Ngày" : date}
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dateDropdown">
                                        <c:forEach var = "date" items="${listDate}">
                                            <li>
                                                <a class="dropdown-item movie" href="/home?cinema=${cinema}&movie=${movie}&date=${date}">
                                                    ${date}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <c:if test ="${not empty date}">
                                <div class="dropdown ">
                                    <button
                                        class="btn btn-warning px-4 py-3 dropdown-toggle "
                                        type="button"
                                        id="showtimeDropdown"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false"
                                        >
                                        ${empty time ? "4. Chọn Suất" : time}
                                    </button>
                                    <ul
                                        class="dropdown-menu"
                                        aria-labelledby="showtimeDropdown"
                                        >
                                        <c:forEach var = "time" items="${listTime}">
                                            <li>
                                                <a class="dropdown-item movie" href="/home?cinema=${cinema}&movie=${movie}&date=${date}&time=${time}">
                                                    ${time}
                                                </a>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </c:if>
                            <a class="btn btn-success px-5 py-3" href = "/book-ticket?cinema=${cinema}&movie=${movie}&date=${date}&time=${time}">Booking</a>
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
                            <a class="btn btn-warning px-4 py-2" href="#">Booking now</a>
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
<!--<script>
    function getCinema(cinema) {
//        $.ajax({
//            url: "/home",
//            type: "get",
//            data: {
//                cinema: encodeURIComponent(cinema),
//            },
//            success: function (data) {
//                document.getElementById("cinemaDropdown").innerText = cinema;
//                document
//                        .getElementById("movieDropdown")
//                        .removeAttribute("disabled");
//                document
//                        .getElementById("dateDropdown")
//                        .setAttribute("disabled", "true");
//                document
//                        .getElementById("showtimeDropdown")
//                        .setAttribute("disabled", "true");
//            },
//            error: function (xhr) {
//                // Xử lý lỗi nếu có
//            },
//        });
        document
                .getElementById("movieDropdown")
                .removeAttribute("disabled");
        document
                .getElementById("dateDropdown")
                .setAttribute("disabled", "true");
        document
                .getElementById("showtimeDropdown")
                .setAttribute("disabled", "true");
    }
    function getMovie(movie) {
//        $.ajax({
//            url: "/home",
//            type: "get",
//            data: {
//                movie: movie,
//            },
//            success: function (data) {
//                
//            },
//            error: function (xhr) {
//                // Xử lý lỗi nếu có
//            },
//        });
        document.getElementById("dateDropdown").removeAttribute("disabled");
        document
                .getElementById("showtimeDropdown")
                .setAttribute("disabled", "true");
    }


</script>-->