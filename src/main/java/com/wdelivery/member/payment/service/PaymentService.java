package com.wdelivery.member.payment.service;

import java.util.ArrayList;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.payment.vo.ToyCountVO;

public interface PaymentService {

	void insertPaidOrderList(PaymentVO paymentVO, ArrayList<CartVO> cartVO);
	
	public void toyCount(ToyCountVO toyCountVO);

}
