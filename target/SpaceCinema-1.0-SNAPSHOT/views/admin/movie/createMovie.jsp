<%-- 
    Document   : createMovie.jsp
    Created on : 9 thg 2, 2025, 15:27:45
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>
<!DOCTYPE html>

<head>
<<<<<<< HEAD
=======

>>>>>>> 8574984 (Add tag table)
    <title>JSP Page</title>
</head>
<<<<<<< HEAD

<main>
    <div class="container-fluid px-4">
        <div class="container mt-4">
<<<<<<< HEAD
            <h2>Create Movie</h2>
            <form action="/admin-home/movie" method="post">
=======
            <h2 class="mb-4 font-monospace">Search Building</h2>
            <form action = "/admin-home/movie?action=create" method="GET">
>>>>>>> 8574984 (Add tag table)
                <div class="row g-3">
                    <!-- Movie Name -->
                    <div class="col-md-4">
                        <label for="title" class="form-label">Movie Name</label>
                        <input
                            type="text"
                            class="form-control"
<<<<<<< HEAD
                            id="title"  
                            name="title"
                            placeholder="Enter movie name"
                            required
                            />
                    </div>

                    <!-- Cinema -->
                    <div class="col-md-4">
                        <label class="form-label">Cinema</label>
                        <div class="row">
                            <div class="col-12">
                                <c:forEach var="c" items="${listCinema}" varStatus="stC" >
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="cinema" value="${c.name}" id="cinema-${stC.index}">
                                        <label class="form-check-label" for="cinema-${stC.index}">${c.name}</label>
                                    </div>
                                </c:forEach>
                                <c:forEach var="dateItem" items="${listDate}" varStatus="stDate" >
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="date" value="${dateItem}" id="date-${stDate.index}">
                                        <label class="form-check-label" for="date-${stDate.index}">${dateItem}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>




                    <!-- Director -->
                    <div class="col-md-4">
                        <label for="director" class="form-label">Director</label>
=======
                            id="title"
                            name="title"
                            placeholder="Enter movie name"
                            />
                    </div>

                    <!-- Director ID -->
                    <div class="col-md-4">
                        <label for="director_id" class="form-label">Director</label>
>>>>>>> 8574984 (Add tag table)
                        <input
                            type="text"
                            class="form-control"
                            id="director"
=======
<main>
    <div class="container-fluid px-4">
        <div class="container mt-4">
            <h2 class="font-monospace">Add Movie</h2>
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
                    <!-- Director -->
                    <div class="col-md-4">
                        <label for="director" class="form-label"
                               >Director</label
                        >
                        <input
                            type="text"
                            class="form-control"
                            id="street"
>>>>>>> 9f1ad68 (finish movie list admin)
                            name="director"
                            placeholder="Enter director"
<<<<<<< HEAD
                            required
=======
                            />
                    </div>
<<<<<<< HEAD

                    <!-- Status ID -->
                    <div class="col-md-4">
                        <label for="Status" class="form-label">Status</label>
                        <select class="form-select" id="Status" name="statusName">
                            <option value="">Select status</option>
                            <option value="1">Staff 1</option>
                            <option value="2">Staff 2</option>
                            <option value="3">Staff 3</option>
                        </select>
                    </div>

                    <!-- Age Rating -->
                    <div class="col-md-4">
                        <label for="age_rating" class="form-label"
                               >Age Rating</label
=======
                    <!-- Status -->
                    <div class="col-md-4">
                        <label for="staffId" class="form-label"
                               >Status</label
                        >
                        <select
                            class="form-select"
                            id="staffId"
                            name="status"
                            >
                            <option value="">
                                Select staff
                            </option>
                            <option value="1">Now Showing</option>
                            <option value="2">Coming soon</option>
                            <option value="3">Archived</option>
                        </select>
                    </div>
                    <!-- Age Rating -->
                    <div class="col-md-4">
                        <label for="staffId" class="form-label"
                               >Status</label
                        >
                        <select
                            class="form-select"
                            id="staffId"
                            name="status"
                            >
                            <option value="">
                                Select Age Rating
                            </option>
                            <option value="1">Now Showing</option>
                            <option value="2">Coming soon</option>
                            <option value="3">Archived</option>
                        </select>
                    </div>
                    <!-- Run Time Min -->
                    <div class="col-md-4">
                        <label for="level" class="form-label"
                               >Level</label
>>>>>>> 9f1ad68 (finish movie list admin)
                        >
                        <input
                            type="text"
                            class="form-control"
