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
		return burgerSetDAO.selectBurgerSet();
	}
	
	@Override
	public BurgerSetVO detailBurgerSet(int b_code) {
		return burgerSetDAO.detailBurgerSet(b_code);
	}

	@Override
	public void insertBurgerSet(BurgerSetVO burgerSetVO) {
		burgerSetDAO.insertBurgerSet(burgerSetVO);
	}

	@Override
	public int bcodeCheck(int b_code) {
		int result = burgerSetDAO.bcodeCheck(b_code); 
		return result;
	}
	
}
