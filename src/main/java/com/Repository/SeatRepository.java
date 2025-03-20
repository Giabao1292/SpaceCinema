/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Seat;
import com.Model.SeatItem;
import java.util.List;
import java.util.Map;

/**
 *
 * @author lebao
 */
public interface SeatRepository {
    public List<Seat> getSeatType(String theatreId, String timedetail, String datetime);
    public Seat getSeatById(String seatId) ;
    public int decreaseSeat(Map<String, SeatItem> seats);
}