<<<<<<< HEAD
                            id="age_rating"
                            name="age_rating"
                            placeholder="Enter age rating"
                            />
                    </div>

                    <!-- Runtime -->
                    <div class="col-md-4">
                        <label for="runtime_min" class="form-label">Runtime</label>
                        <input
                            type="number"
                            class="form-control"
                            id="runtime_min"
                            name="runtime_min"
                            placeholder="Enter runtime in minutes"
                            />
                    </div>

                    <!-- Release Date -->
                    <div class="col-md-4">
                        <label for="release_date" class="form-label"
                               >Release Date</label
                        >
                        <input
                            type="date"
                            class="form-control"
                            id="release_date"
                            name="release_date"
                            />
                    </div>

                    <!-- Trailer Link -->
                    <div class="col-md-4">
                        <label for="trailer_link" class="form-label"
                               >Trailer Link</label
                        >
                        <input
                            type="url"
                            class="form-control"
                            id="trailer_link"
                            name="trailer_link"
                            placeholder="Enter trailer link"
                            />
                    </div>

                    <!-- Banner Text -->
                    <div class="col-md-4">
                        <label for="banner_text" class="form-label"
                               >Banner Text</label
=======
                            id="level"
                            placeholder="Enter level"
                            />
                    </div>
                    <!-- Release Date -->
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
                    <!-- Trailer Link -->
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
                    <!-- Description -->
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
                    <!-- Banner text -->
                    <div class="col-md-4">
                        <label
                            for="districtName"
                            class="form-label"
                            >District</label
>>>>>>> 9f1ad68 (finish movie list admin)
                        >
                        <input
                            type="text"
                            class="form-control"
<<<<<<< HEAD
                            id="banner_text"
                            name="banner_text"
                            placeholder="Enter banner text"
                            />
                    </div>

                    <!-- Header Image -->
                    <div class="col-md-4">
                        <label for="header_image" class="form-label"
                               >Header Image URL</label
                        >
                        <input
                            type="url"
                            class="form-control"
                            id="header_image"
                            name="header_image"
                            placeholder="Enter header image URL"
                            />
                    </div>

                    <!-- Poster Image -->
                    <div class="col-md-4">
                        <label for="poster_image" class="form-label"
                               >Poster Image URL</label
                        >
                        <input
                            type="url"
                            class="form-control"
                            id="poster_image"
                            name="poster_image"
                            placeholder="Enter poster image URL"
                            />
                    </div>

                    <!-- Cinema -->
                    <div class="col-md-4">
                        <label for="cinema" class="form-label">Cinema</label>
                        <input
                            type="text"
                            class="form-control"
                            id="cinema"
                            name="cinema"
                            placeholder="Enter cinema"
>>>>>>> 8574984 (Add tag table)
                            />
                    </div>

                    <!-- Cast -->
                    <div class="col-md-4">
                        <label for="cast" class="form-label">Cast</label>
                        <input
                            type="text"
                            class="form-control"
                            id="cast"
                            name="cast"
<<<<<<< HEAD
                            placeholder="Enter cast"
                            required
=======
                            placeholder="Enter cast from cast1,cast2,..."
>>>>>>> 8574984 (Add tag table)
                            />
                    </div>

                    <!-- Genre -->
                    <div class="col-md-4">
                        <label for="genre" class="form-label">Genre</label>
                        <input
                            type="text"
                            class="form-control"
                            id="genre"
                            name="genre"
<<<<<<< HEAD
                            placeholder="Enter genre"
                            required
                            />
                    </div>


                    <!-- Time Slots (checkboxes) -->
                    <div class="col-md-12 mb-3">
                        <label class="form-label">Available Time Slots</label>
                        <div class="gap-4 form-check d-flex flex-wrap">
=======
                            placeholder="Enter genre form genre1,genre2,..."
                            />
                    </div>

                    <!-- Runtime -->
                    <div class="col-md-4">
                        <label for="runtime" class="form-label">Runtime</label>
                        <input
                            type="text"
                            class="form-control"
                            id="runtime"
                            name="runtime"
                            placeholder="Enter runtime in minutes"
                            />
                    </div>

                    <div class="col-md-4">
                        <label for="description" class="form-label"
                               >Description</label
                        >
                        <textarea
                            class="form-control"
                            id="description"
                            name="description"
                            rows="3"
                            placeholder="Enter description"
                            ></textarea>
                    </div>

                    <!-- Synopsis -->
                    <div class="col-md-4">
                        <label for="synopsis" class="form-label">Synopsis</label>
                        <textarea
                            class="form-control"
                            id="synopsis"
                            name="synopsis"
                            rows="5"
                            placeholder="Enter synopsis"
                            ></textarea>
                    </div>
                    <!-- Time Slots (checkboxes) -->
                    <div class="col-md-12">
                        <label class="form-label">Available Time Slots</label>
                        <div class="form-check d-flex flex-wrap gy-4">
