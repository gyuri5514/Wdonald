package com.wdelivery.menu.drink.service;

import java.util.List;

import com.wdelivery.menu.drink.vo.DrinkVO;

public interface DrinkService {
	
	public List<DrinkVO> selectDrink();
	
	DrinkVO detailDrink(int drink_code);
}
