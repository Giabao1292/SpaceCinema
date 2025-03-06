/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.Controller.Admin;

import com.Config.Format;
import com.Config.GetConnection;
import com.DTO.Request.MovieRequestDto;
import com.DTO.Response.MovieResponse;
import com.Repository.GenreRepository;
import com.Repository.StatusRepository;
import com.Repository.impl.GenreRepositoryImpl;
import com.Repository.impl.MovieRepositoryImpl;
import com.Repository.impl.StatusRepositoryImpl;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author lebao
 */
@WebServlet(name = "ManageMovie", urlPatterns = {"/admin-home/movie"})
public class MovieController extends HttpServlet {

    private final MovieRepositoryImpl movieRes = new MovieRepositoryImpl();
    private StatusRepository statusRepository = new StatusRepositoryImpl();
    private GenreRepository genreRepository = new GenreRepositoryImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String id;
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.setAttribute("genres", genreRepository.findAllGenre());
                request.setAttribute("statusList", statusRepository.findAllStatus());
                request.getRequestDispatcher("/views/admin/movie/createMovie.jsp").forward(request, response);
                break;
            case "update":
                id = request.getParameter("movie_id");
                request.setAttribute("movie_id", id);
                request.setAttribute("genres", genreRepository.findAllGenre());
                request.setAttribute("statusList", statusRepository.findAllStatus());
                request.setAttribute("movie", movieRes.findMovieById(id));
                request.getRequestDispatcher("/views/admin/movie/updateMovie.jsp").forward(request, response);
                break;
            case "delete":
                id = request.getParameter("movie_id");
                movieRes.deleteMovieById(id);
                response.sendRedirect("/admin-home/movie");
                break;
            default:
                showListMovie(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "create":
                createMovie(request, response);
                break;
            case "update":
                updateMovie(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void showListMovie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<MovieResponse> movies = movieRes.findAllMovie("now showing");
        movies.addAll(movieRes.findAllMovie("coming soon"));
        request.setAttribute("movies", movies);
        request.getRequestDispatcher("/views/admin/movie/listMovie.jsp").forward(request, response);
    }

    private void updateMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String trailer_link = request.getParameter("trailer_link");
        String age_rating = request.getParameter("age_rating");
        String header_image = request.getParameter("header_image");
        String description = request.getParameter("description");
        String synopsis = request.getParameter("synopsis");
        Integer runtime_min = Integer.parseInt(request.getParameter("runtime_min"));
        String release_date = request.getParameter("release_date");
        String banner_text = request.getParameter("banner_text");
        String poster_image = request.getParameter("poster_image");
        String director_name = request.getParameter("director_name");
        String status = request.getParameter("status");
        String[] genreList = request.getParameterValues("genreId");
        List<Integer> genres = new ArrayList<>();
        List<String> casts = new ArrayList<>();
        if (genreList != null && genreList.length != 0) {
            genres = Arrays.stream(genreList).map(Integer::parseInt).collect(Collectors.toList());;
        }
        String[] castList = request.getParameterValues("casts");
        if (castList != null && castList.length != 0) {
            casts = Arrays.stream(request.getParameterValues("casts")).toList();
        }
        MovieRequestDto movieRequestDto = new MovieRequestDto(title, trailer_link, age_rating, header_image, description, synopsis, runtime_min, release_date, banner_text, poster_image, director_name, genres, casts, status);
        movieRes.updateMovie(movieRequestDto, request.getParameter("movie_id"));
        response.sendRedirect("/admin-home/movie");
    }

    private void createMovie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String title = request.getParameter("title");
        String trailer_link = request.getParameter("trailer_link");
        String age_rating = request.getParameter("age_rating");
        String header_image = request.getParameter("header_image");
        String description = request.getParameter("description");
        String synopsis = request.getParameter("synopsis");
        Integer runtime_min = Integer.parseInt(request.getParameter("runtime_min"));
        String release_date = request.getParameter("release_date");
        String banner_text = request.getParameter("banner_text");
        String poster_image = request.getParameter("poster_image");
        String director_name = request.getParameter("director_name");
        String status = request.getParameter("status");
        String[] genreList = request.getParameterValues("genreId");
        List<Integer> genres = new ArrayList<>();
        List<String> casts = new ArrayList<>();
        if (genreList != null && genreList.length != 0) {
            genres = Arrays.stream(genreList).map(Integer::parseInt).collect(Collectors.toList());;
        }
        String[] castList = request.getParameterValues("casts");
        if (castList != null && castList.length != 0) {
            casts = Arrays.stream(request.getParameterValues("casts")).toList();
        }
        MovieRequestDto movieRequestDto = new MovieRequestDto(title, trailer_link, age_rating, header_image, description, synopsis, runtime_min, release_date, banner_text, poster_image, director_name, genres, casts, status);
        movieRes.addMovie(movieRequestDto);
        response.sendRedirect("/admin-home/movie");
    }

    private List<String> getListDate(List<String> listDate) {
        Calendar calendar = Calendar.getInstance();
        Date today = calendar.getTime();
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        Date tomorrow = calendar.getTime();
        calendar.add(Calendar.DAY_OF_YEAR, 1);
        Date dayAfterTomorrow = calendar.getTime();
        listDate.add(Format.Date(today));
        listDate.add(Format.Date(tomorrow));
        listDate.add(Format.Date(dayAfterTomorrow));
        return listDate;
    }

}
