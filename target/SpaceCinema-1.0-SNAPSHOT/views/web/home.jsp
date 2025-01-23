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
                            <a class="btn btn-success px-5 py-3" href = "/home?cinema=${cinema}&movie=${movie}&date=${date}&time=${time}">Booking</a>
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
                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-1.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-1.jpg"
                                title="Gallery 1"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-2.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-2.jpg"
                                title="Gallery 2"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-3.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-3.jpg"
                                title="Gallery 3"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-4.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-4.jpg"
                                title="Gallery 4"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-5.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-5.jpg"
                                title="Gallery 5"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-6.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-6.jpg"
                                title="Gallery 6"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-7.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-7.jpg"
                                title="Gallery 7"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
                <!-- End Gallery Item -->

                <div class="col-xl-3 col-lg-4 col-md-6">
                    <div class="gallery-item h-100">
                        <img
                            src="assets/img/gallery/gallery-8-2.jpg"
                            class="img-fluid"
                            alt=""
                            />
                        <div
                            class="gallery-links d-flex align-items-center justify-content-center"
                            >
                            <a
                                href="assets/img/gallery/gallery-8-2.jpg"
                                title="Gallery 8"
                                class="glightbox preview-link"
                                ><i class="bi bi-arrows-angle-expand"></i
                                ></a>
                            <a href="gallery-single.html" class="details-link"
                               ><i class="bi bi-link-45deg"></i
                                ></a>
                        </div>
                    </div>
                </div>
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