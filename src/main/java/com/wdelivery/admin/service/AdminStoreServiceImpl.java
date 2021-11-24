package com.wdelivery.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminStoreDAO;
import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.member.payment.vo.PaymentVO;

@Service
public class AdminStoreServiceImpl implements AdminStoreService{
	
	@Autowired
	private AdminStoreDAO adminStoreDAO;
	
	@Override
	public List<AdminVO> searchStore(String searchWord) {
		return adminStoreDAO.searchStore(searchWord);
	}

	@Override
	public int selectStore(Map<String,String>map) {
		return adminStoreDAO.selectStore(map);
	}

	@Override
	public List<PaymentVO> orderList() {
		return adminStoreDAO.orderList();
	}

}
