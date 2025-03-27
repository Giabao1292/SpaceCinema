<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
    <head>

        <title><dec:title default="Home" /></title>
        <link href="/static/web/assets/img/logo.png" rel="icon" />
        <link
            href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
            rel="stylesheet"
            />
        <link href="/static/admin/css/styles.css" rel="stylesheet" />
        <script
            src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
            crossorigin="anonymous"
        ></script>
        <script
            src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
            crossorigin="anonymous"
        ></script>
    </head>
    <body class="sb-nav-fixed">
        <!--<!-- header -->
        <%@ include file="/common/admin/header.jsp" %>
        <!-- header -->
        <div id="layoutSidenav">
            <!-- menu -->
            <%@ include file="/common/admin/menu.jsp" %>
            <!-- menu -->
            <div id="layoutSidenav_content">
                <dec:body/>   
            </div>
        </div>

        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"
        ></script>
        <script src="/static/admin/js/scripts.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
            crossorigin="anonymous"
        ></script>
        <script src="/static/admin/assets/demo/chart-area-demo.js"></script>
        <script src="/static/admin/assets/demo/chart-bar-demo.js"></script>
        <script
            src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"
        ></script>
        <script src="/static/admin/js/datatables-simple-demo.js"></script>
    </body>
</html>