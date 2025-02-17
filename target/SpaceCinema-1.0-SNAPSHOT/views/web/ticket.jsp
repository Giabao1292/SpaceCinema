<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<main class="main">
    <!-- Gallery Section -->
    <section id="gallery" class="gallery section">
        <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4 justify-content-center">
                <div class="col-xl-3 col-md-6" style = "margin-bottom: 4rem">
                    <div class="gallery-item h-100">
                        <img
                            src="${movie.header_image}"
                            class="img-fluid"
                            alt=""
                            />
                    </div>

                    <h1>${movie.title}</h1>
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
                        <a class="btn btn-warning px-4 py-2" href="#">Booking now</a>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 fs-6" style = "margin-bottom: 4rem">
                    <h2>${movie.title}</h2>
                    <div class = "d-flex">
                        <div>
                            <i class="fa-solid fa-tag text-warning"></i> 
                            <c:forEach items = "${movie.genre}" var = "g" varStatus = "st">
                                <span>${g}</span>
                                <c:if test="${!st.last}">, </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class = "me-3"><i class="fa-regular fa-clock text-warning"></i> ${movie.runtime_min}</div>
                    <div class = "me-3">
                        <i class="fa-solid fa-earth-americas text-warning"></i>
                        Language
                    </div>
                    <div class = "me-3">
                        <i class="fa-solid fa-cake-candles text-warning"></i> ${movie.age_rating}
                    </div>
                    <div class = "me-3">
                        <i class="fa-solid fa-bullhorn text-warning"></i> ${movie.director}
                    </div>
                </div>

                <!-- End Gallery Item -->


                <!-- End Gallery Item -->
            </div>
        </div>
    </section>
</main>

