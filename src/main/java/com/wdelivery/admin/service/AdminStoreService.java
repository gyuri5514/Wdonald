package com.wdelivery.admin.service;

import java.util.List;
import java.util.Map;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;

public interface AdminStoreService {
	
	List<AdminVO> searchStore(String searchWord);
	
	int selectStore(Map<String,String>map);
	
	public List<PaymentVO> orderList();
}
