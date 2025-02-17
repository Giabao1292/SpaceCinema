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
                List Manager
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>UserName</th>
                            <th>FullName</th>
                            <th>Manager name</th>
                            <th>Phone number</th>
                            <th>Email</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="u" items="${users}">
                            <tr>
                                <td>${u.userName}</td>
                                <td>${u.fullName}</td>
                                <td>${u.phone}</td>
                                <td>${u.email}</td>
                                <td>
                                    <c:forEach var="r" items="${u.role}" varStatus = "status">
                                        ${r.name}
                                        <c:if test = "${!status.last}">, </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <a href = "/admin-home/user?action=delete">
                                        <button
                                            type="submit"
                                            class="bg-danger border-0 rounded"
                                            >
                                            <i class="fa-solid fa-delete-left"></i>
                                        </button>
                                    </a>
                                    <a href = "/admin-home/user?action=update">
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
                <a href="/admin-home/user?action=create"
                   ><button type="submit" class="btn btn-success">
                        Add User
                    </button></a
                >
            </div>
        </div>
    </div>
</main>
