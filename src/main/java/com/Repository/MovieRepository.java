/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.DTO.Response.MovieResponse;
import com.Model.Movie;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface MovieRepository {
    public List<MovieResponse> findAllMovie();
    public Movie findMovieById(int id);
    public List<MovieResponse> findMovieByCinema(String cinema);
}
