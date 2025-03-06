/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DTO.Request;

import java.util.List;

/**
 *
 * @author lebao
 */
public class MovieRequestDto {

    private String title, trailer_link;
    private String age_rating, header_image, discription, synopsis;
    private Integer runtime_min;
    private String release_date;
    private String banner_text;
    private String poster_image;
    private String director_name;
    private List<Integer> genres;
    private List<String> casts;
    private String status;

    public MovieRequestDto() {
    }

    public MovieRequestDto(String title, String trailer_link, String age_rating, String header_image, String discription, String synopsis, Integer runtime_min, String release_date, String banner_text, String poster_image, String director_name, List<Integer> genres, List<String> casts, String status) {
        this.title = title;
        this.trailer_link = trailer_link;
        this.age_rating = age_rating;
        this.header_image = header_image;
        this.discription = discription;
        this.synopsis = synopsis;
        this.runtime_min = runtime_min;
        this.release_date = release_date;
        this.banner_text = banner_text;
        this.poster_image = poster_image;
        this.director_name = director_name;
        this.genres = genres;
        this.casts = casts;
        this.status = status;
    }

    public List<String> getCasts() {
        return casts;
    }

    public void setCasts(List<String> casts) {
        this.casts = casts;
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

    public String getRelease_date() {
        return release_date;
    }

    public void setRelease_date(String release_date) {
        this.release_date = release_date;
    }

    public String getBanner_text() {
        return banner_text;
    }

    public void setBanner_text(String banner_text) {
        this.banner_text = banner_text;
    }

    public String getPoster_image() {
        return poster_image;
    }

    public void setPoster_image(String poster_image) {
        this.poster_image = poster_image;
    }

    public String getDirector_name() {
        return director_name;
    }

    public void setDirector_name(String director_name) {
        this.director_name = director_name;
    }

    public List<Integer> getGenres() {
        return genres;
    }

    public void setGenres(List<Integer> genres) {
        this.genres = genres;
    }

    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

}
