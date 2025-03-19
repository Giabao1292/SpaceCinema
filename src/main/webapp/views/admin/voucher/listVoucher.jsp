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
        <h1 class="mt-4 font-monospace">Voucher Management</h1>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                List Voucher
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Voucher Name</th>
                            <th>Description</th>
                            <th>Discount</th>
                            <th>Users can use voucher</th>
                            <th>Eligible users</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="v" items="${vouchers}">
                            <tr>
                                <td>${v.name}</td>
                                <td>${v.description}</td>
                                <td>${v.discount}</td>
                                <td>
                                    <c:forEach var="u" items="${v.users}" varStatus="status" >
                                        ${u.userName}${!status.last ? ',' : ''}
                                    </c:forEach>
                                </td>
                                <td>${v.numUsers}</td>
                                <td>
                                    <button
                                        class="bg-danger border-0 rounded"
                                        data-bs-toggle="modal" 
                                        data-bs-target="#confirmDeleteModal-${v.id}"
                                        >
                                        <i class="fa-solid fa-delete-left"></i>
                                    </button>
                                    <!-- Modal Bootstrap -->
                                    <div class="modal fade" id="confirmDeleteModal-${v.id}" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Confirm Deletion</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure you want to delete this voucher <strong>${v.name}</strong>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="/admin-home/voucher?action=delete&id=${v.id}" class="btn btn-danger">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href = "/admin-home/voucher?action=update&id=${v.id}" class = "text-decoration-none">
                                        <button
                                            type="submit"
                                            class="bg-primary border-0 rounded"
                                            >
                                            <i class="fa-regular fa-pen-to-square"></i>
                                        </button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <a href="/admin-home/voucher?action=create"
           ><button type="submit" class="btn btn-success">
                Add Voucher
            </button></a
        >
    </div>
</main>
