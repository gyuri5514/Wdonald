package com.wdelivery.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminDAO;
import com.wdelivery.admin.vo.AdminBannerVO;
import com.wdelivery.admin.vo.AdminBoardVO;
import com.wdelivery.admin.vo.AdminCouponVO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.dessert.vo.DessertVO;
import com.wdelivery.menu.drink.vo.DrinkVO;
import com.wdelivery.menu.happymeal.vo.HappyMealVO;
import com.wdelivery.menu.side.vo.SideVO;
import com.wdelivery.menu.winMorning.vo.WinMorningVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
 
	@Override
	public List<AdminVO> indexView() {
		return adminDAO.indexView();
	}


	@Override
	public List<UserVO> userSelect() {
		return adminDAO.userSelect();
	}
	

	@Override
	public List<AdminCouponVO> selectCoupon(){
		return adminDAO.selectCoupon();
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
	public void deleteUserCoupon(AdminCouponVO deleteCoupon) {
		adminDAO.deleteUserCoupon(deleteCoupon);
  }
	
	@Override
	public void deleteCoupon(AdminCouponVO deleteCoupon) {
		adminDAO.deleteCoupon(deleteCoupon);
  }

	@Override
	public void statusCoupon(AdminCouponVO vo) {
		adminDAO.statusCoupon(vo);
	}
	
	@Override
	public List<AdminBoardVO> selectBoard(){
		return adminDAO.selectBoard();
	}
	
	@Override
	public void addBoard(AdminBoardVO addboard) {
		adminDAO.addBoard(addboard);
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


	@Override
	public int deleteUser(UserVO userVO) {
		return adminDAO.deleteUser(userVO);
	}


	@Override
	public int supsendUser(UserVO userVO) {
		return adminDAO.suspendUser(userVO);
	}
	
}
