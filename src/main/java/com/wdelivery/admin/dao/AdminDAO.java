package com.wdelivery.admin.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.news.utils.Criteria;

public interface AdminDAO {
	
	public List<AdminVO> indexView(Criteria cri);

	public List<UserVO> userSelect(Criteria cri);
	
	public List<AdminCouponVO> selectCoupon();
	
	int couponCheck(String coupon_code);
	
	public void addCoupon(AdminCouponVO addcoupon);
	
	public void deleteUserCoupon(AdminCouponVO deleteCoupon);
	
	public void deleteCoupon(AdminCouponVO deleteCoupon);
	
	public void statusCoupon(AdminCouponVO vo);
	
	public List<AdminBannerVO> selectBannerList();

	public void bannerInsert(AdminBannerVO bannerVO);

	public List<BurgerVO> viewBurger();


}
