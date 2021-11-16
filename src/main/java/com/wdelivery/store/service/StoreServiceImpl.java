package com.wdelivery.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wdelivery.admin.vo.AdminVO;
import com.wdelivery.store.dao.StoreDAO;

@Service
public class StoreServiceImpl implements StoreService{

	@Autowired
	private StoreDAO storeDAO;
	
	@Override
	public void adminUpdate(AdminVO adminVO) {
		storeDAO.adminUpdate(adminVO);
	}

}
