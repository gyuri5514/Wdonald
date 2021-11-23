package com.wdelivery.menu.happymeal.service;

import java.util.List;

import com.wdelivery.menu.happymeal.vo.HappyMealVO;

public interface HappyMealService {

	public List<HappyMealVO> selectHappyMeal();
	
	public List<HappyMealVO> selectHappyMealPM();

	HappyMealVO detailHappyMeal(Integer h_code);
	
	public void insertHappyMeal(HappyMealVO happyMealVO);
	
	int hcodeCheck (int h_code);
}
