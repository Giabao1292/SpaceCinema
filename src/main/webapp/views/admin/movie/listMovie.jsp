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
                List Movie
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                        <tr>
                            <th>Movie Name</th>
                            <th>Cinema</th>
                            <th>Director</th>
                            <th>Cast</th>
                            <th>Genre</th>
                            <th>Runtime</th>
                            <th>Age</th>
                            <th>Release</th>
                            <th>Status</th>
                            <th>Console</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="m" items="${movies}">
                            <tr>
                                <td>${m.title}</td>
                                <td>
                                    <c:forEach var="c" items="${m.cinema}" varStatus="status" >
                                        ${c.name}
                                        <c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </td>
                                <td>${m.director}</td>
                                <td>
                                    <c:forEach var="c" items="${m.cast}" varStatus="status" >
                                        ${c}
                                        <c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:forEach var="g" items="${m.genre}" varStatus="status" >
                                        ${g}
                                        <c:if test="${!status.last}">, </c:if>
                                    </c:forEach>
                                </td>   
                                <td>${m.runtime_min}</td>
                                <td>${m.age_rating}</td>
                                <td>${m.release_date}</td>
                                <td>${m.status}</td>
                                <td>
                                    <a href = "/admin-home/movie?action=delete" class = "text-decoration-none">
                                        <button
                                            type="submit"
                                            class="bg-danger border-0 rounded"
                                            >
                                            <i class="fa-solid fa-delete-left"></i>
                                        </button>
                                    </a>
                                    <a href = "/admin-home/movie?action=update" class = "text-decoration-none">
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
                <a href="/admin-home/movie?action=create"
                   ><button type="submit" class="btn btn-success">
                        Add Movie
                    </button>
                </a>
            </div>
        </div>
    </div>
</main>
