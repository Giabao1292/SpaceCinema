<%-- 
    Document   : ticket.jsp
    Created on : 17 thg 1, 2025, 16:00:00
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<main class="main">
    <section id="gallery" class="gallery section">
        <div class="container-fluid" data-aos="fade-up" data-aos-delay="100">
            <div class="row gy-4 justify-content-center">
                <c:forEach var = "movieitem" varStatus="status" items= "${movieCinema}">
                    <div class="col-xl-3 col-md-6" style = "margin-bottom: 4rem">
                        <div class="gallery-item h-100">
                            <img
                                src="${movieitem.header_image}"
                                class="img-fluid"
                                alt=""
                                />
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
                            <a class="btn btn-warning px-4 py-2" href="/book-ticket?movie=${movieitem.title}">Booking now</a>
                        </div>
                    </div>
                    <div class="col-xl-3 col-md-6" style = "margin-bottom: 4rem">
                        <h4>${movieitem.title}</h4>
                        <div class = "d-flex">
                            <div>
                                <i class="fa-solid fa-tag text-warning"></i> 
                                <c:forEach items = "${movieitem.genre}" var = "g" varStatus = "st">
                                    <span>${g}</span>
                                    <c:if test="${!st.last}">, </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class = "d-flex"> 
                            <div class = "me-3"><i class="fa-regular fa-clock text-warning"></i> ${movieitem.runtime_min}</div>
                            <div class = "me-3">
                                <i class="fa-solid fa-earth-americas text-warning"></i>
                                Language
                            </div>
                        </div>
                        <div class = "d-flex">
                            <div class = "me-3">
                                <i class="fa-solid fa-cake-candles text-warning"></i> ${movieitem.age_rating}
                            </div>
                            <div class = "me-3">
                                <i class="fa-solid fa-bullhorn text-warning"></i> ${movieitem.director}
                            </div>
                        </div>
                        <div class = "text-white">
                            <c:forEach var = "date" items = "${movieitem.times.keySet()}" varStatus="statusDate">
                                <div class="btn btn-transparent border border-warning text-white w-75 mt-1" data-idmain = "${status.index}" data-id="${statusDate.index}">
                                    <div class = "toggleButton d-flex justify-content-between">
                                        <span>${date}</span>
                                        <span><i class="bi bi-arrow-down"></i></span>
                                    </div>
                                    <div id="content-${status.index}-${statusDate.index}" class="hidden text-start">
                                        <c:forEach var = "time" items = "${movieitem.times[date]}">
                                            <a class = "btn btn-warning text-black mt-1" href = "book-ticket?cinema=${cinema}&movie=${movieitem.title}&date=${date}&time=${time}">${time}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>
    <script>
        $(document).ready(function () {
            $(document).ready(function () {
                $(".toggleButton").click(function () {
                    let parent = $(this).closest(".btn-transparent");
                    let id = parent.data("id");
                    let idmain = parent.data("idmain");
                    console.log(id + " " + idmain);
                    $("#content-" + idmain + "-" + id).slideToggle();
                });
            });
        });
    </script>
    <!-- /Gallery Section -->
</main>


