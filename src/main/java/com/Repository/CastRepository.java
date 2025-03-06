/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Cast;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface CastRepository {

    public boolean updateListCast(List<Cast> casts);

    public void deleteMovieCast(String movieId);
}
