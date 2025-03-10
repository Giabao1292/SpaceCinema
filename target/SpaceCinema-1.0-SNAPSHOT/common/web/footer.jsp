<%-- Document : footer Created on : 17 thg 1, 2025, 15:51:07 Author : lebao --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@include file =
"/common/taglib.jsp" %>
<!DOCTYPE html>
<footer id="footer" class="footer">
    <div class="container">
        <div class="footer__row gap-3">
            <div class="footer__social">
                <!-- Logo -->
                <div class="logo d-flex align-items-center gap-2 mb-3">
                    <img
                        width="50"
                        height="50"
                        class="logo__img img-fluid rounded-circle"
                        src="/static/web/assets/img/logo.png"
                        alt="Logo"
                    />
                    <span class="logo__text fw-bold fs-5">SpaceCinema</span>
                </div>

                <!-- Nút Booking -->
                <a class="btn btn-warning px-4 py-2 fw-bold" href="#!"
                    >Booking Now</a
                >

                <!-- Download Application -->
                <div class="footer__download mt-3">
                    <p class="download__text mt-3 mt-md-0 fw-bold fs-5">
                        Download Application
                    </p>
                    <div class="d-flex gap-3">
                        <a href="#!">
                            <img
                                src="/static/web/assets/img/androi-download.png"
                                alt="Android Download"
                                class="download__img img-fluid rounded-3"
                                width="120"
                            />
                        </a>
                        <a href="#!">
                            <img
                                src="/static/web/assets/img/appstore-download.png"
                                alt="App Store Download"
                                class="download__img img-fluid rounded-3"
                                width="130"
                            />
                        </a>
                    </div>
                </div>
            </div>
            <div class="footer__content row">
                <!-- <ul class="footer__list">
                    <span class="fw-bold fs-5">SpaceCinema</span>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Introduction</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Contact</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Recruitment</a>
                    </li>
                </ul>
                <ul class="footer__list">
                    Account
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Login</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Sign up</a>
                    </li>
                </ul>
                <ul class="footer__list">
                    Movie
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Now Showing Movies</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Coming Soon Movies</a>
                    </li>
                </ul>
                <ul class="footer__list">
                    SpaceCinema System
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Đà Nẵng</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Huế</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Hồ Chí Minh</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Hà Nội</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Gia Lai</a>
                    </li>
                    <li class="footer__item">
                        <a href="#!" class="footer__link">Đắk Lắk</a>
                    </li>
                </ul> -->
                <div class="footer__content">
                    <ul class="footer__list">
                        <span class="fw-bold fs-5">SpaceCinema</span>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Introduction</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Contact</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Recruitment</a>
                        </li>
                    </ul>
                    <ul class="footer__list">
                        <span class="fw-bold fs-5">SpaceCinema</span>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Login</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Sign up</a>
                        </li>
                    </ul>
                    <ul class="footer__list">
                        <span class="fw-bold fs-5">SpaceCinema</span>
                        <li class="footer__item">
                            <a href="#!" class="footer__link"
                                >Now Showing Movies</a
                            >
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link"
                                >Coming Soon Movies</a
                            >
                        </li>
                    </ul>
                    <ul class="footer__list">
                        <span class="fw-bold fs-5">SpaceCinema</span>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Đà Nẵng</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Huế</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Hồ Chí Minh</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Hà Nội</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Gia Lai</a>
                        </li>
                        <li class="footer__item">
                            <a href="#!" class="footer__link">Đắk Lắk</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="copyright text-center mt-3">
            <p>
                <strong class="px-1 sitename">
                    <img
                        width="50"
                        height="50"
                        class="logo__img img-fluid rounded-circle"
                        src="/static/web/assets/img/logo.png"
                        alt="Logo"
                    />
                    <span class="logo__text fw-bold fs-5">SpaceCinema</span>
                </strong>
            </p>
        </div>
        <div class="intro text-center mt-3 px-4 w-75 mx-auto fs-7">
            Project SpaceCinema Made By Group Class SE18D07. Address: FPT
            University Da Nang Project started setting up in Jan 17 2025. Now,
            it's time to release our proud project to everyone. Hope you guys
            have a great experience to our website.
        </div>
        <div class="social-links d-flex justify-content-center">
            <a href=""><i class="bi bi-twitter-x"></i></a>
            <a href=""><i class="bi bi-facebook"></i></a>
            <a href=""><i class="bi bi-instagram"></i></a>
            <a href=""><i class="bi bi-linkedin"></i></a>
        </div>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you've purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: [buy-url] -->
            Designed by Group SE18D07
        </div>
    </div>
</footer>
