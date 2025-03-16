<%-- 
    Document   : listMovie.jsp
    Created on : 9 thg 2, 2025, 15:27:52
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

        <div class="card mt-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                List Snack
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Type</th>
                            <th>Name</th>
                            <th>Price</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="s" items="${snacks}" >
                            <tr>
                                <td>${s.type}</td>
                                <td>${s.name}</td>
                                <td>${s.price}$</td>
                                <td>
                                    <button 
                                        class="bg-danger border-0 rounded"
                                        data-bs-toggle="modal" 
                                        data-bs-target="#confirmDeleteModal-${s.id}"
                                        >
                                        <i class="fa-solid fa-delete-left"></i>
                                    </button>
                                    <!-- Modal Bootstrap -->
                                    <div class="modal fade" id="confirmDeleteModal-${s.id}" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Confirm Deletion</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure you want to delete this snack: <strong>${s.name}</strong>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="/admin-home/popcorn?action=delete&id=${s.id}" class="btn btn-danger">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href = "/admin-home/popcorn?action=update&id=${s.id}" class = "text-decoration-none">
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
                <a href="/admin-home/popcorn?action=create"
                   ><button type="submit" class="btn btn-success">
                        Add Snack
                    </button></a
                >
            </div>
        </div>
    </div>
</main>

