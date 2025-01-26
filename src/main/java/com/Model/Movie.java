/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Model;

import java.util.Date;
import java.util.List;

/**
 *
 * @author lebao
 */
public class Movie {

    private String title, trailer_link;
    private String age_rating, header_image, discription, synopsis;
    private Integer runtime_min;
    private Date release_date;
    private Integer directorId;
    private Integer genreId;
    private Integer castId;
    private String statusId;

    public Movie() {
    }

    public Movie(String title, String trailer_link, String age_rating, String header_image, String discription, String synopsis, Integer runtime_min, Date release_date, Integer directorId, Integer genreId, Integer castId, String statusId) {
        this.title = title;
        this.trailer_link = trailer_link;
        this.age_rating = age_rating;
        this.header_image = header_image;
        this.discription = discription;
        this.synopsis = synopsis;
        this.runtime_min = runtime_min;
        this.release_date = release_date;
        this.directorId = directorId;
        this.genreId = genreId;
        this.castId = castId;
        this.statusId = statusId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTrailer_link() {
        return trailer_link;
    }

    public void setTrailer_link(String trailer_link) {
        this.trailer_link = trailer_link;
    }

    public String getAge_rating() {
        return age_rating;
    }

    public void setAge_rating(String age_rating) {
        this.age_rating = age_rating;
    }

    public String getHeader_image() {
        return header_image;
    }

    public void setHeader_image(String header_image) {
        this.header_image = header_image;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getSynopsis() {
        return synopsis;
    }

    public void setSynopsis(String synopsis) {
        this.synopsis = synopsis;
    }

    public Integer getRuntime_min() {
        return runtime_min;
    }

    public void setRuntime_min(Integer runtime_min) {
        this.runtime_min = runtime_min;
    }

    public Date getRelease_date() {
        return release_date;
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }

    public Integer getDirectorId() {
        return directorId;
    }

    public void setDirectorId(Integer directorId) {
        this.directorId = directorId;
    }

    public Integer getGenreId() {
        return genreId;
    }

    public void setGenreId(Integer genreId) {
        this.genreId = genreId;
    }

    public Integer getCastId() {
        return castId;
    }

    public void setCastId(Integer castId) {
        this.castId = castId;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    
    
}
