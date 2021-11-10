package com.wdelivery.member.payment.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wdelivery.member.payment.dao.PaymentDAO;
import com.wdelivery.member.payment.vo.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	@Transactional
	public void insertPaidOrderList(PaymentVO paymentVO) {
		paymentDAO.insertPaidOrderList(paymentVO);
		if(paymentVO.getUser_type()!=9) {
		Map<String,Object> updateCartInfo = new HashMap<String,Object>();
		updateCartInfo.put("orderSeq", paymentDAO.selectOrderSeq(paymentVO));
		updateCartInfo.put("user_email",paymentVO.getUser_email());
		paymentDAO.updateCartList(updateCartInfo);
		}
	}

}
