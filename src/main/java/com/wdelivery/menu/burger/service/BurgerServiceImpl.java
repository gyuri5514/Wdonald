package com.wdelivery.menu.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.burger.dao.BurgerDAO;
import com.wdelivery.menu.burger.vo.BurgerVO;

@Service
public class BurgerServiceImpl implements BurgerService {

	@Autowired
	BurgerDAO burgerDAO;

	@Override
	public List<BurgerVO> selectBurger(){
		System.out.println("selectBurger");
		return burgerDAO.selectBurger();
	}

	@Override
	public BurgerVO detailBurger(Integer b_code) {
		System.out.println("detailBurger");
		return burgerDAO.detailBurger(b_code);
	}

	@Override
	public void updateBurger(BurgerVO burgerVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBurger(String b_code) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBurger(BurgerVO burgerVO) {
		// TODO Auto-generated method stub
		
	}

}
