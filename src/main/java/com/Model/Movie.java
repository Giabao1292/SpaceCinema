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

    private String title, trailet_link;
    private String age_rating, header_image, discription, synopsis;
    private Date release_date;
    private Director director;
    private Genre genre;
    private Cast cast;
    private MovieStatus status;
    private List<ShowingTime> showingTimes;

    public Movie() {
    }

    public Movie(String title, String trailet_link, String age_rating, String header_image, String discription, String synopsis, Date release_date, Director director, Genre genre, Cast cast, MovieStatus status) {
        this.title = title;
        this.trailet_link = trailet_link;
        this.age_rating = age_rating;
        this.header_image = header_image;
        this.discription = discription;
        this.synopsis = synopsis;
        this.release_date = release_date;
        this.director = director;
        this.genre = genre;
        this.cast = cast;
        this.status = status;
    }
    

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTrailet_link() {
        return trailet_link;
    }

    public void setTrailet_link(String trailet_link) {
        this.trailet_link = trailet_link;
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

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    public Genre getGenre() {
        return genre;
    }

    public void setGenre(Genre genre) {
        this.genre = genre;
    }

    public Cast getCast() {
        return cast;
    }

    public void setCast(Cast cast) {
        this.cast = cast;
    }

    public MovieStatus getStatus() {
        return status;
    }

    public void setStatus(MovieStatus status) {
        this.status = status;
    }

    public Date getRelease_date() {
        return release_date;
    }

    public void setRelease_date(Date release_date) {
        this.release_date = release_date;
    }
    
}
