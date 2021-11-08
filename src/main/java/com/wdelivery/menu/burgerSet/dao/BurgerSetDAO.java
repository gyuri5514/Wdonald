package com.wdelivery.menu.burgerSet.dao;

import java.util.List;

import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;

public interface BurgerSetDAO {
	
	public List<BurgerSetVO> selectBurgerSet();

	public void insertBurgerSet(BurgerSetVO burgerSetVO);
	
	public BurgerSetVO detailBurgerSet(int b_code);
}
