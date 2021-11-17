package com.wdelivery.admin.service;

import java.util.List;

import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;

public interface AdminService {

	public List<PaymentVO> indexView();
	
	public List<UserVO> userSelect();

	public List<AdminCouponVO> selectCoupon();
	
	int couponCheck(String coupon_code);
	
	public void addCoupon(AdminCouponVO addcoupon);
	
	public List<AdminBannerVO> selectBannerList();
}
