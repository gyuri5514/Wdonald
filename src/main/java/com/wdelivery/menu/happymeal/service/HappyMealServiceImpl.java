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
		return happyMealDAO.selectHappyMeal();
	}

	@Override
	public HappyMealVO detailHappyMeal(Integer h_code) {
		return happyMealDAO.detailHappyMeal(h_code);
	}

	@Override
	public List<HappyMealVO> selectHappyMealPM() {
		return happyMealDAO.selectHappyMealPM();
	}

	@Override
	public void insertHappyMeal(HappyMealVO happyMealVO) {
		happyMealDAO.insertHappyMeal(happyMealVO);
	}

	@Override
	public int hcodeCheck(int h_code) {
		int result = happyMealDAO.hcodeCheck(h_code);
		return result;
	}
}
