package com.wdelivery.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.order.dao.OrderDAO;
import com.wdelivery.order.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDAO orderDAO;

	@Override
	public void orderInsert(OrderVO orderVO) {
		orderDAO.orderInsert(orderVO);
	}

	
}
