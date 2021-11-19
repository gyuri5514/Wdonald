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
		paymentDAO.insertPaidOrderList(paymentVO);
		paymentDAO.insertCartList(cartVO);
	}
}

