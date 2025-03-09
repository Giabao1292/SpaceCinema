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
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Revenue Report</h1>
        <div class="row">
            <div class="col-xl-6 col-md-12">
                <div class="card bg-danger text-white mb-4">
                    <div class="card-body text-dark">
                        <div class="text-decoration-underline">100000$</div>
                        <div>Số dư Banking</div>
                    </div>
                    <div
                        class="card-footer d-flex align-items-center justify-content-between"
                        >
                        <a
                            class="small font-monospace text-warning text-decoration-none"
                            href="#"
                            >WithDrawn</a
                        >
                        <div class="small text-white">
                            <i class="fas fa-angle-right"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header fs-5">
                        <i class="fa-solid fa-coins"></i>
                        Profit : 109403.7$
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <div class="card mb-4">
                    <div class="card-header  fs-5">
                        <i class="fa-regular fa-user"></i>
                        Active Users : ${activeUser}
                    </div>
                </div>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                List Users
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Order Count</th>
                            <th>Total spent</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Shad Decker</td>
                            <td>Regional Director</td>
                            <td>Edinburgh</td>
                            <td>51</td>
                            <td>2008/11/13</td>
                        </tr>
                        <tr>
                            <td>Michael Bruce</td>
                            <td>Javascript Developer</td>
                            <td>Singapore</td>
                            <td>29</td>
                            <td>2011/06/27</td>
                        </tr>
                        <tr>
                            <td>Donna Snider</td>
                            <td>Customer Support</td>
                            <td>New York</td>
                            <td>27</td>
                            <td>2011/01/25</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>