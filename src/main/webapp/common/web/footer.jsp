<%-- Document : footer Created on : 17 thg 1, 2025, 15:51:07 Author : lebao --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@include file ="/common/taglib.jsp" %>
<!DOCTYPE html>
<footer id="footer" class="footer text-white py-4">
    <div class="container">
        <div class="row gy-4">
            <!-- Phần logo và Booking -->
            <div class="col-md-4">
                <div class="d-flex flex-column align-items-center align-items-md-start text-center text-md-start">
                    <!-- Logo -->
                    <div class="d-flex align-items-center gap-2 mb-3">
                        <img width="50" height="50" class="img-fluid rounded-circle" src="/static/web/assets/img/logo.png" alt="Logo"/>
                        <span class="fw-bold fs-5">SpaceCinema</span>
                    </div>

                    <!-- Nút Booking -->
                    <a class="btn btn-warning fw-bold px-4 py-2" href="#!">Booking Now</a>

                    <!-- Download Application -->
                    <div class="mt-3">
                        <p class="fw-bold fs-6">Download Application</p>
                        <div class="d-flex gap-3">
                            <a href="#!">
                                <img src="https://raw.githubusercontent.com/Giabao1292/SpaceCinema/refs/heads/footer/src/main/webapp/static/web/assets/img/androi-download.png" alt="Android Download" class="img-fluid rounded-3" width="120"/>
                            </a>
                            <a href="#!">
                                <img src="https://raw.githubusercontent.com/Giabao1292/SpaceCinema/refs/heads/footer/src/main/webapp/static/web/assets/img/appstore-download.png" alt="App Store Download" class="img-fluid rounded-3" width="130"/>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Phần danh sách liên kết -->
            <div class="col-md-8">
                <div class="row">
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled">
                            <li class="fw-bold fs-4 text-success">SpaceCinema</li>
                            <li class="py-1"><a href="#!" class="text-white text-decoration-none">Introduction</a></li>
                            <li class="py-1"><a href="#!" class="text-white text-decoration-none">Contact</a></li>
                            <li class="py-1"><a href="#!" class="text-white text-decoration-none">Recruitment</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled">
                            <li class="fw-bold fs-4 text-success">Account</li>
                            <li class="py-1"><a href="/login?action=login" class="text-white text-decoration-none">Login</a></li>
                            <li class="py-1"><a href="/register?action=register" class="text-white text-decoration-none">Sign up</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled">
                            <li class="fw-bold fs-4 text-success">Movies</li>
                            <li class="py-1"><a href="#!" class="text-white text-decoration-none">Now Showing</a></li>
                            <li class="py-1"><a href="#!" class="text-white text-decoration-none">Coming Soon</a></li>
                        </ul>
                    </div>
                    <div class="col-6 col-md-3">
                        <ul class="list-unstyled">
                            <li class="fw-bold fs-4 text-success">Cinemas</li>
                                <c:forEach var="cinema" items="${listCinema}">
                                <li class="py-1"><a href="#!" class="text-white text-decoration-none">${cinema.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Copyright và social links -->
        <div class="text-center mt-4">
            <div class="fw-bold d-flex justify-content-center align-items-center gap-2">
                <img width="50" height="50" class="img-fluid rounded-circle" src="/static/web/assets/img/logo.png" alt="Logo"/>
                <span class="fs-5">SpaceCinema</span>
            </div>
            <p class="mt-2 fs-6">
                Project SpaceCinema made by Group Class SE18D07. Address: FPT University Da Nang. 
                Started on Jan 17, 2025. Hope you enjoy our website!
            </p>

            <!-- Social links -->
            <div class="d-flex justify-content-center gap-3 fs-4">
                <a href="#" class="text-white"><i class="bi bi-twitter-x"></i></a>
                <a href="#" class="text-white"><i class="bi bi-facebook"></i></a>
                <a href="#" class="text-white"><i class="bi bi-instagram"></i></a>
                <a href="#" class="text-white"><i class="bi bi-linkedin"></i></a>
            </div>

            <p class="mt-3 small text-secondary">Designed by Group SE18D07</p>
        </div>
    </div>
</footer>

