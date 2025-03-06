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
                                    <button type="button" class="bg-danger border-0 rounded" data-bs-toggle="modal" data-bs-target="#deleteModal${m.id}">
                                        <i class="fa-solid fa-delete-left"></i>
                                    </button>
                                    <div class="modal fade" id="deleteModal${m.id}" tabindex="-1" aria-labelledby="deleteModalLabel${m.id}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteModalLabel${m.id}">Delete</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure you want to delete the movie <strong>${m.title}</strong>?
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                                    <a href="/admin-home/movie?action=delete&movie_id=${m.id}" class="btn btn-danger">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="/admin-home/movie?action=update&movie_id=${m.id}" class="text-decoration-none">
                                        <button type="button" class="bg-primary border-0 rounded">
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
