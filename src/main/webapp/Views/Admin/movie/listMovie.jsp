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
                            <th>Name</th>
                            <th>Address</th>
                            <th>Manager name</th>
                            <th>Phone number</th>
                            <th>Number of basements</th>
                            <th>Floor area</th>
                            <th>Rent area</th>
                            <th>Commission($)</th>
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
                            <td>$320,800</td>
                            <td>
                                <a href = "/admin-home/movie?action=delete">
                                    <button
                                        type="submit"
                                        class="bg-danger border-0 rounded"
                                        >
                                        <i class="fa-solid fa-delete-left"></i>
                                    </button>
                                </a>
                                <a href = "/admin-home/movie?action=update">
                                    <button
                                        type="submit"
                                        class="bg-primary border-0 rounded"
                                        >
                                        <i class="fa-regular fa-pen-to-square"></i>
                                    </button>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <a href="/admin-home/movie?action=create"
                   ><button type="submit" class="btn btn-success">
                        Add Movie
                    </button></a
                >
            </div>
        </div>
    </div>
</main>
