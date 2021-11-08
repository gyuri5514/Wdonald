package com.wdelivery.cart.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.cart.dao.CartDAO;
import com.wdelivery.cart.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartDAO	cartDAO;

	@Override
	public void cartInsert(CartVO orderVO) {
		cartDAO.cartInsert(orderVO);
	}

	@Override
	public List<CartVO> cartList() {
		List<CartVO> cartList = cartDAO.cartList();
		
		return cartList;
	}
	
}
