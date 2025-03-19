/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Seat;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface SeatRepository {
    public List<Seat> getSeatType(String theatreId);
     public Seat getSeatById(String seatId) ;
     public int decreaseSeat(String seatId, int quantity);
}
