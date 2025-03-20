<%-- 
    Document   : addShowTime.jsp
    Created on : 7 thg 3, 2025, 19:42:20
    Author     : lebao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file = "/common/taglib.jsp"%>
<div class="container-fluid px-4">
    <div class="container mt-4">
        <h1>Adding ShowTime</h1>
        <form action ="/admin-home/movie?action=settime" method = "POST">
            <input type="hidden" value ="${movieId}" name ="movieId"/>
            <div class ="row g-3">
                <div class = "col-md-12">
                    <h3 class="form-label">Choose Date</h3>
                    <div class="form-check gap-4 d-flex flex-wrap align-items-center border border-warning p-2 rounded">
                        <c:forEach var = "date" varStatus="dateStatus" items="${listDate}">
                            <div class="form-check ">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    value="${date}"
                                    name ="date"
                                    id="date-${dateStatus.index}"
                                    />
                                <label class="form-check-label" for="date-${dateStatus.index}">${date}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class = "col-md-12">
                    <h3 class="form-label">Choose cinema</h3>
                    <div class="form-check gap-4 d-flex flex-wrap align-items-center border border-warning p-2 rounded">
                        <c:forEach var = "cinema" varStatus="cineStatus" items="${listCinema}">
                            <div class="form-check ">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    value="${cinema.name}"
                                    name ="cinema"
                                    id="cinema-${cineStatus.index}"
                                    />
                                <label class="form-check-label" for="cinema-${cineStatus.index}">${cinema.name}</label>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row g-3">
                <div class="col-md-12">
                    <h3 class="form-label">Available Time Slots</h3>
                    <c:forEach var = "theatre" items = "${theatreList}" varStatus = "theatreStatus">
                        <input type ="hidden" name ="theatre" value ="${theatre.theatre_num}">
                        <h4>Theatre ${theatre.theatre_num}</h4>
                        <div class="form-check gap-4 d-flex flex-wrap align-items-center border border-warning p-2 rounded">
                            <!-- Generate checkboxes for every 30 minutes from 7:00  to 11:00 PM -->
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0830-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="08:30"
                                    />
                                <label class="form-check-label" for="time-0830-${theatreStatus.index}">08:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0900-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="09:00"
                                    />
                                <label class="form-check-label" for="time-0900-${theatreStatus.index}">09:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-0930-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="09:30"
                                    />
                                <label class="form-check-label" for="time-0930-${theatreStatus.index}">09:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1000-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="10:00"
                                    />
                                <label class="form-check-label" for="time-1000-${theatreStatus.index}">10:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1030-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="10:30"
                                    />
                                <label class="form-check-label" for="time-1030-${theatreStatus.index}">10:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1100-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="11:00"
                                    />
                                <label class="form-check-label" for="time-1100-${theatreStatus.index}">11:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1130-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="11:30"
                                    />
                                <label class="form-check-label" for="time-1130-${theatreStatus.index}">11:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1200-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="12:00"
                                    />
                                <label class="form-check-label" for="time-1200-${theatreStatus.index}">12:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1230-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="12:30"
                                    />
                                <label class="form-check-label" for="time-1230-${theatreStatus.index}">12:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1300-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="13:00"
                                    />
                                <label class="form-check-label" for="time-1300-${theatreStatus.index}">13:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1330-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="13:30"
                                    />
                                <label class="form-check-label" for="time-1330-${theatreStatus.index}">13:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1400-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="14:00"
                                    />
                                <label class="form-check-label" for="time-1400-${theatreStatus.index}">14:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1430-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="14:30"
                                    />
                                <label class="form-check-label" for="time-1430-${theatreStatus.index}">14:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1500-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="15:00"
                                    />
                                <label class="form-check-label" for="time-1500-${theatreStatus.index}">15:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1530-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="15:30"
                                    />
                                <label class="form-check-label" for="time-1530-${theatreStatus.index}">15:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1600-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="16:00"
                                    />
                                <label class="form-check-label" for="time-1600-${theatreStatus.index}">16:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1630-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="16:30"
                                    />
                                <label class="form-check-label" for="time-1630-${theatreStatus.index}">16:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1700-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="17:00"
                                    />
                                <label class="form-check-label" for="time-1700-${theatreStatus.index}">17:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1730-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="17:30"
                                    />
                                <label class="form-check-label" for="time-1730-${theatreStatus.index}">17:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1800-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="18:00"
                                    />
                                <label class="form-check-label" for="time-1800-${theatreStatus.index}">18:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1830-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="18:30"
                                    />
                                <label class="form-check-label" for="time-1830-${theatreStatus.index}">18:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1900-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="19:00"
                                    />
                                <label class="form-check-label" for="time-1900-${theatreStatus.index}">19:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-1930-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="19:30"
                                    />
                                <label class="form-check-label" for="time-1930-${theatreStatus.index}">19:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2000-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="20:00"
                                    />
                                <label class="form-check-label" for="time-2000-${theatreStatus.index}">20:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2030-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="20:30"
                                    />
                                <label class="form-check-label" for="time-2030-${theatreStatus.index}">20:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2100-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="21:00"
                                    />
                                <label class="form-check-label" for="time-2100-${theatreStatus.index}">21:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2130-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="21:30"
                                    />
                                <label class="form-check-label" for="time-2130-${theatreStatus.index}">21:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2200-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="22:00"
                                    />
                                <label class="form-check-label" for="time-2200-${theatreStatus.index}">22:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2230-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="22:30"
                                    />
                                <label class="form-check-label" for="time-2230-${theatreStatus.index}">22:30 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2300-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="23:00"
                                    />
                                <label class="form-check-label" for="time-2300-${theatreStatus.index}">23:00 </label>
                            </div>
                            <div class="form-check">
                                <input
                                    class="form-check-input"
                                    type="checkbox"
                                    id="time-2330-${theatreStatus.index}"
                                    name="time${theatre.theatre_num}"
                                    value="23:30"
                                    />
                                <label class="form-check-label" for="time-2330-${theatreStatus.index}">23:30 </label>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="mt-2">
                <button type="submit" class="btn btn-primary">Add Showtime</button>
                <button type="reset" class="btn btn-secondary">Reset</button>
            </div>
        </form>
    </div>
</div>
