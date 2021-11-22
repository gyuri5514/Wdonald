package com.wdelivery.admin.dao;

import java.util.List;

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

public interface AdminDAO {
	
	public List<AdminVO> indexView();

	public List<UserVO> userSelect();
	
	public List<AdminCouponVO> selectCoupon();
	
	int couponCheck(String coupon_code);
	
	public void addCoupon(AdminCouponVO addcoupon);
	
	public void deleteUserCoupon(AdminCouponVO deleteCoupon);
	
	public void deleteCoupon(AdminCouponVO deleteCoupon);
	
	public void statusCoupon(AdminCouponVO vo);
	
	public List<AdminBoardVO> selectBoard();

	public void addBoard(AdminBoardVO addboard);
	
	public List<AdminBannerVO> selectBannerList();
	
	public void bannerInsert(AdminBannerVO bannerVO);

	public List<BurgerVO> viewBurger();
	public void burgerUpdate (BurgerVO burgerVO);
	public List<WinMorningVO> viewMorning();
	public void morningUpdate (WinMorningVO winMorningVO);
	public List<SideVO> viewSide ();
	public void sideUpdate (SideVO sideVO);
	public List<DessertVO> viewDessert();
	public void dessertUpdate (DessertVO dessertVO);
	public List<DrinkVO> viewDrink();
	public void drinkUpdate(DrinkVO drinkVO);
	public List<HappyMealVO> viewHappy();
	public void happyUpdate(HappyMealVO happyMealVO);
	public int deleteUser(UserVO userVO);

	public int suspendUser(UserVO userVO);

}
