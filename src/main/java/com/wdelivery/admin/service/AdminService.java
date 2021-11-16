package com.wdelivery.admin.service;

import java.util.List;

import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.member.payment.vo.PaymentVO;

public interface AdminService {

	public List<PaymentVO> indexView();
	
	public void addCoupon(AdminCouponVO addcoupon);
}
