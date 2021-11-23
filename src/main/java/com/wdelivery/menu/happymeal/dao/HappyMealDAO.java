package com.wdelivery.menu.happymeal.dao;

import java.util.List;

import com.wdelivery.menu.happymeal.vo.HappyMealVO;

public interface HappyMealDAO {
	
	public List<HappyMealVO> selectHappyMeal();
	
	public List<HappyMealVO> selectHappyMealPM();
	
	HappyMealVO detailHappyMeal(Integer h_code);

	public void insertHappyMeal(HappyMealVO happyMealVO);
	
	int hcodeCheck (int h_code);
}
