package com.wdelivery.cart.dao;

import java.util.List;

import com.wdelivery.cart.vo.CartVO;

public interface CartDAO {
	
	void cartInsert(CartVO orderVO);
	
	List<CartVO> cartList();
}
