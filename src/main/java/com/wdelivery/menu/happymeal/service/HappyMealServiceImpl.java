package com.wdelivery.menu.happymeal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.happymeal.dao.HappyMealDAO;
import com.wdelivery.menu.happymeal.vo.HappyMealVO;

@Service
public class HappyMealServiceImpl implements HappyMealService {

	@Autowired
	HappyMealDAO happyMealDAO;
	
	@Override
	public List<HappyMealVO> selectHappyMeal() {
		System.out.println("selectHappyMeal Impl");
		return happyMealDAO.selectHappyMeal();
	}

	@Override
	public HappyMealVO detailHappyMeal(Integer h_code) {
		System.out.println("detailHappyMeal Impl");
		return happyMealDAO.detailHappyMeal(h_code);
	}

}