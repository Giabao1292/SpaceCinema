<%-- 
    Document   : listVoucher
    Created on : Mar 17, 2025, 12:33:50 PM
    Author     : LAPTOP ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4 font-monospace">Quản lý người dùng</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                Danh sách người dùng
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Position</th>
                            <th>Address</th>
                            <th>Age</th>
                            <th>Start date</th>
                            <th>Phone number</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Tiger Nixon</td>
                            <td>System Architect</td>
                            <td>Edinburgh</td>
                            <td>61</td>
                            <td>2011/04/25</td>
                            <td>$320,800</td>
                            <td>Something</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btn btn-success">Adding User</div>
    </div>
</main>
