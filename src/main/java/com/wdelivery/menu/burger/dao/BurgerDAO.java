package com.wdelivery.menu.burger.dao;

import java.util.List;

import com.wdelivery.menu.burger.vo.BurgerVO;
import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;

public interface BurgerDAO {

	public List<BurgerVO> selectBurger();
	
	BurgerVO detailBurger(Integer b_code);
	
	BurgerVO prevBurger(Integer b_code);
	
	BurgerVO nextBurger(Integer b_code);
	
	void updateBurger(BurgerVO burgerVO);
	
	void deleteBurger(Integer b_code);
	
	void insertBurger(BurgerVO burgerVO);
	
	BurgerSetVO detailBurgerSet(Integer b_set_code); 
	
	int bcodeCheck (int b_code);
	
}
