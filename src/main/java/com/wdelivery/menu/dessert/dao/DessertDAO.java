package com.wdelivery.menu.dessert.dao;

import java.util.List;

import com.wdelivery.menu.dessert.vo.DessertVO;

public interface DessertDAO {

	public List<DessertVO> selectDessert();
	
	public DessertVO detailDessert(Integer dessert_code);
	
	public void insertDessert(DessertVO dessertVO);
	
	int dessertCodeCheck(int dessert_code);
}
