<%-- 
    Document   : home.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
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
                        <h3>Description</h3>
                        <div>${movie.description}</div>
                        <div>Release Date : ${movie.release_date}</div>
                        <span>Actor :</span>
                        <c:forEach items = "${movie.cast}" var = "c" varStatus = "statusCast">
                            <span>${c}</span>
                            <c:if test = "${!statusCast.last}">, </c:if>
                        </c:forEach>
                    </div>
                    <div class="me-3 mt-2">
                        <h3>Content</h3>
                        <div>${movie.synopsis}${movie.synopsis}${movie.synopsis}${movie.synopsis}${movie.synopsis}${movie.synopsis}${movie.synopsis}</div>
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
            <div class="row gy-4 justify-content-center text-center">
                <h1>Showing date</h1>
                <div class="dropdown">
                    <c:forEach items = "${movie.times.keySet()}" var = "date">
                        <button class = "btn btn-transparent border border-warning text-warning mt-1 p-3">${date}</button>
                    </c:forEach>
                </div>
            </div>
            <div class="row gy-4 justify-content-center d-flex text-center">
                <h1 class = "col-6">Showing time</h1>
                <div class="dropdown col-6">
                    <button
                        class="btn btn-transparent border border-warning text-warning mt-1 dropdown-toggle"
                        type="button"
                        id="cinemaDropdown"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                        >
                        <i class="bi bi-geo-alt-fill"></i> ${cinema}
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="cinemaDropdown">
                        <c:forEach var = "cinema" items="${listCinema}">
                            <li>
                                <a class="dropdown-item" data-cinema="${cinema.name}"><i class="bi bi-geo-alt-fill"></i> ${cinema.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="row gy-4 justify-content-center text-center">
                <div class = "text-white">
                    <button id="toggleButton" class="btn btn-transparent border border-white text-white w-75 mt-1" data-idmain = "${status.index}" data-id="${statusDate.index}">
                        <div class = "d-flex justify-content-between">
                            <h3>${cinema}</h3>
                            <h5><i class="bi bi-arrow-down"></i></h5>
                        </div>
                        <div id="content" class="hidden text-start">
                            <c:forEach var = "time" items = "${movieitem.times[date]}">
                                <a class = "btn text-white border border-white mt-1">${time}</a>
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
    });
</script>
