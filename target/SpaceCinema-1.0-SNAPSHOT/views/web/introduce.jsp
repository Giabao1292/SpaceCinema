<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>About Our Website</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

    <!-- Header -->
    <header class="bg-dark text-white text-center py-5">
        <h1>Welcome to Our Website</h1>
        <p class="lead">Discover our amazing features and services</p>
    </header>

    <!-- Image Carousel with Names -->
    <div class="container my-5">
        <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5"></button>
                <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6"></button>
            </div>
            <div class="carousel-inner text-center">
                <div class="carousel-item active">
                    <img src="https://api-website.cinestar.com.vn/media/MageINIC/bannerslider/HUE-01_Mat_Tien.jpg" class="d-block w-100" alt="Image 1">
                    <h5 class="mt-5">SpaceCinema Đà Nẵng</h5>
                </div>
                <div class="carousel-item">
                    <img src="https://api-website.cinestar.com.vn/media/MageINIC/bannerslider/01-Mat-Tien.jpg" class="d-block w-100" alt="Image 2">
                    <h5 class="mt-5">SpaceCinema Huế</h5>
                </div>
                <div class="carousel-item">
                    <img src="https://api-website.cinestar.com.vn/media/MageINIC/bannerslider/Sinh-Vien-01-Facade.jpg" class="d-block w-100" alt="Image 3">
                    <h5 class="mt-5">SpaceCinema Hà Nội</h5>
                </div>
                <div class="carousel-item">
                    <img src="https://api-website.cinestar.com.vn/media/MageINIC/bannerslider/Lam-Dong-01-Facade.jpg" class="d-block w-100" alt="Image 4">
                    <h5 class="mt-5">SpaceCinema Hồ Chí Minh</h5>
                </div>
                <div class="carousel-item">
                    <img src="https://api-website.cinestar.com.vn/media/MageINIC/bannerslider/Kien-Giang-01-Facade.jpg" class="d-block w-100" alt="Image 5">
                    <h5 class="mt-5">SpaceCinema Gia Lai</h5>
                </div>
                <div class="carousel-item">
                    <img src="https://api-website.cinestar.com.vn/media/MageINIC/bannerslider/My-Tho-01-Facade.jpg" class="d-block w-100" alt="Image 6">
                    <h5 class="mt-5">SpaceCinema Đắk Lắk</h5>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon"></span>
            </button>
        </div>
    </div>

    <!-- About Section -->
    <div class="container text-center my-5">
        <h2>About Our Website</h2>
        <p class="lead">
            Our website offers a unique experience where you can explore the latest features and services. 
            We strive to bring high-quality content, seamless navigation, and a visually appealing interface.
        </p>
    </div>
</body>
