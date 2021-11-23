package com.wdelivery.menu.burgerLgSet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.burgerLgSet.dao.BurgerLgSetDAO;
import com.wdelivery.menu.burgerLgSet.vo.BurgerLgSetVO;

@Service
public class BurgerLgSetServiceImpl implements BurgerLgSetService {

	@Autowired
	private BurgerLgSetDAO burgerLgSetDAO;

	@Override
	public BurgerLgSetVO detailBurgerLgSet(int b_code) {
		return burgerLgSetDAO.detailBurgerLgSet(b_code);
	}

	@Override
	public void insertBurgerLgSet(BurgerLgSetVO burgerLgSetVO) {
		burgerLgSetDAO.insertBurgerLgSet(burgerLgSetVO);
	}

	@Override
	public int bcodeCheck(int b_code) {
		int result = burgerLgSetDAO.bcodeCheck(b_code);
		return result;
	}

}
