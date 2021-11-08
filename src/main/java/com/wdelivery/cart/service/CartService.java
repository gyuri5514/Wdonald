package com.wdelivery.cart.service;

import java.util.List;

import com.wdelivery.cart.vo.CartVO;

public interface CartService {

	void cartInsert(CartVO cartVO);
	
	List<CartVO> cartList();
}
