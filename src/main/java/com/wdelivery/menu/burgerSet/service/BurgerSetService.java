package com.wdelivery.menu.burgerSet.service;

import java.util.List;

import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;

public interface BurgerSetService {

	public List<BurgerSetVO> selectBurgerSet();
	
	public BurgerSetVO detailBurgerSet(int b_code);
	
}
