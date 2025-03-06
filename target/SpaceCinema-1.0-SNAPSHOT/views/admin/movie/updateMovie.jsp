<%-- 
    Document   : updateMovie.jsp
    Created on : 9 thg 2, 2025, 15:28:03
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>

<main>
    <div class="container-fluid px-4">
        <div class="container mt-4">
            <h2 class="font-monospace">Update Movie</h2>
            <form action = "movie?action=update&movie_id=${movie_id}" method = "POST">
                <div class="row g-3">
                    <div class="col-md-4">
                        <label for="title" class="form-label">Movie Name</label>
                        <input
                            type="text"
                            class="form-control"
                            id="title"
                            name="title"
                            placeholder="Enter movie name"
                            value ="${movie.title}"
                            />
                    </div>
                    <div class="col-md-4">
                        <label for="age_rating" class="form-label">Age Rating</label>
                        <input
                            type="text"
                            class="form-control"
                            id="age_rating"
                            name="age_rating"
                            placeholder="Enter age rating"
                            value ="${movie.age_rating}"
                            />
                    </div>
                    <div class="col-md-4">
                        <label for="runtime" class="form-label">Runtime Minute</label>
                        <input
                            type="text"
                            class="form-control"
                            id="runtime"
                            name="runtime_min"
                            placeholder="Enter runtime in minutes"
                            value ="${movie.runtime_min}"
                            />
                    </div>
                    <div class="col-md-4">
                        <label for="release_date" class="form-label">Release Date</label>
                        <input
                            type="date"
                            class="form-control"
                            id="release_date"
                            name="release_date"
                            value ="${movie.release_date}"
                            />
                    </div>
                    <div class="col-md-4">
                        <label for="trailer_link" class="form-label">Trailer Link</label>
                        <input
                            type="url"
                            class="form-control"
                            id="trailer_link"
                            name="trailer_link"
                            placeholder="Enter trailer link"
                            value ="${movie.trailer_link}"
                            />
                    </div>
                    <div class="col-md-4">
                        <label for="banner_text" class="form-label">Banner Text</label>
                        <input
                            type="text"
                            class="form-control"
                            id="banner_text"
                            name="banner_text"
                            placeholder="Enter banner text"
                            value ="${movie.banner_text}"
                            />
                    </div>
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
                            value ="${movie.header_image}"
                            />
                    </div>
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
                            value ="${movie.poster_image}"
                            />
                    </div>
                    <div class="col-md-4">
                        <label for="director" class="form-label">Director</label>
                        <input
                            type="text"
                            class="form-control"
                            id="director"
                            name="director_name"
                            placeholder="Enter director"
                            value ="${movie.director_name}"
                            />
                    </div>
                    <div class="col-md-4" id = "castTag">
                        <label for="casts" class="form-label">List Cast</label>
                        <button class ="btn btn-success" type="button"  onclick="addCastInput(event)"> Add Cast </button>
                        <c:forEach var ="c" items = "${movie.casts}">
                            <div class ="cast-input">
                                <input type = "text" name="casts" class = "form-control" value = "${c}">
                                <button type ="button" class ="btn btn-danger" onclick="removeButton(event)">Delete</button>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="col-md-4">
                        <label for="staffId" class="form-label">Status</label>
                        <select class="form-select" id="staffId" name = "status" value = "${movie.status}">
                            <option value="">Select status</option>
                            <c:forEach var = "status" items = "${statusList}">
                                <option value="${status}" ${status eq movie.status ? "selected" : ''}>${status}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label for="synopsis" class="form-label">Synopsis</label>
                        <textarea
                            class="form-control"
                            id="synopsis"
                            name="synopsis"
                            rows="1"
                            placeholder="Enter synopsis"
                            value ="${movie.synopsis}"
                            >${movie.synopsis}</textarea>
                    </div>
                    <div class="col-md-4">
                        <label for="description" class="form-label">Description</label>
                        <textarea
                            class="form-control"
                            id="description"
                            name="description"
                            rows="1"
                            placeholder="Enter description"
                            value ="${movie.discription}"
                            >${movie.discription}</textarea>
                    </div>
                    <div class="col-md-6">
                        <h5>Genre</h5>
                        <div class="gap-4 form-check d-flex flex-wrap">
                            <c:forEach
                                var="genre"
                                items="${genres}"
                                varStatus="stGenre"
                                >
                                <div class="form-check">
                                    <input
                                        class="form-check-input"
                                        type="checkbox"
                                        id="genre-${stGenre.index}"
                                        name="genreId"
                                        value="${genre.id}"
                                        <c:if test="${movie.genres.contains(genre.id)}">checked</c:if>
                                            />
                                        <label class="form-check-label" for="genre-${stGenre.index}"
                                           >${genre.name}</label
                                    >
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="mt-2">
                        <button type="submit" class="btn btn-primary" id = "create">
                            Update Movie
                        </button>
                        <a type="reset" href ="/admin-home/movie?action=update&movie_id=${movie_id}" class="btn btn-secondary">Reset</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>
<script>
    function addCastInput(event) {
        event.preventDefault();
        let container = document.getElementById("castTag");
        let inputCount = container.getElementsByTagName("input").length + 1;
        let div = document.createElement("div");
        div.classList.add("cast-input");
        let input = document.createElement("input");
        input.type = "text";
        input.name = "casts";
        input.classList.add("form-control");
        input.required = true;
        input.placeholder = "Enter cast name " + inputCount;
        let removeButton = document.createElement("button");
        removeButton.type = "button";
        removeButton.innerText = "Delete";
        removeButton.classList.add("btn");
        removeButton.classList.add("btn-danger");
        removeButton.onclick = function () {
            container.removeChild(div);
        };
        div.appendChild(input);
        div.appendChild(removeButton);
        container.appendChild(div);
    }
    function removeButton(event) {
        event.target.closest(".cast-input").remove();
    }
</script>
