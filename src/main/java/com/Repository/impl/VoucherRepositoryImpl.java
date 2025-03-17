/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository.impl;

import com.Config.GetConnection;
import com.Model.Voucher;
import com.Repository.VoucherRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author lebao
 */
public class VoucherRepositoryImpl implements VoucherRepository{
    @Override
    public List<Voucher> getAllVoucherByUserId(int userId){
        List<Voucher> listVoucher = new ArrayList<>();
        String sql = "Select v.* from voucher v join user_voucher uv on uv.voucher_id = v.voucher_id where uv.user_id = ?";
        try(Connection con = GetConnection.getConnection(); PreparedStatement st = con.prepareStatement(sql)){
            st.setInt(1, userId);
            try(ResultSet rs = st.executeQuery()){
                while(rs.next()){
                    Voucher voucher = new Voucher();
                    voucher.setId(rs.getInt("voucher_id"));
                    voucher.setDescription(rs.getString("description"));
                    voucher.setDiscount(rs.getInt("discount"));
                    voucher.setName(rs.getString("voucher_name"));
                    listVoucher.add(voucher);
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return listVoucher;
    }
}
