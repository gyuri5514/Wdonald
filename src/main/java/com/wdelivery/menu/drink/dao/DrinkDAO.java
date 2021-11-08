package com.wdelivery.menu.drink.dao;

import java.util.List;

import com.wdelivery.menu.drink.vo.DrinkVO;

public interface DrinkDAO {
	
	public List<DrinkVO> selectDrink();

	DrinkVO detailDrink(int drink_code);

}
