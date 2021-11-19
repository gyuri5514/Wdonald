package com.wdelivery.menu.burgerLgSet.service;

import com.wdelivery.menu.burgerLgSet.vo.BurgerLgSetVO;

public interface BurgerLgSetService {

	BurgerLgSetVO detailBurgerLgSet(int b_code);
	
	public void insertBurgerLgSet(BurgerLgSetVO burgerLgSetVO);
	
}
