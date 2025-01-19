<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<main class="main">
    <!-- Hero Section -->
    <div id="hero" class="hero">
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
                                    class="btn btn-warning ps-5 pe-5 pt-3 pb-3 dropdown-toggle"
                                    type="button"
                                    id="cinemaDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    1. Chọn Rạp
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="cinemaDropdown">
                                    <li>
                                        <a class="dropdown-item" href="#"
                                           >Cinestar Hai Bà Trưng</a
                                        >
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#"
                                           >Cinestar Quang Trung</a
                                        >
                                    </li>
                                </ul>
                            </div>

                            <!-- Dropdown for Movie -->
                            <div class="dropdown">
                                <button
                                    class="btn btn-warning ps-5 pe-5 pt-3 pb-3 dropdown-toggle"
                                    type="button"
                                    id="movieDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    2. Chọn Phim
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="movieDropdown">
                                    <li><a class="dropdown-item" href="#">Movie 1</a></li>
                                    <li><a class="dropdown-item" href="#">Movie 2</a></li>
                                </ul>
                            </div>

                            <!-- Dropdown for Date -->
                            <div class="dropdown">
                                <button
                                    class="btn btn-warning ps-5 pe-5 pt-3 pb-3 dropdown-toggle"
                                    type="button"
                                    id="dateDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    3. Chọn Ngày
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dateDropdown">
                                    <li><a class="dropdown-item" href="#">2025-01-20</a></li>
                                    <li><a class="dropdown-item" href="#">2025-01-21</a></li>
                                </ul>
                            </div>

                            <!-- Dropdown for Showtime -->
                            <div class="dropdown">
                                <button
                                    class="btn btn-warning ps-5 pe-5 pt-3 pb-3 dropdown-toggle"
                                    type="button"
                                    id="showtimeDropdown"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false"
                                    >
                                    4. Chọn Suất
                                </button>
                                <ul
                                    class="dropdown-menu"
                                    aria-labelledby="showtimeDropdown"
                                    >
                                    <li><a class="dropdown-item" href="#">10:00</a></li>
                                    <li><a class="dropdown-item" href="#">14:00</a></li>
                                </ul>
                            </div>
                            <a class="btn btn-success px-4 py-2">Booking</a>
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
