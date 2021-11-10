package com.wdelivery.menu.happymeal.service;

import java.util.List;

import com.wdelivery.menu.happymeal.vo.HappyMealVO;

public interface HappyMealService {

	public List<HappyMealVO> selectHappyMeal();

	HappyMealVO detailHappyMeal(Integer h_code);
}
