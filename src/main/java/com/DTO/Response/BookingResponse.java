/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DTO.Response;

/**
 *
 * @author lebao
 */
public class BookingResponse {

    private String movieTitle;
    private String cinemaName;
    private String theatreNum;
    private String showingDatetime;
    private String timeDetail;
    private String snackName;
    private int snackQty;
    private String seatType;
    private int seatQty;

    public BookingResponse(String movieTitle, String cinemaName, String theatreNum, String showingDatetime,
            String timeDetail, String snackName, int snackQty, String seatType, int seatQty) {
        this.movieTitle = movieTitle;
        this.cinemaName = cinemaName;
        this.theatreNum = theatreNum;
        this.showingDatetime = showingDatetime;
        this.timeDetail = timeDetail;
        this.snackName = snackName;
        this.snackQty = snackQty;
        this.seatType = seatType;
        this.seatQty = seatQty;
    }

    // Getter & Setter
    public String getMovieTitle() {
        return movieTitle;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public String getTheatreNum() {
        return theatreNum;
    }

    public String getShowingDatetime() {
        return showingDatetime;
    }

    public String getTimeDetail() {
        return timeDetail;
    }

    public String getSnackName() {
        return snackName;
    }

    public int getSnackQty() {
        return snackQty;
    }

    public String getSeatType() {
        return seatType;
    }

    public int getSeatQty() {
        return seatQty;
    }
}
