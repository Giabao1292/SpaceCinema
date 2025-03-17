/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.Voucher;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface VoucherRepository {
    public List<Voucher> getAllVoucherByUserId(int userid);
} 
