package com.wdelivery.member.payment.dao;

import java.util.ArrayList;
import java.util.Map;

import com.wdelivery.cart.vo.CartVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.payment.vo.ToyCountVO;

public interface PaymentDAO {

	void insertPaidOrderList(PaymentVO paymentVO);

	int selectOrderSeq(PaymentVO paymentVO);

	void updateCartList(Map<String,Object> updateMap);

	void insertCartList(ArrayList<CartVO> cartVO);
	
	public void toyCount(ToyCountVO toyCountVO);

	void updateUserCouponStatus(PaymentVO paymentVO);
}
