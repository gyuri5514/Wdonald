package com.wdelivery.admin.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.member.payment.vo.PaymentVO;

public interface AdminDAO {
	
	public List<PaymentVO> indexView();
	
	public void addCoupon(AdminCouponVO addcoupon);
}
