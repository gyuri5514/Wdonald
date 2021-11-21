package com.wdelivery.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminDAO;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.dessert.vo.DessertVO;
import com.wdelivery.menu.drink.vo.DrinkVO;
import com.wdelivery.menu.happymeal.vo.HappyMealVO;
import com.wdelivery.menu.side.vo.SideVO;
import com.wdelivery.menu.winMorning.vo.WinMorningVO;
import com.wdelivery.news.utils.Criteria;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
 
	@Override
	public List<AdminVO> indexView(Criteria cri) {
		return adminDAO.indexView(cri);
	}


	@Override
	public List<UserVO> userSelect(Criteria cri) {
		return adminDAO.userSelect(cri);
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
	public void addUserCoupon(AdminCouponVO addUserCoupon) {
		adminDAO.addUserCoupon(addUserCoupon);
	}
	
	@Override
	public void deleteUserCoupon(AdminCouponVO deleteCoupon) {
		adminDAO.deleteUserCoupon(deleteCoupon);
  }
	
	@Override
	public void deleteCoupon(AdminCouponVO deleteCoupon) {
		adminDAO.deleteCoupon(deleteCoupon);
  }

	@Override
	public List<AdminBannerVO> selectBannerList() {
		return adminDAO.selectBannerList();
	}

	@Override
	public void bannerInsert(AdminBannerVO bannerVO) {
		adminDAO.bannerInsert(bannerVO);
}
	
	@Override
	public List<BurgerVO> viewBurger() {
		return adminDAO.viewBurger();
	}

	@Override
	public void burgerUpdate(BurgerVO burgerVO) {
		adminDAO.burgerUpdate(burgerVO);
	}


	@Override
	public List<WinMorningVO> viewMorning() {
		return adminDAO.viewMorning();
	}


	@Override
	public void morningUpdate(WinMorningVO winMorningVO) {
		adminDAO.morningUpdate(winMorningVO);
	}

	@Override
	public List<SideVO> viewSide() {
		return adminDAO.viewSide();
	}


	@Override
	public void sideUpdate(SideVO sideVO) {
		adminDAO.sideUpdate(sideVO);
	}


	@Override
	public List<DessertVO> viewDessert() {
		return adminDAO.viewDessert();
	}


	@Override
	public void dessertUpdate(DessertVO dessertVO) {
		adminDAO.dessertUpdate(dessertVO);
	}


	@Override
	public List<DrinkVO> viewDrink() {
		return adminDAO.viewDrink();
	}


	@Override
	public void drinkUpdate(DrinkVO drinkVO) {
		adminDAO.drinkUpdate(drinkVO);
	}


	@Override
	public List<HappyMealVO> viewHappy() {
		return adminDAO.viewHappy();
	}


	@Override
	public void happyUpdate(HappyMealVO happyMealVO) {
		adminDAO.happyUpdate(happyMealVO);
	}
	
}
