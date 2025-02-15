<%-- 
    Document   : web
    Created on : 18 thg 1, 2025, 15:24:47
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><dec:title default="Home" /></title>
        <link href="/static/web/assets/img/logo.png" rel="icon" />

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect" />
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Inter:wght@100;200;300;400;500;600;700;800;900&family=Cardo:ital,wght@0,400;0,700;1,400;1,700&display=swap"
            rel="stylesheet"
            />
        <link
            href="/static/web/assets/vendor/bootstrap/css/bootstrap.min.css"
            rel="stylesheet"
            />
        <link
            href="/static/web/assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet"
            />
        <link href="/static/web/assets/vendor/aos/aos.css" rel="stylesheet" />
        <link
            href="/static/web/assets/vendor/glightbox/css/glightbox.min.css"
            rel="stylesheet"
            />
        <link href="/static/web/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

        <!-- Main CSS File -->
        <link href="/static/web/assets/css/main.css" rel="stylesheet" />


        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
            integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
            crossorigin="anonymous"
            referrerpolicy="no-referrer"
            />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </head>
    <body class="index-page">
        <%@include file = "/common/web/header.jsp" %>
        <dec:body/>
        <%@include file = "/common/web/footer.jsp" %>
        <a
            href="#"
            id="scroll-top"
            class="scroll-top d-flex align-items-center justify-content-center"
            ><i class="bi bi-arrow-up-short"></i
            ></a>

        <!-- Preloader -->
        <div id="preloader">
            <div class="line"></div>
        </div>
        <script src="/static/web/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="/static/web/assets/vendor/php-email-form/validate.js"></script>
        <script src="/static/web/assets/vendor/aos/aos.js"></script>
        <script src="/static/web/assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="/static/web/assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="/static/web/assets/js/main.js"></script>
    </body>
</html>
