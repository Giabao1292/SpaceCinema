/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Snack;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author lebao
 */
public interface SnackRepository {
    public LinkedHashMap<String, List<Snack>> findAllSnack();
    public Snack getSnackById(String snackId) ;
    public List<Snack> listAllSnacks();
    public void createSnack(Snack snack, String stId);
    public void updateSnack(Snack snack, String stId);
    public void deleteSnack(String id);
    public Snack findSnackById(String id);
}
