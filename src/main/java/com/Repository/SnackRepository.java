/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Snack;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface SnackRepository {
    public List<Snack> listAllSnacks();
    public void createSnack(Snack snack, int stId);
    public void updateSnack(Snack snack, int stId);
    public void deleteSnack(int id);
    public Snack findSnackById(int id);
}
