/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.DTO.Request.MovieRequestDto;
import com.DTO.Response.MovieResponse;
import com.Model.Movie;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface MovieRepository {
    public List<MovieResponse> findAllMovie(String status);
    public MovieRequestDto findMovieById(String id);
    public List<MovieResponse> findMovieByCinema(String cinema);
    public MovieResponse findMovieByNameAndCinema(String name, String cinema);
    public boolean addMovie(MovieRequestDto movie);
    public boolean deleteMovieById(String id);
    public boolean updateMovie(MovieRequestDto movie, String movieId);
}
