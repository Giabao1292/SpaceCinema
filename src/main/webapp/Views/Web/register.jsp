<%-- 
    Document   : register.jsp
    Created on : 1 thg 2, 2025, 19:04:21
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                                <h3 class="text-center font-weight-light my-4 text-black">
                                    Create Account
                                </h3>
                            </div>
                            <div class="card-body">
                                <form action ="/register?action=register" method = "POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input
                                                    class="form-control"
                                                    id="inputFirstName"
                                                    type="text"
                                                    name ="firstName"
                                                    placeholder="Enter your first name"
                                                    required
                                                    />
                                                <label for="inputFirstName">First name</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input
                                                    class="form-control"
                                                    id="inputLastName"
                                                    type="text"
                                                    name ="lastName"
                                                    placeholder="Enter your last name"
                                                    required
                                                    />
                                                <label for="inputLastName">Last name</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input
                                                    class="form-control"
                                                    id="inputUserName"
                                                    type="text"
                                                    name ="userName"
                                                    placeholder="Username"
                                                    required
                                                    />
                                                <label for="inputUserName">Username</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input
                                                    class="form-control"
                                                    id="inputPhoneNumber"
                                                    type="text"
                                                    name ="phone"
                                                    placeholder="Phone number"
                                                    required
                                                    />
                                                <label for="inputPhoneNumber">Phone number</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input
                                            class="form-control"
                                            id="inputEmail"
                                            type="email"
                                            name ="email"
                                            placeholder="name@example.com"
                                            required
                                            />
                                        <label for="inputEmail">Email address</label>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input
                                                    class="form-control"
                                                    id="inputPassword"
                                                    type="password"
                                                    name ="passWord"
                                                    placeholder="Create a password"
                                                    required
                                                    />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input
                                                    class="form-control"
                                                    id="inputPasswordConfirm"
                                                    type="password"
                                                    name="confirmPassword"
                                                    placeholder="Confirm password"
                                                    required
                                                    />
                                                <label for="inputPasswordConfirm"
                                                       >Confirm Password</label
                                                >
                                            </div>
                                        </div>
                                    </div>
                                    <c:if test = "${not empty email}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${email}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <c:if test = "${not empty phone}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${phone}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <c:if test = "${not empty userName}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${userName}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <c:if test = "${not empty passWord}">
                                        <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                            ${passWord}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <c:if test = "${not empty status}">
                                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                                            ${status}
                                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </div>
                                    </c:if>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <button class="btn btn-primary btn-block"
                                                    >Create Account</button
                                            >
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small">
                                    <a href="/login?action=login">Have an account? Go to login</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

