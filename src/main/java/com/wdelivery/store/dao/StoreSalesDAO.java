package com.wdelivery.store.dao;

import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;

public interface StoreSalesDAO {

	public List<PaymentVO> orderList(AdminVO adminVO);
	public void orderStatus(PaymentVO paymentVO);
}
