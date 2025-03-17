<%-- 
    Document   : createVoucher
    Created on : Mar 17, 2025, 12:48:37 PM
    Author     : LAPTOP ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<main>
    <div class="container-fluid px-4">
        <div class="container mt-4">
            <h2 class="font-monospace">Add Voucher</h2>
            <form>
                <div class="row g-3">
                    <!-- Name -->
                    <div class="col-md-4">
                        <label for="name" class="form-label"
                               >Name</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="name"
                            placeholder="Enter name"
                            />
                    </div>
                    <!-- Street -->
                    <div class="col-md-4">
                        <label for="street" class="form-label"
                               >Street</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="street"
                            placeholder="Enter street"
                            />
                    </div>
                    <!-- Ward -->
                    <div class="col-md-4">
                        <label for="ward" class="form-label"
                               >Ward</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="ward"
                            placeholder="Enter ward"
                            />
                    </div>
                    <!-- Direction -->
                    <div class="col-md-4">
                        <label
                            for="direction"
                            class="form-label"
                            >Direction</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="direction"
                            placeholder="Enter direction"
                            />
                    </div>
                    <!-- Level -->
                    <div class="col-md-4">
                        <label for="level" class="form-label"
                               >Level</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="level"
                            placeholder="Enter level"
                            />
                    </div>
                    <!-- Manager Name -->
                    <div class="col-md-4">
                        <label
                            for="managerName"
                            class="form-label"
                            >Manager Name</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="managerName"
                            placeholder="Enter manager name"
                            />
                    </div>
                    <!-- Manager Phone Number -->
                    <div class="col-md-4">
                        <label
                            for="managerPhoneNumber"
                            class="form-label"
                            >Manager Phone Number</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="managerPhoneNumber"
                            placeholder="Enter phone number"
                            />
                    </div>
                    <!-- Floor Area -->
                    <div class="col-md-4">
                        <label
                            for="floorArea"
                            class="form-label"
                            >Floor Area</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="floorArea"
                            placeholder="Enter floor area"
                            />
                    </div>
                    <!-- District ID -->
                    <div class="col-md-4">
                        <label
                            for="districtName"
                            class="form-label"
                            >District</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="districtName"
                            placeholder="Enter district's name"
                            />
                    </div>
                    <!-- Number of Basement -->
                    <div class="col-md-4">
                        <label
                            for="numberOfBasement"
                            class="form-label"
                            >Number of Basement</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="numberOfBasement"
                            placeholder="Enter number of basement"
                            />
                    </div>
                    <!-- Staff -->
                    <div class="col-md-4">
                        <label for="staffId" class="form-label"
                               >Staff</label
                        >
                        <select
                            class="form-select"
                            id="staffId"
                            >
                            <option value="">
                                Select staff
                            </option>
                            <option value="1">Staff 1</option>
                            <option value="2">Staff 2</option>
                            <option value="3">Staff 3</option>
                        </select>
                    </div>
                    <!-- Area From -->
                    <div class="col-md-4">
                        <label
                            for="rentPrice"
                            class="form-label"
                            >Rent Price</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="rentPrice"
                            placeholder="Enter rent price"
                            />
                    </div>
                    <!-- Area To -->
                    <div class="col-md-4">
                        <label for="rentArea" class="form-label"
                               >Rent Area</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="rentArea"
                            placeholder="Enter rent area"
                            />
                    </div>
                    <!-- Rent Price From -->
                    <div class="col-md-4">
                        <label
                            for="rentPriceFrom"
                            class="form-label"
                            >Rent Price From</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="rentPriceFrom"
                            placeholder="Enter rent price from"
                            />
                    </div>
                    <!-- Rent Price To -->
                    <div class="col-md-4">
                        <label
                            for="rentPriceTo"
                            class="form-label"
                            >Rent Price To</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="rentPriceTo"
                            placeholder="Enter rent price to"
                            />
                    </div>
                    <!-- Checkboxes -->
                    <div class="col-md-12">
                        <label class="form-label"
                               >Building Type</label
                        >
                        <div class="form-check">
                            <input
                                class="form-check-input"
                                type="checkbox"
                                id="furniture"
                                />
                            <label
                                class="form-check-label"
                                for="furniture"
                                >Nội thất</label
                            >
                        </div>
                        <div class="form-check">
                            <input
                                class="form-check-input"
                                type="checkbox"
                                id="groundFloor"
                                />
                            <label
                                class="form-check-label"
                                for="groundFloor"
                                >Tầng trệt</label
                            >
                        </div>
                        <div class="form-check">
                            <input
                                class="form-check-input"
                                type="checkbox"
                                id="wholeBuilding"
                                />
                            <label
                                class="form-check-label"
                                for="wholeBuilding"
                                >Nguyên căn</label
                            >
                        </div>
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
