<%-- 
    Document   : forgot-password
    Created on : 8 thg 3, 2025, 11:26:54
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<c:if test="${not empty message}">
    <div class="container mt-5">
        <!-- Alert -->
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>${message}</strong>
            <a href ="https://mail.google.com/mail/u/0/#inbox" target ="_blank">Check</a>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>
<c:if test="${status eq 'invalid-code'}">
    <div class="container mt-5">
        <!-- Alert -->
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Invalid verification code. Please try again.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>
<div class="d-flex justify-content-center align-items-center vh-50">
    <div class="card p-4 shadow-lg" style="width: 350px;">
        <h3 class="text-center text-black">Reset Password</h3>
        <form action="/reset-password?action=resetPassword" method="POST" onsubmit="return validatePassword()">
            <div class="mb-3">
                <label for="code" class="form-label">Verification Code:</label>
                <input type="text" class="form-control" id="code" name="resetCode" required minlength="4" maxlength="6" placeholder="Enter verification code">
                <div class="invalid-feedback">Please enter a valid code (4-6 characters).</div>
            </div>

            <div class="mb-3">
                <label for="newPassword" class="form-label">New Password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required minlength="6" placeholder="Enter new password">
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required minlength="6" placeholder="Confirm new password">
                <div class="invalid-feedback">Passwords do not match.</div>
            </div>
            <button type="submit" class="btn btn-primary w-100">Reset Password</button>
        </form>

        <div class="text-center mt-3">
            <a href="/login?action=login">Back to Login</a>
        </div>
    </div>

    <script>
        function validatePassword() {
            let newPassword = document.getElementById("newPassword").value;
            let confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                document.getElementById("confirmPassword").classList.add("is-invalid");
                return false;
            }
            return true;
        }
    </script>
</div>