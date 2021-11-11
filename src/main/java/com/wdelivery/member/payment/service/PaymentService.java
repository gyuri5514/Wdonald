package com.wdelivery.member.payment.service;

import java.util.ArrayList;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;

public interface PaymentService {

	void insertPaidOrderList(PaymentVO paymentVO, ArrayList<CartVO> cartVO);

}
