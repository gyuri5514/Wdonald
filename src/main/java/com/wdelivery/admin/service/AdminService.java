package com.wdelivery.admin.service;

import java.util.List;

import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.paging.Criteria;

public interface AdminService {

	public List<PaymentVO> indexView();
	

	public List<UserVO> userSelect(Criteria cri);
	
	int getUserContent();

	public void addCoupon(AdminCouponVO addcoupon);

}
