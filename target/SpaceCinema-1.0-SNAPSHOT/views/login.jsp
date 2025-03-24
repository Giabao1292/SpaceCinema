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
                                            value ="${username != null ? username : ''}"
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
                                            value ="${password != null ? password : ''}"
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
                                    <c:if test="${status == 'resetPassword'}">
                                        <div class="container mt-5">
                                            <!-- Alert -->
                                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                                <strong>Reset password successfull!!</strong> 
                                                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                            </div>
                                        </div>
                                    </c:if>
                                    <div class="form-check mb-3">
                                        <input
                                            class="form-check-input"
                                            id="inputRememberPassword"
                                            type="checkbox"
                                            name="rememberMe"
                                            value ="on"
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
                                        <a class="small" href="/forgot-password?action=forgotPassword"
                                           >Forgot Password?</a
                                        >
                                        <button class="btn btn-primary px-5 py-2">Login</button>
                                    </div>


                                </form>
                                <div class="col-12 d-flex mt-3 align-items-center">
                                    <div class="d-flex gap-3 flex-column w-100 ">
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=${redirect_urigoogle}&response_type=code&client_id=254823530383-c223k6kn1b925vj0fkiai0rplo4d34sh.apps.googleusercontent.com&prompt=consent"
                                           class="btn btn-lg btn-danger">
                                            <i class="bi bi-google"></i>
                                            <span class="ms-2 fs-6">Sign in with Google</span>
                                        </a>


                                        <a href="https://www.facebook.com/v17.0/dialog/oauth?client_id=1339556850512912&redirect_uri=${redirect_urifacebook}&scope=email&response_type=code&response_mode=query&state=2c7fgrtqw4k&nonce=wbo7ueooc5s" class="btn btn-lg btn-primary">
                                            <i class="bi bi-facebook"></i>
                                            <span class="ms-2 fs-6">Sign in with Facebook</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small">
                                    <a href="/register?action=register">Need an account? Sign up!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
