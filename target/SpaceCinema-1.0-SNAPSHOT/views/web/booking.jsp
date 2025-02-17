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
                    <h4>${movie.title}</h4>
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
                        <h3>Description</h3>
                        <div>${movie.description}</div>
                        <div>${movie.release_date}</div>
                    </div>
                    <div class="me-3 mt-2">
                        <h3>Content</h3>
                        <div>${movie.synopsis}</div>
                    </div>
                    <div class="d-flex justify-content-between">
                        <a
                            href="${movie.trailer_link}"
                            class="logo d-flex glightbox align-items-center me-auto me-xl-0"
                            >
                            <i class="fs-5 fa-regular fa-circle-play"></i>
                            <h class="ms-1 fs-5 text-white border-bottom border-secondary"
                               >Watch trailer</h
                            >
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- /Gallery Section -->
</main>
