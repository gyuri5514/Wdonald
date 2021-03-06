package com.wdelivery.store.service;

import java.io.File;
import java.util.List;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.store.chart.vo.ChartVO;

public interface StoreSalesService {
	
	public List<PaymentVO> orderList(AdminVO adminVO);
	public void orderStatus(PaymentVO paymentVO);
	public List<PaymentVO> orderCancel(String store_code);
	
}
