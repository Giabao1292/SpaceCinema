/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DTO.Response;

/**
 *
 * @author lebao
 */
public class BookingSeatDTO {

    private String title;
    private String cinemaName;
    private String theatreNum;
    private String showingDatetime;
    private String timeDetail;
    private String seatType;
    private Integer quantity;
    private double price;

    public BookingSeatDTO() {
    }

    public BookingSeatDTO(String title, String cinemaName, String theatreNum, String showingDatetime, String timeDetail, String seatType, Integer quantity, double price) {
        this.title = title;
        this.cinemaName = cinemaName;
        this.theatreNum = theatreNum;
        this.showingDatetime = showingDatetime;
        this.timeDetail = timeDetail;
        this.seatType = seatType;
        this.quantity = quantity;
        this.price = price;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

   
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCinemaName() {
        return cinemaName;
    }

    public void setCinemaName(String cinemaName) {
        this.cinemaName = cinemaName;
    }

    public String getTheatreNum() {
        return theatreNum;
    }

    public void setTheatreNum(String theatreNum) {
        this.theatreNum = theatreNum;
    }

    public String getShowingDatetime() {
        return showingDatetime;
    }

    public void setShowingDatetime(String showingDatetime) {
        this.showingDatetime = showingDatetime;
    }

    public String getTimeDetail() {
        return timeDetail;
    }

    public void setTimeDetail(String timeDetail) {
        this.timeDetail = timeDetail;
    }

    

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
