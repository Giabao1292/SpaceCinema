<%-- 
    Document   : header
    Created on : 17 thg 1, 2025, 15:51:01
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>

<header
    id="header"
    class="header border-bottom border-secondary d-flex align-items-center sticky-top"
    >
    <div
        class="container position-relative d-flex align-items-center justify-content-between"
        >
        <a
            href="/home"
            class="logo d-flex align-items-center me-auto me-xl-0"
            >
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <i class="fa-solid fa-film"></i>
            <h1 class="sitename">SpaceCinema</h1>
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li>
                    <a href="/home" class="btn btn-primary active m-lg-2"
                       >Boooking Ticket<br
                            /></a>
                </li>
                <li>
                    <a href="/popcorn-drink" class="btn btn-warning text-dark  m-lg-2"
                       >Booking Snack</a
                    >
                </li>
                <li class="dropdown">
                    <a href ="#"
                       ><span>Cinema</span>
                        <i class="bi bi-chevron-down toggle-dropdown"></i>
                    </a>
                    <ul>
                        <c:forEach var = "cinema" items="${listCinema}">
                            <li>
                                <a class="dropdown-item pe-auto" href ="/book-ticket?cinema=${cinema.name}" data-cinema="${cinema.name}"><i class="bi bi-geo-alt-fill"></i> ${cinema.name}
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li><a href="/news">News</a></li>
                <li><a href="/promotion">Promotion</a></li>
                <li>
                    <c:if test = "${not empty USER}">
                        <a href="/logout?action=logout" class="btn btn-success p-3">
                            <span class="logo d-flex align-items-center me-auto me-xl-0"
                                  ><i class="fa-regular fa-user"></i>${USER.fullName}</span
                            ></a
                        >
                    </c:if>

                    <c:if test = "${empty USER}">
                        <a href="/login?action=login" class="btn btn-success p-3">
                            <span class="logo d-flex align-items-center me-auto me-xl-0"
                                  ><i class="fa-regular fa-user"></i>Login</span
                            ></a
                        >
                    </c:if>
                </li>
            </ul>
            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>

        <div class="header-social-links">
            <a href="#" class="twitter"><i class="bi bi-twitter-x"></i></a>
            <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
            <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
            <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        </div>
    </div>
</header>
