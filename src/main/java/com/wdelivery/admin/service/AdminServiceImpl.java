package com.wdelivery.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminDAO;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
 
	@Override
	public List<PaymentVO> indexView() {
		return adminDAO.indexView();
	}


	@Override
	public List<UserVO> userSelect() {
		return adminDAO.userSelect();
	}
	

	@Override
	public List<AdminCouponVO> selectCoupon(){
		List<AdminCouponVO> vo = adminDAO.selectCoupon();
		return vo;
	}
	
	@Override
	public int couponCheck(String coupon_code) {
		return adminDAO.couponCheck(coupon_code);
	}
	
	@Override
	public void addCoupon(AdminCouponVO addcoupon) {
		adminDAO.addCoupon(addcoupon);

	}


	@Override
	public List<AdminBannerVO> selectBannerList() {
		return adminDAO.selectBannerList();
	}
	
	@Override
	public void deleteCoupon(String deleteCoupon) {
		adminDAO.deleteCoupon(deleteCoupon);
	}
}
