package com.wdelivery.admin.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;

public interface AdminDAO {
	
	public List<PaymentVO> indexView();
	

	public List<UserVO> userSelect();

	public void addCoupon(AdminCouponVO addcoupon);

}
