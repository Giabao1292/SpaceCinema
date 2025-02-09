<%-- 
    Document   : header
    Created on : 17 thg 1, 2025, 15:51:01
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<!DOCTYPE html>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">Core</div>
                <a class="nav-link" href="index.html">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-tachometer-alt"></i>
                    </div>
                    Trang chủ
                </a>
                <div class="sb-sidenav-menu-heading">Interface</div>
                <a
                    class="nav-link collapsed"
                    href="/admin-home/movie"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseLayouts"
                    aria-expanded="false"
                    aria-controls="collapseLayouts"
                    >
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-columns"></i>
                    </div>
                    Movie
                </a>
                <a
                    class="nav-link collapsed"
                    href="#"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapsePages"
                    aria-expanded="false"
                    aria-controls="collapsePages"
                    >
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-book-open"></i>
                    </div>
                    Người dùng

                    <div class="sb-sidenav-collapse-arrow">
                        <i class="fas fa-angle-down"></i>
                    </div>
                </a>
                <div
                    class="collapse"
                    id="collapsePages"
                    aria-labelledby="headingOne"
                    data-bs-parent="#sidenavAccordion"
                    >
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="user-list.html"
                           >Quản lý người dùng</a
                        >
                    </nav>
                </div>
            </div>
        </div>
    </nav>
</div>