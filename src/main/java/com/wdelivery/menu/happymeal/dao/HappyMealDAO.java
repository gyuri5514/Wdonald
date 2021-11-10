package com.wdelivery.menu.happymeal.dao;

import java.util.List;

import com.wdelivery.menu.happymeal.vo.HappyMealVO;

public interface HappyMealDAO {
	
	public List<HappyMealVO> selectHappyMeal();
	
	HappyMealVO detailHappyMeal(Integer h_code);

}
