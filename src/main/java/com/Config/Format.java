/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Config;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author lebao
 */
public class Format {
    public static SimpleDateFormat fm = new SimpleDateFormat("EEEE, dd/MM/yyyy", new Locale("en"));
    public static SimpleDateFormat fm2 = new SimpleDateFormat("yyyy-MM-dd");
    public static String Date(Date date){
        return fm.format(date);
    }
    public static void main(String[] args) throws ParseException{
        Date a = new Date();
        String b = fm.format(a);
        System.out.println(fm2.format(fm.parse(b)));
    }
}
