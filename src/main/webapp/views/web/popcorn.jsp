<%-- 
    Document   : popcorn
    Created on : 19 thg 1, 2025, 16:18:53
    Author     : lebao
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp" %>
<body class="bg-light">
    <c:forEach var = "snackType" items = "${snackList.keySet()}">
        <div class="container mt-5">
            <h2 class="text-center mb-4">${snackType}</h2>
            <div class="row">
                <c:forEach var = "snack" items = "${snackList.get(snackType)}">
                    <div class="col-md-4">
                        <div class="card snack-card shadow">
                            <input type="hidden" name="snackId" value="${snack.id}" />
                            <img
                                src="${snack.poster_image}"
                                class="card-img-top snack-img"
                                alt="Potato Chips"
                                />
                            <div class="card-body">
                                <h5 class="card-title">${snack.name}</h5>
                                <h6 class="text-primary fw-bold">${snack.price}</h6>
                                <div class="input-group mt-3">
                                    <button
                                        class="btn btn-outline-danger"
                                        type="button"
                                        onclick="this.nextElementSibling.stepDown()"
                                        >
                                        −
                                    </button>
                                    <input
                                        type="number"
                                        class="form-control text-center"
                                        value="0"
                                        min="0"
                                        />
                                    <button
                                        class="btn btn-outline-success"
                                        type="button"
                                        onclick="this.previousElementSibling.stepUp()"
                                        >
                                        +
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </c:forEach>
</body>