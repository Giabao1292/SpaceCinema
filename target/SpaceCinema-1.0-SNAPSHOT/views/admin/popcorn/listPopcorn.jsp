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
                                    <a href = "/admin-home/popcorn?action=delete&id=${s.id}" class = "text-decoration-none">
                                        <button
                                            type="submit"
                                            class="bg-danger border-0 rounded"
                                            >
                                            <i class="fa-solid fa-delete-left"></i>
                                        </button>
                                    </a>
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