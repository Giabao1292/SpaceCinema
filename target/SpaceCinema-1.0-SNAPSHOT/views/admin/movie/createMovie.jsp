<%-- 
    Document   : createMovie.jsp
    Created on : 9 thg 2, 2025, 15:27:45
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>
<!DOCTYPE html>

<head>

    <title>JSP Page</title>
</head>

<main>
    <div class="container-fluid px-4">
        <div class="container mt-4">
            <h2 class="mb-4 font-monospace">Search Building</h2>
            <form action = "/admin-home/movie?action=create" method="GET">
                <div class="row g-3">
                    <!-- Movie Name -->
                    <div class="col-md-4">
                        <label for="title" class="form-label">Movie Name</label>
                        <input
                            type="text"
                            class="form-control"
                            id="title"
                            name="title"
                            placeholder="Enter movie name"
                            />
                    </div>

                    <!-- Director ID -->
                    <div class="col-md-4">
                        <label for="director_id" class="form-label">Director</label>
                        <input
                            type="text"
                            class="form-control"
                            id="director"
                            name="director"
                            placeholder="Enter director"
                            />
                    </div>

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
                        >
                        <input
                            type="text"
                            class="form-control"
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
                        >
                        <input
                            type="text"
                            class="form-control"
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
                            placeholder="Enter cast from cast1,cast2,..."
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
                        </div>
                    </div>
                </div>
                <!-- Submit Button -->
                <div class="mt-2">
                    <button type="submit" class="btn btn-primary">
                        Create Movie
                    </button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form>
        </div>
    </div>
</main>
