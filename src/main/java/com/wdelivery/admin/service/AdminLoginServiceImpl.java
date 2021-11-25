package com.wdelivery.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.dao.AdminLoginDAO;
import com.wdelivery.admin.vo.AdminVO;

@Service
public class AdminLoginServiceImpl implements AdminLoginService {
	
	@Autowired
	private AdminLoginDAO adminLoginDAO;
	
	@Override
	public AdminVO findAdmin(AdminVO adminVO) {
		
		return adminLoginDAO.findAdmin(adminVO);
	}
	
	@Override
	public void register(AdminVO registerAdmin) throws Exception {
		adminLoginDAO.register(registerAdmin);
	}

	@Override
	public AdminVO storeUpdate(AdminVO adminVO) {
		return adminLoginDAO.storeUpdate(adminVO);
	}

	@Override
	public void storeUpdatedo(AdminVO adminVO) {
		adminLoginDAO.storeUpdatedo(adminVO);
	}
}
