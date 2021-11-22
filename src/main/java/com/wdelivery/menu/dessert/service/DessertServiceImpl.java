package com.wdelivery.menu.dessert.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.menu.dessert.dao.DessertDAO;
import com.wdelivery.menu.dessert.vo.DessertVO;

@Service
public class DessertServiceImpl implements DessertService {

	@Autowired
	public DessertDAO dessertDAO;
	
	@Override
	public List<DessertVO> selectDessert() {
		return dessertDAO.selectDessert();
	}

	@Override
	public DessertVO detailDessert(Integer dessert_code) {
		return dessertDAO.detailDessert(dessert_code);
	}

	@Override
	public void insertDessert(DessertVO dessertVO) {
		dessertDAO.insertDessert(dessertVO);
	}

}

