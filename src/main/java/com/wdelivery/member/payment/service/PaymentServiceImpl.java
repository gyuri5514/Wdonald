package com.wdelivery.member.payment.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.dao.PaymentDAO;
import com.wdelivery.member.payment.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;

	@Override
	public void insertPaidOrderList(PaymentVO paymentVO, ArrayList<CartVO> cartVO) {
		for(CartVO c : cartVO) {
			System.out.println(c.toString());
		}
		paymentDAO.insertPaidOrderList(paymentVO);
		paymentDAO.insertCartList(cartVO);
		
	}
	/*
	 * if(paymentVO.getUser_type()!=9) { Map<String,Object> updateCartInfo = new
	 * HashMap<String,Object>(); updateCartInfo.put("orderSeq",
	 * paymentDAO.selectOrderSeq(paymentVO));
	 * updateCartInfo.put("user_email",paymentVO.getUser_email());
	 * paymentDAO.updateCartList(updateCartInfo); }
	 */
}

