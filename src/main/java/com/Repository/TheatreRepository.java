/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Theatre;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface TheatreRepository {
    public List<Theatre> getTheatreType();
    public Theatre getTheatre(String cinemaString, String movieId, String dateTime, String time);
    public List<Theatre> getListTheatreByType(String type, String[] cinema);
}
