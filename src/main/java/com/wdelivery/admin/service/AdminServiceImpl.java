package com.wdelivery.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminDAO;
import com.wdelivery.member.payment.vo.PaymentVO;
import com.wdelivery.member.vo.UserVO;
import com.wdelivery.paging.Criteria;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;


	@Override
	public List<PaymentVO> indexView() {
		return adminDAO.indexView();
	}

	@Override
	public List<UserVO> userSelect(Criteria cri) {
		return adminDAO.userSelect(cri);
	}

	@Override
	public int getUserContent() {
		return adminDAO.getUserContent();
	}
}
