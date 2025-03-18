/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Repository;

import com.Model.User;
import com.Model.Voucher;
import java.util.List;

/**
 *
 * @author lebao
 */
public interface VoucherRepository {
    public List<Voucher> getAllVoucherByUserId(int userid);
    List<Voucher> getListVoucher();
    int addVoucher(Voucher voucher);
    void addUserVoucher(List<Integer> userId, int voucherId);
    void deleteVoucherById(int id);
    Voucher getVoucherById(int id);
    void deleteUserIdByVoucherId(int voucher_id);
    void updateVoucher(Voucher voucher, int voucher_id, List<Integer> userIds);
    List<User> findAllUser();
} 
