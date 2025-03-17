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
                <a class="nav-link" href="/admin-home">
                    <div class="sb-nav-link-icon">
                        <i class="fas fa-house"></i>
                    </div>
                    Home
                </a>
                <div class="sb-sidenav-menu-heading">Interface</div>
                <a class="nav-link" href="/admin-home/movie">
                    <div class="sb-nav-link-icon">
                        <i class="fa-solid fa-film"></i>
                    </div>
                    Movie
                </a>
                <a class="nav-link" href="/admin-home/popcorn">
                    <div class="sb-nav-link-icon">
                        <i class="fa-solid fa-pizza-slice"></i>
                    </div>
                    Popcorn
                </a>
                <c:if test = "${role eq 'admin'}">
                    <a class="nav-link" href="/admin-home/user">
                        <div class="sb-nav-link-icon">
                            <i class="fas fa-user"></i>
                        </div>
                        User
                    </a>
                </c:if>
                <a class="nav-link" href="/admin-home/voucher">
                    <div class="sb-nav-link-icon">
                        <i class="fa-solid fa-pizza-slice"></i>
                    </div>
                    Voucher
                </a>
            </div>
        </div>
    </nav>
</div>