>>>>>>> 8574984 (Add tag table)
                            <!-- Generate checkboxes for every 30 minutes from 7:00 AM to 11:00 PM -->
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0700"
                                    name="time"
                                    value="07:00"
                                    />
                                <label class="form-check-label" for="time-0700"
                                       >07:00 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0730"
                                    name="time"
                                    value="07:30"
                                    />
                                <label class="form-check-label" for="time-0730"
                                       >07:30 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0800"
                                    name="time"
                                    value="08:00"
                                    />
                                <label class="form-check-label" for="time-0800"
                                       >08:00 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0830"
                                    name="time"
                                    value="08:30"
                                    />
                                <label class="form-check-label" for="time-0830"
                                       >08:30 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0900"
                                    name="time"
                                    value="09:00"
                                    />
                                <label class="form-check-label" for="time-0900"
                                       >09:00 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0930"
                                    name="time"
                                    value="09:30"
                                    />
                                <label class="form-check-label" for="time-0930"
                                       >09:30 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1000"
                                    name="time"
                                    value="10:00"
                                    />
                                <label class="form-check-label" for="time-1000"
                                       >10:00 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1030"
                                    name="time"
                                    value="10:30"
                                    />
                                <label class="form-check-label" for="time-1030"
                                       >10:30 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1100"
                                    name="time"
                                    value="11:00"
                                    />
                                <label class="form-check-label" for="time-1100"
                                       >11:00 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1130"
                                    name="time"
                                    value="11:30"
                                    />
                                <label class="form-check-label" for="time-1130"
                                       >11:30 AM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1200"
                                    name="time"
                                    value="12:00"
                                    />
                                <label class="form-check-label" for="time-1200"
                                       >12:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1230"
                                    name="time"
                                    value="12:30"
                                    />
                                <label class="form-check-label" for="time-1230"
                                       >12:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1300"
                                    name="time"
                                    value="13:00"
                                    />
                                <label class="form-check-label" for="time-1300"
                                       >01:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1330"
                                    name="time"
                                    value="13:30"
                                    />
                                <label class="form-check-label" for="time-1330"
                                       >01:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1400"
                                    name="time"
                                    value="14:00"
                                    />
                                <label class="form-check-label" for="time-1400"
                                       >02:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1430"
                                    name="time"
                                    value="14:30"
                                    />
                                <label class="form-check-label" for="time-1430"
                                       >02:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1500"
                                    name="time"
                                    value="15:00"
                                    />
                                <label class="form-check-label" for="time-1500"
                                       >03:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1530"
                                    name="time"
                                    value="15:30"
                                    />
                                <label class="form-check-label" for="time-1530"
                                       >03:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1600"
                                    name="time"
                                    value="16:00"
                                    />
                                <label class="form-check-label" for="time-1600"
                                       >04:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1630"
                                    name="time"
                                    value="16:30"
                                    />
                                <label class="form-check-label" for="time-1630"
                                       >04:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1700"
                                    name="time"
                                    value="17:00"
                                    />
                                <label class="form-check-label" for="time-1700"
                                       >05:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1730"
                                    name="time"
                                    value="17:30"
                                    />
                                <label class="form-check-label" for="time-1730"
                                       >05:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1800"
                                    name="time"
                                    value="18:00"
                                    />
                                <label class="form-check-label" for="time-1800"
                                       >06:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1830"
                                    name="time"
                                    value="18:30"
                                    />
                                <label class="form-check-label" for="time-1830"
                                       >06:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1900"
                                    name="time"
                                    value="19:00"
                                    />
                                <label class="form-check-label" for="time-1900"
                                       >07:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1930"
                                    name="time"
                                    value="19:30"
                                    />
                                <label class="form-check-label" for="time-1930"
                                       >07:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2000"
                                    name="time"
                                    value="20:00"
                                    />
                                <label class="form-check-label" for="time-2000"
                                       >08:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2030"
                                    name="time"
                                    value="20:30"
                                    />
                                <label class="form-check-label" for="time-2030"
                                       >08:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2100"
                                    name="time"
                                    value="21:00"
                                    />
                                <label class="form-check-label" for="time-2100"
                                       >09:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2130"
                                    name="time"
                                    value="21:30"
                                    />
                                <label class="form-check-label" for="time-2130"
                                       >09:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2200"
                                    name="time"
                                    value="22:00"
                                    />
                                <label class="form-check-label" for="time-2200"
                                       >10:00 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2230"
                                    name="time"
                                    value="22:30"
                                    />
                                <label class="form-check-label" for="time-2230"
                                       >10:30 PM</label
                                >
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2300"
                                    name="time"
                                    value="23:00"
                                    />
                                <label class="form-check-label" for="time-2300"
                                       >11:00 PM</label
                                >
                            </div>
