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
		System.out.println("selectDessert");
		return dessertDAO.selectDessert();
	}

}
