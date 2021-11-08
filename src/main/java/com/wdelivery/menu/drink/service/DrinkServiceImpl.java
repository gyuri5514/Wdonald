package com.wdelivery.menu.drink.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.drink.dao.DrinkDAO;
import com.wdelivery.menu.drink.vo.DrinkVO;

@Service
public class DrinkServiceImpl implements DrinkService {

	@Autowired
	public DrinkDAO drinkDAO;
	
	@Override
	public List<DrinkVO> selectDrink() {
		System.out.println("selectDrink");
		return drinkDAO.selectDrink();
	}

	@Override
	public DrinkVO detailDrink(int drink_code) {
		// TODO Auto-generated method stub
		return drinkDAO.detailDrink(drink_code); 
	}

}