=======
                            id="districtName"
                            placeholder="Enter district's name"
                            />
                    </div>
                    <!-- Header Image -->
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
                    <!-- Poster Image -->
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
                    <!-- Synopsis -->
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
>>>>>>> 9f1ad68 (finish movie list admin)
                        </div>
                    </div>
                </div>
<<<<<<< HEAD
                <div class="row g-3">


                    <!-- Status -->
                    <div class="col-md-4">
                        <label for="staffId" class="form-label"
                               >Status</label
                        >
                        <select
                            class="form-select"
                            id="staffId"
                            name="status"
                            >
                            <option value="Now Showing">
                                Now Showing
                            </option>
                            <option value="Coming soon">Coming soon</option>
                            <option value="Archived">Archived</option>
                        </select>
                    </div>
                    <!-- Age Rating -->
                    <div class="col-md-4">
                        <label for="staffId" class="form-label"
                               >Age Rating</label
                        >
                        <select
                            class="form-select"
                            id="staffId"
                            name="status"
                            >
                            <option value="U">
                                U
                            </option>
                            <option value="PG-13">PG-13</option>
                            <option value="PG-18">PG-18</option>
                        </select>
                    </div>

                    <!-- Runtime -->
                    <div class="col-md-4">
                        <label for="runtime_min" class="form-label"
                               >Runtime (minutes)</label
                        >
                        <input
                            type="number"
                            class="form-control"
                            id="runtime_min"
                            name="runtime_min"
                            placeholder="Enter runtime in minutes"
                            required
                            />
                    </div>

                    <!-- Release Date -->
                    <div class="col-md-4">
                        <label for="release_date" class="form-label">Release Date</label>
                        <input
                            type="date"
                            class="form-control"
                            id="release_date"
                            name="release_date"
                            required
                            />
                    </div>

                    <!-- Trailer Link -->
                    <div class="col-md-4">
                        <label for="trailer_link" class="form-label">Trailer Link</label>
                        <input
                            type="url"
                            class="form-control"
                            id="trailer_link"
                            name="trailer_link"
                            placeholder="Enter trailer link"
                            required
                            />
                    </div>

                    <!-- Description -->
                    <div class="col-md-4">
                        <label for="description" class="form-label">Description</label>
                        <textarea
                            class="form-control"
                            id="description"
                            name="description"
                            rows="3"
                            placeholder="Enter description"
                            required
                            ></textarea>
                    </div>

                    <!-- Banner Text -->
                    <div class="col-md-4">
                        <label for="banner_text" class="form-label">Banner Text</label>
                        <input
                            type="text"
                            class="form-control"
                            id="banner_text"
                            name="banner_text"
                            placeholder="Enter banner text"
                            required
                            />
                    </div>

                    <!-- Header Image -->
                    <div class="col-md-4">
                        <label for="header_image" class="form-label"
                               >Header Image URL</label
                        >
                        <input
                            type="url"
                            class="form-control"
                            id="header_image"
                            name="header_image"
                            placeholder="Enter header image URL"
                            required
                            />
                    </div>

                    <!-- Poster Image -->
                    <div class="col-md-4">
                        <label for="poster_image" class="form-label"
                               >Poster Image URL</label
                        >
                        <input
                            type="url"
                            class="form-control"
                            id="poster_image"
                            name="poster_image"
                            placeholder="Enter poster image URL"
                            required
                            />
                    </div>

                    <!-- Synopsis -->
                    <div class="col-md-4">
                        <label for="synopsis" class="form-label">Synopsis</label>
                        <textarea
                            class="form-control"
                            id="synopsis"
                            name="synopsis"
                            rows="5"
                            placeholder="Enter synopsis"
                            required
                            ></textarea>
                    </div>
                </div>
                <!-- Submit Button -->
                <div class="mt-2">
                    <button type="submit" class="btn btn-primary">Create Movie</button>
=======
                <!-- Submit Button -->
                <div class="mt-2">
<<<<<<< HEAD
                    <button type="submit" class="btn btn-primary">
                        Create Movie
                    </button>
>>>>>>> 8574984 (Add tag table)
                    <button type="reset" class="btn btn-secondary">Reset</button>
=======
                    <button
                        type="submit"
                        class="btn btn-success"
                        >
                        Adding
                    </button>
                    <button type="reset" class="btn btn-danger">
                        Cancel
                    </button>
>>>>>>> 9f1ad68 (finish movie list admin)
                </div>
            </form>
        </div>
    </div>
<<<<<<< HEAD
</main>
<<<<<<< HEAD
=======

=======
</main>
>>>>>>> 9f1ad68 (finish movie list admin)
>>>>>>> 9c41c4d (finish movie list admin)
