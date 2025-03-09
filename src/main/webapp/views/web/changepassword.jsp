<%-- 
    Document   : changepassword.jsp
    Created on : 1 thg 2, 2025, 19:11:12
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<c:if test="${status eq 'invalid-email'}">
    <div class="container mt-5">
        <!-- Alert -->
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Invalid Email. Please try again.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>
<c:if test="${status eq 'code-expired'}">
    <div class="container mt-5">
        <!-- Alert -->
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Code expired!!. Please get code again.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </div>
</c:if>
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4 text-black">Password Recovery</h3></div>
                            <div class="card-body">
                                <div class="small mb-3 text-muted">Enter your email address and we will send you a link to reset your password.</div>
                                <form action="/forgot-password?action=forgotPassword" method = "POST">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail" name ="email" type="email" placeholder="name@example.com" />
                                        <label for="inputEmail">Email address</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="small" href="/login?action=login">Return to login</a>
                                        <button type="submit" class="btn btn-primary" >Get ResetCode</button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="/register?action=register">Need an account? Sign up!</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
