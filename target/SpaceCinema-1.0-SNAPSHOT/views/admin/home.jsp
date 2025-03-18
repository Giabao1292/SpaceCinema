<%-- 
   Document   : home.jsp
   Created on : 17 thg 1, 2025, 16:04:54
   Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>
<!DOCTYPE html>

<head>
    <title>Home</title>
</head>
<style>
    /* Màu nền mặc định */
    .daily-visits-card {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        transition: background 0.5s ease-in-out;
    }

    .revenue-card {
        background: linear-gradient(135deg, #ff512f, #dd2476);
        transition: background 0.5s ease-in-out;
    }

    .orders-card {
        background: linear-gradient(135deg, #11998e, #38ef7d);
        transition: background 0.5s ease-in-out;
    }

    .users-card {
        background: linear-gradient(135deg, #fc4a1a, #f7b733);
        transition: background 0.5s ease-in-out;
    }

    /* Hover effect - đổi màu */
    .daily-visits-card:hover {
        background: linear-gradient(135deg, #2a5298, #1e3c72);
    }

    .revenue-card:hover {
        background: linear-gradient(135deg, #dd2476, #ff512f);
    }

    .orders-card:hover {
        background: linear-gradient(135deg, #38ef7d, #11998e);
    }

    .users-card:hover {
        background: linear-gradient(135deg, #f7b733, #fc4a1a);
    }

    /* Hiệu ứng phóng to icon khi hover */
    .icon-hover {
        transition: transform 0.3s ease-in-out;
    }

    .icon-hover:hover {
        transform: scale(1.2);
    }

</style>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Welcome ${USER.userName}</h1>
        <div class="row g-3">
            <!-- Daily Visits -->
            <div class="col-xl-6 col-md-12">
                <div class="card daily-visits-card shadow-lg border-0 rounded-4 d-flex flex-row justify-content-between align-items-center p-3">
                    <div class="card-body text-start">
                        <h5 class="text-uppercase fw-bold text-white mb-2">Daily Visits</h5>
                        <h2 class="fw-bold display-4">8,386</h2>
                    </div>
                    <div class="d-flex justify-content-center">
                        <i class="fa-solid fa-eye text-warning fs-1 cursor-pointer icon-hover"></i>
                    </div>
                </div>
            </div>

            <!-- Revenue -->
            <div class="col-xl-6 col-md-12">
                <div class="card revenue-card shadow-lg border-0 rounded-4 d-flex flex-row justify-content-between align-items-center p-3">
                    <div class="card-body text-start">
                        <h5 class="text-uppercase fw-bold text-white mb-2">Total Income</h5>
                        <h2 class="fw-bold display-4">$${revenue}</h2>
                    </div>
                    <div class="d-flex justify-content-center">
                        <i class="fa-solid fa-dollar-sign text-warning fs-1 cursor-pointer icon-hover"></i>
                    </div>
                </div>
            </div>

            <!-- Orders -->
            <div class="col-xl-6 col-md-12">
                <div class="card orders-card shadow-lg border-0 rounded-4 d-flex flex-row justify-content-between align-items-center p-3">
                    <div class="card-body text-start">
                        <h5 class="text-uppercase fw-bold text-white mb-2">User visited</h5>
                        <h2 class="fw-bold display-4">${totalLoggedUsers}</h2>
                    </div>
                    <div class="d-flex justify-content-center">
                        <i class="fa-solid fa-bag-shopping text-warning fs-1 cursor-pointer icon-hover"></i>
                    </div>
                </div>
            </div>

            <!-- Users -->
            <div class="col-xl-6 col-md-12">
                <div class="card users-card shadow-lg border-0 rounded-4 d-flex flex-row justify-content-between align-items-center p-3">
                    <div class="card-body text-start">
                        <h5 class="text-uppercase fw-bold text-white mb-2">Online</h5>
                        <h2 class="fw-bold display-4">${activeUser}</h2>
                    </div>
                    <div class="d-flex justify-content-center">
                        <i class="fa-solid fa-users text-warning fs-1 cursor-pointer icon-hover"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Daily Sales Report
                    </div>
                    <div class="card-body">
                        <canvas id="myAreaChart" width="100%" height="40"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-bar me-1"></i>
                        Monthly Sales Report
                    </div>
                    <div class="card-body">
                        <canvas id="myBarChart" width="100%" height="40"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                List Top User Booking
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Total Price Booking</th>
                            <th>Total Number Booking</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="b" items="${booking}">
                            <tr>
                                <td>${b.user_name}</td>
                                <td>${b.email}</td>
                                <td>${b.price}</td>
                                <td>${b.numBooking}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>