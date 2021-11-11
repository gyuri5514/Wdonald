package com.wdelivery.member.payment.dao;

import java.util.Map;

import com.wdelivery.member.payment.vo.PaymentVO;

public interface PaymentDAO {

	void insertPaidOrderList(PaymentVO paymentVO);

	int selectOrderSeq(PaymentVO paymentVO);

	void updateCartList(Map<String,Object> updateMap);
}
