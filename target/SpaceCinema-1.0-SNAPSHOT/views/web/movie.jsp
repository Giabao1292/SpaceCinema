<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<% String cinema = (String) request.getAttribute("cinema"); %>
<!DOCTYPE html>
<main class="main">
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

