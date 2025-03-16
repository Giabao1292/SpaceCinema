<%-- 
    Document   : updateMovie.jsp
    Created on : 9 thg 2, 2025, 15:28:03
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>

<head>
    <title>JSP Page</title>
</head>
<main>
    <div class="container-fluid px-4">
        <div class="container mt-4">
            <h2 class="font-monospace">Add Building</h2>
            <form action="/admin-home/popcorn" method="post">
                <input type="hidden" name="action" value="create">
                <div class="row g-3">
                    <!-- Snack -->
                    <div class="col-md-4">
                        <label for="snack" class="form-label">Name</label>
                        <input type="text" class="form-control" id="snack" placeholder="Enter snack" name="name" required>
                    </div>
                    <!-- Price -->
                    <div class="col-md-4">
                        <label for="snackPrice" class="form-label">Price</label>
                        <input type="number" class="form-control" id="snackPrice" placeholder="Enter price" name="price" required>
                    </div>
                    <!-- Type -->
                    <div class="col-md-4">
                        <label for="snackType" class="form-label">Type</label>
                        <select class="form-select" id="snackType" name="type" required>
                            <option value="">Select type</option>
                            <option value="1">Popcorn</option>
                            <option value="2">Drinks</option>
                            <option value="3">Candy</option>
                        </select>
                    </div>
                </div>
                <!-- Submit Button -->
                <div class="mt-2">
                    <button
                        type="submit"
                        class="btn btn-success"
                        >
                        Adding
                    </button>
                    <button type="reset" class="btn btn-danger">
                        Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>
</main>