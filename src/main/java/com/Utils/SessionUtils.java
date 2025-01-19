/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author lebao
 */
public class SessionUtils {
    private static SessionUtils sessionUtil = null;
    
    public static SessionUtils getInstance(){
        if(sessionUtil == null){
            sessionUtil = new SessionUtils();
        }
        return sessionUtil;
    }
    public void remainValue(HttpServletRequest request, String key, Object value){
        request.getSession().setAttribute(key, value);
    }
    public Object getValue(HttpServletRequest request, String key){
        return request.getSession().getAttribute(key);
    }
    public void removeValue(HttpServletRequest request, String key){
        request.getSession().removeAttribute(key);
    }
}
