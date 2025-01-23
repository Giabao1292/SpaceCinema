<%-- 
    Document   : login.jsp
    Created on : 17 thg 1, 2025, 16:06:14
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5 mb-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-dark text-dark my-4">Login</h3>
                            </div>
                            <div class="card-body">
                                <form action = "/login" method = "POST">
                                    <div class="form-floating mb-3">
                                        <input
                                            class="form-control"
                                            id="inputUserName"
                                            type="text"
                                            placeholder="Username"
                                            name ="userName"
                                            />
                                        <label for="inputUserName">Username</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input
                                            class="form-control"
                                            id="inputPassword"
                                            type="password"
                                            placeholder="Password"
                                            name ="passWord"
                                            />
                                        <label for="inputPassword">Password</label>
                                    </div>
                                    <c:if test = "${status == 'fail'}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            Login failed! Please check your username and password and try again.
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <c:if test = "${status == 'login_first'}">
                                        <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                            Login before accessing the admin panel
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <div class="form-check mb-3">
                                        <input
                                            class="form-check-input"
                                            id="inputRememberPassword"
                                            type="checkbox"
                                            value=""
                                            />
                                        <label
                                            class="form-check-label"
                                            for="inputRememberPassword"
                                            >Remember Password</label
                                        >
                                    </div>
                                    <div
                                        class="d-flex align-items-center justify-content-between mt-4 mb-0"
                                        >
                                        <a class="small" href="password.html"
                                           >Forgot Password?</a
                                        >
                                        <button class="btn btn-primary">Login</button>
                                    </div>
                                    

                                </form>


                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small">
                                    <a href="register.html">Need an account? Sign up!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
