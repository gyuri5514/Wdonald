package com.wdelivery.menu.burger.service;

import java.util.List;

import com.wdelivery.menu.burger.vo.BurgerVO;

public interface BurgerService {

	public List<BurgerVO> selectBurger();

	BurgerVO detailBurger(Integer b_code);

	BurgerVO prevBurger(int b_code);

	BurgerVO nextBurger(int b_code);

	void updateBurger(BurgerVO burgerVO);

	void deleteBurger(String b_code);

	void insertBurger(BurgerVO burgerVO);
	
	int bcodeCheck (int b_code);
}
