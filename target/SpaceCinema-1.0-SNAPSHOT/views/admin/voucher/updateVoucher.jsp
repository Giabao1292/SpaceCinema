<%-- 
    Document   : updateVoucher
    Created on : Mar 17, 2025, 12:48:46 PM
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
        <div class="container mt-4">
            <h2 class="font-monospace">Update Voucher</h2>
            <form id="voucherForm" action="/admin-home/voucher" method="POST">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="${id}">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="name" class="form-label">Voucher Name</label>
                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            name="voucherName"
                            placeholder="Enter name"
                            value="${voucher.name}"
                            required
                            />
                    </div>

                    <div class="col-md-4">
                        <label for="street" class="form-label">Description</label>
                        <input
                            type="text"
                            class="form-control"
                            id="street"
                            name="description"
                            placeholder="Enter description"
                            value="${voucher.description}"
                            required
                            />
                    </div>

                    <div class="col-md-4">
                        <label for="ward" class="form-label">Discount</label>
                        <input
                            type="number"
                            class="form-control"
                            id="ward"
                            name="discount"
                            placeholder="Enter discount"
                            min="1"
                            value="${voucher.discount}"
                            required
                            />
                    </div>

                    <div class="col-md-4">
                        <label class="form-label">User Name Can Use Voucher</label>
                        <div class="d-flex flex-wrap gap-2">
                            <c:forEach var="u" items="${users}" varStatus="status">
                                <div class="form-check me-3">
                                    <input 
                                        value="${u.id}" 
                                        class="form-check-input" 
                                        type="checkbox" 
                                        id="user-${status.index}" 
                                        name="userId" 
                                        <c:forEach var="user" items="${voucher.users}">
                                            <c:if test="${user.id == u.id}" > checked</c:if>
                                        </c:forEach>
                                        />
                                    <label class="form-check-label" for="user-${status.index}">
                                        ${u.userName}
                                    </label>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="text-danger d-none" id="userError">Please select at least one user.</div>
                    </div>
                    <!-- Submit Button -->
                    <div class="mt-2">
                        <button
                            type="submit"
                            class="btn btn-success"
                            >
                            Update
                        </button>
                    </div>
                </div>
            </form>
        </div>
</main>
