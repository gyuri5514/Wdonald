package com.wdelivery.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminDAO;
import com.wdelivery.member.payment.vo.PaymentVO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;


	@Override
	public List<PaymentVO> indexView() {
		return adminDAO.indexView();
	}
	
}
