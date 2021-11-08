package com.wdelivery.menu.burgerSet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.burgerSet.dao.BurgerSetDAO;
import com.wdelivery.menu.burgerSet.vo.BurgerSetVO;

@Service
public class BurgerSetServiceImpl implements BurgerSetService {

	@Autowired
	BurgerSetDAO burgerSetDAO;
	
	@Override
	public List<BurgerSetVO> selectBurgerSet() {
		System.out.println("selectBurgerSet");
		return burgerSetDAO.selectBurgerSet();
	}
	
	@Override
	public BurgerSetVO detailBurgerSet(int b_code) {
		System.out.println("detailBurgerSet");
		return burgerSetDAO.detailBurgerSet(b_code);
	}
	
}
