/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.DTO.Response;

import java.util.LinkedHashMap;
import java.util.List;

/**
 *
 * @author lebao
 */
public class MovieResponse {

    private String title, trailer_link;
    private String age_rating, header_image, description, synopsis;
    private String poster_image;
    private Integer runtime_min;
    private String release_date;
    private String director;
    private List<String> genre;
    private List<String> cast;
    private LinkedHashMap<String, List<String>> times;
    private String status;

    public MovieResponse() {
    }

    public MovieResponse(String title, String trailer_link, String age_rating, String header_image, String description, String synopsis, String poster_image, Integer runtime_min, String release_date, String director, List<String> genre, List<String> cast, LinkedHashMap<String, List<String>> times, String status) {
        this.title = title;
        this.trailer_link = trailer_link;
        this.age_rating = age_rating;
        this.header_image = header_image;
        this.description = description;
        this.synopsis = synopsis;
        this.poster_image = poster_image;
        this.runtime_min = runtime_min;
        this.release_date = release_date;
        this.director = director;
        this.genre = genre;
        this.cast = cast;
        this.times = times;
        this.status = status;
    }

    public String getPoster_image() {
        return poster_image;
    }

    public void setPoster_image(String poster_image) {
        this.poster_image = poster_image;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public String getRelease_date() {
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public List<String> getGenre() {
        return genre;
    }

    public void setGenre(List<String> genre) {
        this.genre = genre;
    }

    public List<String> getCast() {
        return cast;
    }

    public void setCast(List<String> cast) {
        this.cast = cast;
    }

    public LinkedHashMap<String, List<String>> getTimes() {
        return times;
    }

    public void setTimes(LinkedHashMap<String, List<String>> times) {
        this.times = times;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
