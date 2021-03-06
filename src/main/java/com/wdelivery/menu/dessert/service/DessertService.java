package com.wdelivery.menu.dessert.service;

import java.util.List;

import com.wdelivery.menu.dessert.vo.DessertVO;

public interface DessertService {

	public List<DessertVO> selectDessert();
	
	public DessertVO detailDessert(Integer dessert_code);
	
	public void insertDessert(DessertVO dessertVO);
	
	int dessertCodeCheck(int dessert_code);
}
