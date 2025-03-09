/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Other/File.java to edit this template
 */
package com.Model;

/**
 *
 * @author lebao
 */
public class Theatre {

    private String id;
    private String theatre_num;

    public Theatre() {
    }

    public Theatre(String id, String theatre_num) {
        this.id = id;
        this.theatre_num = theatre_num;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTheatre_num() {
        return theatre_num;
    }

    public void setTheatre_num(String theatre_num) {
        this.theatre_num = theatre_num;
    }

}
