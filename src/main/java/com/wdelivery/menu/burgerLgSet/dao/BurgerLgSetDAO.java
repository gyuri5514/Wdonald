package com.wdelivery.menu.burgerLgSet.dao;

import com.wdelivery.menu.burgerLgSet.vo.BurgerLgSetVO;
import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;

public interface BurgerLgSetDAO {

	BurgerLgSetVO detailBurgerLgSet(int b_code);
	
	public void insertBurgerLgSet(BurgerLgSetVO burgerLgSetVO);
	
}
