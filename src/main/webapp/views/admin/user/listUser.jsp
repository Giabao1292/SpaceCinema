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
                            <th>Phone</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Status</th>
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
                                    <form action="/admin-home/user" method="post">
                                        <input type="hidden" name="action" value="updateManager"/>
                                        <input type="hidden" name="user_id" value="${u.id}"/>
                                        <c:set var="isManager" value="false" />
                                        <c:forEach var="r" items="${u.role}">
                                            <c:if test="${r.name eq 'Manager'}">
                                                <c:set var="isManager" value="true" />
                                            </c:if>
                                        </c:forEach>

                                        <input type="hidden" name="role" value="${isManager ? 'No' : 'Manager'}"  />

                                        <button type="submit" class="btn ${isManager ? 'btn-danger' : 'btn-success'}">
                                            ${isManager ? 'Hủy quyền' : 'Phân quyền'}
                                        </button>
                                    </form>
                                </td>
                                <!--                                <td>
                                <c:set var="s" value="${u.status}" />
                                <c:choose>
                                    <c:when test="${s == 1}">
                                        Active
                                        <form action="/admin-home/user" method="post" >
                                            <input type="hidden" name="action" value="updateStatus" >
                                            <input type="hidden" name="user_id" value="${u.id}" >
                                            <input type="hidden" name="status" value="inactive" >
                                            <input type="submit" value="Inactive" >
                                        </form>
                                    </c:when>
                                    <c:otherwise>
                                        Inactive
                                        <form action="/admin-home/user" method="post" >
                                            <input type="hidden" name="action" value="updateStatus" >
                                            <input type="hidden" name="user_id" value="${u.id}" >
                                            <input type="hidden" name="status" value="active" >
                                            <input type="submit" value="Acitve" >
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                            </td>-->
                                <td>${u.status == 1 ? "Active" : "Inactive"}
                                    <form action="/admin-home/user" method="post">
                                        <input type="hidden" name="action" value="updateStatus">
                                        <input type="hidden" name="user_id" value="${u.id}">
                                        <input type="hidden" name="status" value="${u.status == 1 ? 0 : 1}">
                                        <input type="submit" value="${u.status == 1 ? 'Inactive' : 'Active'}">
                                    </form>
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
