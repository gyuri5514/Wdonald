package com.wdelivery.menu.burgerLgSet.dao;

import com.wdelivery.menu.burgerLgSet.vo.BurgerLgSetVO;

public interface BurgerLgSetDAO {

	BurgerLgSetVO detailBurgerLgSet(int b_code);
	
	public void insertBurgerLgSet(BurgerLgSetVO burgerLgSetVO);
	
	int bcodeCheck(int b_code);
	
}
